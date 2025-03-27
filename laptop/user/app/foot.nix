{ pkgs, ... }:

{
    programs.foot = {
        enable = true;
        package = pkgs.foot;
        settings = {
            main = {
                shell = "fish";
                # login-shell = "no";
                term = "xterm-256color";

                # app-id = "foot";
                # title = "foot";
                # locked-title = no;

                font = "SpaceMono Nerd Font:size=11";
                # font-bold = "<bold variant of regular font>";
                # font-italic = "<italic variant of regular font>";
                # font-bold-italic = "<bold+italic variant of regular font>";
                # font-size-adjustment = 0.5;
                # line-height = <font metrics>;
                # letter-spacing = 0;
                # horizontal-letter-offset = 0;
                # vertical-letter-offset = 0;
                # underline-offset = <font metrics>;
                # underline-thickness = <font underline thickness>;
                # strikeout-thickness = <font strikeout thickness>;
                # box-drawings-uses-font-glyphs = "no";
                # dpi-aware = "no";

                # initial-window-size-pixels = "700x500";
                # initial-window-size-chars = "<COLSxROWS>";
                # initial-window-mode = "windowed";
                pad = "25x25";
                # resize-by-cells = "yes";
                # resize-keep-grid = "yes";
                # resize-delay-ms = "100";

                # bold-text-in-bright = "no";
                # word-delimiters = '',│`|:"'()[]{}<>'';
                # selection-target = "primary";
                # workers = <number of logical CPUs>;
                # utmp-helper = "/usr/lib/utempter/utempter";
                # utmp-helper = "/usr/libexec/ulog-helper";
            };
            environment = {
                # name = "value";
            };
            # security = {
                # osc52 = "enabled";
            # };
            bell = {
                # system = "yes";
                # urgent = "no";
                # notify = "notify-send -a ${app-id} -i ${app-id} ${title} ${body}";
                # visual = "no";
                # command = "";
                # command-focused = "no";
            };
            desktop-notifications = {
                # command = "notify-send --wait --app-name ${app-id} --icon ${app-id} --category ${category} --urgency ${urgency} --expire-time ${expire-time} --hint STRING:image-path:${icon} --hint BOOLEAN:suppress-sound:${muted} --hint STRING:sound-name:${sound-name} --replace-id ${replace-id} ${action-argument} --print-id -- ${title} ${body}";
                # command-action-argument = "--action ${action-name}=${action-label}";
                # close = "";
                # inhibit-when-focused = "yes";
            };
            scrollback = {
                lines = 10000;
                # multiplier = 3.0;
                # indicator-position = "relative";
                # indicator-format = "";
            };
            url = {
                # launch = "xdg-open ${url}";
                # label-letters = "sadfjklewcmpgh";
                # osc8-underline = "url-mode";
                # regex = (([a-z][[:alnum:]-]+:(/{1,3}|[a-z0-9%])|www[:digit:]{0,3}[.])([^[:space:](){}<>]+|\(([^[:space:](){}<>]+|(\([^[:space:](){}<>]+\)))*\)|\[([^]\[[:space:](){}<>]+|(\[[^]\[[:space:](){}<>]+\]))*\])+(\(([^[:space:](){}<>]+|(\([^[:space:](){}<>]+\)))*\)|\[([^]\[[:space:](){}<>]+|(\[[^]\[[:space:](){}<>]+\]))*\]|[^]\[[:space:]`!(){};:'".,<>?«»""'']))

                # You can define your own regex's, by adding a section called
                # 'regex:<ID>' with a 'regex' and 'launch' key. These can then be tied
                # to a key-binding. See foot.ini(5) for details

                # [regex:your-fancy-name]
                # regex = "<a POSIX-Extended Regular Expression>";
                # launch = "<path to script or application> ${match}";
                #
                # [key-bindings]
                # regex-launch = "[your-fancy-name] Control+Shift+q";
                # regex-copy = "[your-fancy-name] Control+Alt+Shift+q";
            };
            cursor = {
                style = "beam";
                # color = "<inverse foreground/background>";
                blink = "yes";
                # blink-rate = 500;
                # beam-thickness = 1.5;
                # underline-thickness = <font underline thickness>;
            };
            mouse = {
                # hide-when-typing = "no";
                # alternate-scroll-mode = "yes";
            };
            touch = {
                # long-press-delay = 400;
            };
            colors = {
                # alpha = 1.0;
                # background = "242424";
                # foreground = "ffffff";
                # flash = "7f7f00";
                # flash-alpha = 0.5;

                ## Normal/regular colors (color palette 0-7)
                # regular0 = "242424";  # black
                # regular1 = "f62b5a";  # red
                # regular2 = "47b413";  # green
                # regular3 = "e3c401";  # yellow
                # regular4 = "24acd4";  # blue
                # regular5 = "f2affd";  # magenta
                # regular6 = "13c299";  # cyan
                # regular7 = "e6e6e6";  # white

                ## Bright colors (color palette 8-15)
                # bright0 = "616161";   # bright black
                # bright1 = "ff4d51";   # bright red
                # bright2 = "35d450";   # bright green
                # bright3 = "e9e836";   # bright yellow
                # bright4 = "5dc5f8";   # bright blue
                # bright5 = "feabf2";   # bright magenta
                # bright6 = "24dfc4";   # bright cyan
                # bright7 = "ffffff";   # bright white

                ## dimmed colors (see foot.ini(5) man page)
                # dim0 = <not set>;
                # ...
                # dim7 = <not-set>;

                ## The remaining 256-color palette
                # 16 = <256-color palette #16>;
                # ...
                # 255 = <256-color palette #255>;

                ## Sixel colors
                # sixel0 = "000000";
                # sixel1 = "3333cc";
                # sixel2 = "cc2121";
                # sixel3 = "33cc33";
                # sixel4 = "cc33cc";
                # sixel5 = "33cccc";
                # sixel6 = "cccc33";
                # sixel7 = "878787";
                # sixel8 = "424242";
                # sixel9 = "545499";
                # sixel10 = "994242";
                # sixel11 = "549954";
                # sixel12 = "995499";
                # sixel13 = "549999";
                # sixel14 = "999954";
                # sixel15 = "cccccc";

                ## Misc colors
                # selection-foreground = <inverse foreground/background>;
                # selection-background = <inverse foreground/background>;
                # jump-labels = <regular0> <regular3>;          # black-on-yellow
                # scrollback-indicator = <regular0> <bright4>;  # black-on-bright-blue
                # search-box-no-match = <regular0> <regular1>;  # black-on-red
                # search-box-match = <regular0> <regular3>;     # black-on-yellow
                # urls = <regular3>;
            };
            csd = {
                # preferred = "server";
                # size = 26;
                # font = "<primary font>";
                # color = "<foreground color>";
                # hide-when-maximized = "no";
                # double-click-to-maximize = "yes";
                # border-width = 0;
                # border-color = "<csd.color>";
                # button-width = 26;
                # button-color = "<background color>";
                # button-minimize-color = "<regular4>";
                # button-maximize-color = "<regular2>";
                # button-close-color = "<regular1>";
            };
            key-bindings = {
                scrollback-up-page = "Page_Up";
                # scrollback-up-half-page = "none";
                # scrollback-up-line = "none";
                scrollback-down-page = "Page_Down";
                # scrollback-down-half-page = "none";
                # scrollback-down-line = "none";
                # scrollback-home = "none";
                # scrollback-end = "none";
                clipboard-copy = "Control+c XF86Copy";
                clipboard-paste = "Control+v XF86Paste";
                # primary-paste = "Shift+Insert";
                search-start = "Control+f";
                # font-increase = "Control+plus Control+equal Control+KP_Add";
                # font-decrease = "Control+minus Control+KP_Subtract";
                # font-reset = "Control+0 Control+KP_0";
                # spawn-terminal = "Control+Shift+n";
                # minimize = "none";
                # maximize = "none";
                # fullscreen = "none";
                # pipe-visible = ''[sh -c "xurls | fuzzel | xargs -r firefox"] none'';
                # pipe-scrollback = ''[sh -c "xurls | fuzzel | xargs -r firefox"] none'';
                # pipe-selected = "[xargs -r firefox] none";
                # pipe-command-output = "[wl-copy] none"; # Copy last command's output to the clipboard
                # show-urls-launch = "Control+Shift+o";
                # show-urls-copy = "none";
                # show-urls-persistent = "none";
                # prompt-prev = "Control+Shift+z";
                # prompt-next = "Control+Shift+x";
                # unicode-input = "Control+Shift+u";
                # noop = "none";
                # quit= "none";
            };
            search-bindings = {
                cancel = "Control+g Escape";
                # commit = "Return KP_Enter";
                find-prev = "Shift+F3";
                find-next = "F3"; 
                # cursor-left = "Left Control+b";
                # cursor-left-word = "Control+Left Mod1+b";
                # cursor-right = "Right Control+f";
                # cursor-right-word = "Control+Right Mod1+f";
                # cursor-home = "Home Control+a";
                # cursor-end = "End Control+e";
                # delete-prev = "BackSpace";
                # delete-prev-word = "Mod1+BackSpace Control+BackSpace";
                # delete-next = "Delete";
                # delete-next-word = "Mod1+d Control+Delete";
                # extend-char = "Shift+Right";
                # extend-to-word-boundary = "Control+w Control+Shift+Right";
                # extend-to-next-whitespace = "Control+Shift+w";
                # extend-line-down = "Shift+Down";
                # extend-backward-char = "Shift+Left";
                # extend-backward-to-word-boundary = "Control+Shift+Left";
                # extend-backward-to-next-whitespace = "none";
                # extend-line-up = "Shift+Up";
                # clipboard-paste = "Control+v Control+Shift+v Control+y XF86Paste";
                # primary-paste = "Shift+Insert";
                # unicode-input = "none";
                # scrollback-up-page = "Shift+Page_Up Shift+KP_Page_Up";
                # scrollback-up-half-page = "none";
                # scrollback-up-line = "none";
                # scrollback-down-page = "Shift+Page_Down Shift+KP_Page_Down";
                # scrollback-down-half-page = "none";
                # scrollback-down-line = "none";
                # scrollback-home = "none";
                # scrollback-end = "none";
            };
            url-bindings = {
                # cancel = "Control+g Control+c Control+d Escape"
                # toggle-url-visible = "t";
            };
            text-bindings = {
                # \x03 = "Mod4+c"  # Map Super+c -> Ctrl+c
            };
            mouse-bindings = {
                # scrollback-up-mouse = "BTN_WHEEL_BACK";
                # scrollback-down-mouse = "BTN_WHEEL_FORWARD";
                # font-increase = "Control+BTN_WHEEL_BACK";
                # font-decrease = "Control+BTN_WHEEL_FORWARD";
                # selection-override-modifiers = "Shift";
                # primary-paste = "BTN_MIDDLE";
                # select-begin = "BTN_LEFT";
                # select-begin-block = "Control+BTN_LEFT";
                # select-extend = "BTN_RIGHT";
                # select-extend-character-wise = "Control+BTN_RIGHT";
                # select-word = "BTN_LEFT-2";
                # select-word-whitespace = "Control+BTN_LEFT-2";
                # select-quote = "BTN_LEFT-3";
                # select-row = "BTN_LEFT-4";

                # vim: ft = "dosini";
            };  
        };
    };
}