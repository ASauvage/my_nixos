{ pkgs, userSettings, ... }:

{
    home.packages = with pkgs; [
        nitch
        # starfetch
        cava
        pipes
        timer
        bat
        unzip
        wl-clipboard
        wev
        jq
        (pkgs.writeShellScriptBin "airplane-mode" ''
            #!/bin/sh
            
            connectivity="$(nmcli n connectivity)"
            if [ "$connectivity" == "full" ]
            then
                nmcli n off
            else
                nmcli n on
            fi
        '')
        (pkgs.writeScriptBin "rebuild" ''
            #!/bin/sh

            function show_help() {
                echo "Usage: $0 [arguments]"
                echo ""
                echo "Arguments:"
                echo "  help             Display this help message"
                echo "  home             Performs a home-manager switch"
                echo "  system           Performs a nixos-rebuild switch"
                echo "  all              Performs both a nixos-rebuild switch and a home-manager switch"
            }

            function rebuild_home() {
                home-manager switch -b bak --flake ${userSettings.dotfilesDir}/desktop#user
            }

            function rebuild_system() {
                sudo nixos-rebuild switch --flake ${userSettings.dotfilesDir}/desktop#system
            }

            while [[ $# -gt 0 ]]; do
                case "$1" in
                    help)
                        show_help
                        exit 0
                        ;;
                    home)
                        rebuild_home
                        exit 0
                        ;;
                    system)
                        rebuild_system
                        exit 0
                        ;;
                    all)
                        rebuild_system
                        rebuild_home
                        exit 0
                        ;;
                    *)
                        echo "Unknown option: $1"
                        show_help
                        exit 1
                        ;;
                esac
            done
        '')
        (pkgs.writeScriptBin "update-dotfiles" ''
            #!/bin/sh
            cd ${userSettings.dotfilesDir}
            git pull
            exit 0
        '')
        (pkgs.writeScriptBin "hyprkeybinds" ''
            #!/usr/bin/env python3

            import os
            import re
            import json

            CONFIG = f"{os.getenv('HOME')}/.config/hypr"
            files = [f"{CONFIG}/hyprland.conf"]

            categories_dict: dict[str, str] = {}
            variables_dict: dict[str, str] = {}

            category_pattern = r"\n#! @(\w+): (.+)"
            variable_pattern = r"\n\$(\w+)\s*=\s*(.*)"
            text = ""
            bindings: dict[str, dict[str, str]] = {}


            def extract_category_and_description(line: str) -> tuple[str | None, str | None, tuple | None]:
                pattern2 = r'bind\s*=\s*.*! @description:\s*"((?:[^"]|\\")*)"\s*;\s*@(\w+);\s*@replace\s*"([^"]*)"\s*>\s*"([^"]*)";.*'
                pattern = r'bind\s*=\s*.*! @description:\s*"((?:[^"]|\\")*)"\s*;\s*@(\w+);.*'

                match = re.search(pattern, line)
                match2 = re.search(pattern2, line)
                if match2:
                    description = match2.group(1).strip().replace('\\"', '"')
                    replace_from = match2.group(3).strip().upper()
                    replace_to = match2.group(4).strip().upper()
                    category = match2.group(2).strip()

                    if category not in categories_dict:
                        return None, None, None

                    return description, category, (replace_from, replace_to)
                elif match:
                    description = match.group(1).strip().replace('\\"', '"')
                    category = match.group(2).strip()

                    if category not in categories_dict:
                        return None, None, None

                    return description, category, None
                else:
                    return None, None, None


            def extract_binding(line: str):
                line = line.replace(" =", "=")
                if not line.startswith("bind="):
                    return
                line = line.lstrip("bind=").strip().upper().replace("super_l", "")
                _bindings = line.split(",")
                bindings = ' '.join([_bindings[0].strip(), _bindings[1].strip()])
                return bindings


            def replace_variable(match: re.Match[str]):
                var_name = match.group(1)
                return variables_dict.get(var_name, match.group(0))


            def load_categories(content: str):
                matches = re.findall(category_pattern, content)

                for key, value in matches:
                    categories_dict[key] = value
                    bindings[value] = {}
                return content


            def load_sources(file: str):
                variables = list()
                with open(file) as f:
                    content = f.read()
                for line in content.split("\n"):
                    line = line.replace(" = ", "=")

                    if line.startswith("$"):
                        variables = line.split('=')
                    if not line.startswith("source="):
                        continue
                    if variables[0] in line:
                        line = line.replace(variables[0], variables[1])
                    file = os.path.expanduser(line.replace("source=", ""))
                    if file not in files:
                        files.append(file)


            def load_variables(content: str):
                matches = re.findall(variable_pattern, content)

                for var_name, var_value in matches:
                    variables_dict[var_name] = var_value

                content_lines = content.split("\n")
                content_lines = [
                    line for line in content_lines if not line.startswith("$")
                    ]
                content = "\n".join(content_lines)
                return content


            def load_file(file: str):
                global text
                with open(file) as f:
                    content = f.read()

                content = load_categories(content)
                content = load_variables(content)

                # remove comments
                content = re.sub(r'^#.*$\n', ''', content, flags=re.MULTILINE)
                text += f"\n{content}"


            def load():
                global text, bindings
                text = re.sub(r"\$(\w+)", replace_variable, text)
                for line in text.split('\n'):
                    if not line.replace(" ", "").startswith("bind="):
                        continue

                    description, category, replace = extract_category_and_description(line)
                    if category is None or description is None:
                        continue

                    binding = extract_binding(line)
                    if binding is None:
                        continue

                    category_name = categories_dict[category]
                    if category_name not in bindings:
                        bindings[category_name] = {}

                    if replace is not None:
                        binding = binding.replace(*replace)

                    bindings[category_name][binding.strip()] = description.strip()

            def rofi_format():
                binds_as_text = ""

                for categories, binds in bindings.items():
                    for key, desc in binds.items():
                        binds_as_text += f"<span weight='heavy'>{key.replace("SUPER", " ")}</span>: {desc} <span font='10' style='italic'>({categories})</span>\n"

                return binds_as_text


            while True:
                old_list = files
                for file in files:
                    load_sources(file)
                if old_list == files:
                    break

            for file in files:
                load_file(file)
            load()

            # print(json.dumps(bindings, indent=4))
            print(rofi_format())
        '')
    ];
}