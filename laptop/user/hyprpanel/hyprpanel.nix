{ inputs, pkgs, ... }:

{
    imports = [
        inputs.hyprpanel.homeManagerModules.hyprpanel
    ];

    programs.hyprpanel = {
        # Enable the module.
        enable = true;

        # Add '/nix/store/.../hyprpanel' to your
        # Hyprland config 'exec-once'.
        hyprland.enable = false;

        # Fix the overwrite issue with HyprPanel.
        # See below for more information.
        # Default: false
        overwrite.enable = true;

        # Import a theme from './themes/*.json'.
        # Default: ""
        theme = "";

        # Override the final config with an arbitrary set.
        # Useful for overriding colors in your selected theme.
        # Default: {}
        override = {
            theme.bar.menus.text = "#123ABC";
        };

        # Configure bar layouts for monitors.
        # See 'https://hyprpanel.com/configuration/panel.html'.
        # Default: null
        layout = {
            "bar.layouts" = {
                "0" = {
                    left = ["dashboard" "workspaces" "windowtitle"];
                    middle = ["media"];
                    right = ["systray" "bluetooth" "network" "volume" "battery" "clock" "notifications"];
                };
                "1" = {
                    left = ["dashboard" "workspaces" "windowtitle"];
                    middle = ["media"];
                    right = ["volume" "clock" "notifications"];
                };
                "2" = {
                    left = ["dashboard" "workspaces" "windowtitle"];
                    middle = ["media"];
                    right = ["volume" "clock" "notifications"];
                };
            };
        };

        # Configure and theme almost all options from the GUI.
        # Options that require '{}' or '[]' are not yet implemented,
        # except for the layout above.
        # See 'https://hyprpanel.com/configuration/settings.html'.
        # Default: <same as gui>
        settings = {
            bar = {
                autoHide = "never";
                battery = {
                    hideLabelWhenFull = false;
                    label = true;
                    middleClick = "";
                    rightClick = "";
                    scrollDown = "brightnessctl s 10%-";
                    scrollUp = "brightnessctl s 10%+";
                };
                bluetooth = {
                    label = false;
                    middleClick = "";
                    rightClick = ''bluetoothctl power ''$(bluetoothctl show | grep -q "Powered: yes" && echo off || echo on)'';
                    scrollDown = "";
                    scrollUp = "";
                };
                clock = {
                    format = "%d/%m/%y  %H:%M";
                    icon = "󰸗";
                    middleClick = "";
                    rightClick = "";
                    scrollDown = "";
                    scrollUp = "";
                    showIcon = false;
                    showTime = true;
                };
                customModules = {
                    cpu = {
                        icon = "";
                        label = true;
                        leftClick = "";
                        middleClick = "";
                        pollingInterval = 2000;
                        rightClick = "";
                        round = true;
                        scrollDown = "";
                        scrollUp = "";
                    };
                    cpuTemp = {
                        icon = "";
                        label = true;
                        leftClick = "";
                        middleClick = "";
                        pollingInterval = 2000;
                        rightClick = "";
                        round = true;
                        scrollDown = "";
                        scrollUp = "";
                        sensor = "";
                        showUnit = true;
                        unit = "metric";
                    };
                    hypridle = {
                        label = true;
                        middleClick = "";
                        offIcon = "";
                        offLabel = "Off";
                        onIcon = "";
                        onLabel = "On";
                        pollingInterval = 2000;
                        rightClick = "";
                        scrollDown = "";
                        scrollUp = "";
                    };
                    hyprsunset = {
                        label = true;
                        middleClick = "";
                        offIcon = "󰛨";
                        offLabel = "Off";
                        onIcon = "󱩌";
                        onLabel = "On";
                        pollingInterval = 2000;
                        rightClick = "";
                        scrollDown = "";
                        scrollUp = "";
                        temperature = "6000k";
                    };
                    kbLayout = {
                        icon = "󰌌";
                        label = true;
                        labelType = "code";
                        leftClick = "";
                        middleClick = "";
                        rightClick = "";
                        scrollDown = "";
                        scrollUp = "";
                    };
                    netstat = {
                        dynamicIcon = false;
                        icon = "󰖟";
                        label = true;
                        labelType = "full";
                        leftClick = "";
                        middleClick = "";
                        networkInLabel = "↓";
                        networkInterface = "";
                        networkOutLabel = "↑";
                        pollingInterval = 2000;
                        rateUnit = "auto";
                        rightClick = "";
                        round = true;
                    };
                    power = {
                        icon = "";
                        leftClick = "menu:powerdropdown";
                        middleClick = "";
                        rightClick = "";
                        scrollDown = "";
                        scrollUp = "";
                        showLabel = true;
                    };
                    microphone = {
                        label = true;
                        mutedIcon = "󰍭";
                        unmutedIcon = "󰍬";
                        leftClick = "menu:audio";
                        rightClick = "";
                        middleClick = "";
                        scrollUp = "";
                        scrollDown = "";
                    };
                    ram = {
                        icon = "";
                        label = true;
                        labelType = "percentage";
                        leftClick = "";
                        middleClick = "";
                        pollingInterval = 2000;
                        rightClick = "";
                        round = true;
                    };
                    scrollSpeed = 5;
                    storage = {
                        icon = "󰋊";
                        label = true;
                        labelType = "percentage";
                        leftClick = "";
                        middleClick = "";
                        pollingInterval = 2000;
                        rightClick = "";
                        round = false;
                    };
                    submap = {
                        disabledIcon = "󰌌";
                        disabledText = "Submap off";
                        enabledIcon = "󰌐";
                        enabledText = "Submap On";
                        label = true;
                        leftClick = "";
                        middleClick = "";
                        rightClick = "";
                        scrollDown = "";
                        scrollUp = "";
                        showSubmapName = true;
                    };
                    updates = {
                        autoHide = false;
                        icon = {
                            pending = "󰏗";
                            updated = "󰏖";
                        };
                        label = true;
                        leftClick = "";
                        middleClick = "";
                        padZero = true;
                        pollingInterval = 1440000;
                        rightClick = "";
                        scrollDown = "";
                        scrollUp = "";
                        updateCommand = "";
                    };
                    weather = {
                        label = true;
                        leftClick = "";
                        middleClick = "";
                        rightClick = "";
                        scrollDown = "";
                        scrollUp = "";
                        unit = "imperial";
                    };
                };
                launcher = {
                    autoDetectIcon = false;
                    icon = "";
                    middleClick = "";
                    rightClick = "";
                    scrollDown = "";
                    scrollUp = "";
                };
                media = {
                    format = "{artist: - }{title}";
                    middleClick = "";
                    rightClick = "";
                    scrollDown = "";
                    scrollUp = "";
                    show_active_only = true;
                    show_label = true;
                    truncation = true;
                    truncation_size = 45;
                };
                network = {
                    label = true;
                    middleClick = "";
                    rightClick = "";
                    scrollDown = "";
                    scrollUp = "";
                    showWifiInfo = true;
                    truncation = true;
                    truncation_size = 15;
                };
                notifications = {
                    hideCountWhenZero = false;
                    middleClick = "";
                    rightClick = "";
                    scrollDown = "";
                    scrollUp = "";
                    show_total = false;
                };
                scrollSpeed = 5;
                volume = {
                    label = false;
                    middleClick = "";
                    rightClick = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                    scrollDown = "${package}/bin/hyprpanel vol -5";
                    scrollUp = "${package}/bin/hyprpanel vol +5";
                };
                windowtitle = {
                    class_name = true;
                    custom_title = true;
                    icon = true;
                    label = true;
                    leftClick = "";
                    middleClick = "";
                    rightClick = "";
                    scrollDown = "";
                    scrollUp = "";
                    truncation = true;
                    truncation_size = 50;
                };
                workspaces = {
                    applicationIconEmptyWorkspace = "";
                    applicationIconFallback = "󰣆";
                    applicationIconOncePerWorkspace = true;
                    hideUnoccupied = true;
                    icons = {
                        active = "";
                        available = "";
                        occupied = "";
                    };
                    ignored = "";
                    monitorSpecific = true;
                    numbered_active_indicator = "underline";
                    reverse_scroll = false;
                    scroll_speed = 5;
                    showAllActive = true;
                    showApplicationIcons = false;
                    showWsIcons = false;
                    show_icons = false;
                    show_numbered = false;
                    spacing = 1;
                    workspaceMask = false;
                    workspaces = 5;
                };
            };
            dummy = true;
            hyprpanel = {
                restartAgs = true;
                restartCommand = "${pkgs.procps}/bin/pkill -u $USER -USR1 hyprpanel; ${package}/bin/hyprpanel";
            };
            menus = {
                clock = {
                    time = {
                        hideSeconds = false;
                        military = true;
                    };
                    weather = {
                        enabled = true;
                        interval = 60000;
                        # https://www.weatherapi.com/my/
                        key = "";
                        location = "Paris";
                        unit = "imperial";
                    };
                };
                dashboard = {
                    controls = {
                        enabled = true;
                    };
                    directories = {
                        enabled = true;
                        left = {
                            directory1 = {
                                command = "bash -c \"nautilus $HOME/Downloads/\"";
                                label = "󰉍 Downloads";
                            };
                            directory2 = {
                                command = "bash -c \"nautilus $HOME/Media/Videos/\"";
                                label = "󰉏 Videos";
                            };
                            directory3 = {
                                command = "bash -c \"nautilus $HOME/repositories/\"";
                                label = "󰚝 Repositories";
                            };
                        };
                        right = {
                            directory1 = {
                                command = "bash -c \"nautilus $HOME/Documents/\"";
                                label = "󱧶 Documents";
                            };
                            directory2 = {
                                command = "bash -c \"nautilus $HOME/Media/Pictures/\"";
                                label = "󰉏 Pictures";
                            };
                            directory3 = {
                                command = "bash -c \"nautilus $HOME/\"";
                                label = "󱂵 Home";
                            };
                        };
                    };
                    powermenu = {
                        avatar = {
                            image = "$HOME/.face.icon";
                            name = "system"
                        };
                        confirmation = true;
                        logout = "hyprctl dispatch exit";
                        reboot = "systemctl reboot";
                        shutdown = "systemctl poweroff";
                        sleep = "systemctl suspend";
                    };
                    shortcuts = {
                        enable = true;
                        left = {
                            shortcut1 = {
                                command = "firefox";
                                icon = "󰈹";
                                tooltip = "Firefox";
                            };
                            shortcut2 = {
                                command = "spotify-launcher";
                                icon = "";
                                tooltip = "Spotify";
                            };
                            shortcut3 = {
                                command = "webcord";
                                icon = "";
                                tooltip = "Discord";
                            };
                            shortcut4 = {
                                command = "rofi -show drun";
                                icon = "";
                                tooltip = "Search Apps";
                            };
                        };
                        right = {
                            shortcut1 = {
                                command = "sleep 0.5 && hyprpicker -a";
                                icon = "";
                                tooltip = "Color Picker";
                            };
                            shortcut3 = {
                                command = "sleep 0.5 && hyprshot -m region";
                                icon = "󰄀";
                                tooltip = "Screenshot";
                            };
                        };
                    };
                    stats = {
                        enable_gpu = false;
                        enabled = true;
                        interval = 2000;
                    };
                };
                media = {
                    displayTime = false;
                    displayTimeTooltip = false;
                    hideAlbum = false;
                    hideAuthor = false;
                    noMediaText = "No Media Currently Playing";
                };
                power = {
                    confirmation = false;
                    logout = "hyprctl dispatch exit";
                    lowBatteryNotification = false;
                    lowBatteryNotificationText = "Your battery is running low ($POWER_LEVEL %).\\n\\nPlease plug in your charger.";
                    lowBatteryNotificationTitle = "Warning: Low battery";
                    lowBatteryThreshold = 20;
                    reboot = "systemctl reboot";
                    showLabel = true;
                    shutdown = "systemctl poweroff";
                    sleep = "systemctl suspend";
                };
                transition = "crossfade";
                transitionTime = 200;
                volume = {
                    raiseMaximumVolume = false;
                };
            };
            notifications = {
                active_monitor = true;
                cache_actions = true;
                clearDelay = 100;
                displayedTotal = 10;
                monitor = 0;
                position = "top right";
                showActionsOnHover = false;
                timeout = 7000;
            };
            scalingPriority = "gdk";
            tear = false;
            terminal = "$TERM";
            theme = {
                bar = {
                    border = {
                        location = "none";
                        width = "0.15em";
                    };
                    border_radius = "0.4em";
                    buttons = {
                        background_hover_opacity = 100;
                        background_opacity = 100;
                        battery = {
                            enableBorder = false;
                            spacing = "0.5em";
                        };
                        bluetooth = {
                            enableBorder = false;
                            spacing = "0.5em";
                        };
                        borderSize = "0.1em";
                        clock = {
                            enableBorder = false;
                            spacing = "0.5em";
                        };
                        dashboard = {
                            enableBorder = false;
                            spacing = "0.5em";
                        };
                        enableBorders = false;
                        innerRadiusMultiplier = "0.4";
                        media = {
                            enableBorder = false;
                            spacing = "0.5em";
                        };
                        modules = {
                            cpu = {
                                enableBorder = false;
                                spacing = "0.5em";
                            };
                            cpuTemp = {
                                enableBorder = false;
                                spacing = "0.5em";
                            };
                            hypridle = {
                                enableBorder = false;
                                spacing = "0.45em";
                            };
                            hyprsunset = {
                                enableBorder = false;
                                spacing = "0.45em";
                            };
                            kbLayout = {
                                enableBorder = false;
                                spacing = "0.45em";
                            };
                            netstat = {
                                enableBorder = false;
                                spacing = "0.45em";
                            };
                            microphone = {
                                enableBorder = false;
                                spacing = "0.45em";
                            };
                            power = {
                                enableBorder = false;
                                spacing = "0.45em";
                            };
                            ram = {
                                enableBorder = false;
                                spacing = "0.45em";
                            };
                            storage = {
                                enableBorder = false;
                                spacing = "0.45em";
                            };
                            submap = {
                                enableBorder = false;
                                spacing = "0.45em";
                            };
                            updates = {
                                enableBorder = false;
                                spacing = "0.45em";
                            };
                            weather = {
                                enableBorder = false;
                                spacing = "0.45em";
                            };
                        };
                        monochrome = false;
                        network = {
                            enableBorder = false;
                            spacing = "0.5em";
                        };
                        notifications = {
                            enableBorder = false;
                            spacing = "0.5em";
                        };
                        opacity = 100;
                        padding_x = "0.7rem";
                        padding_y = "0.2rem";
                        radius = "0.3em";
                        spacing = "0.25em";
                        style = "default";
                        systray = {
                            enableBorder = false;
                            spacing = "0.5em";
                        };
                        volume = {
                            enableBorder = false;
                            spacing = "0.5em";
                        };
                        windowtitle = {
                            enableBorder = false;
                            spacing = "0.5em";
                        };
                        workspaces = {
                            enableBorder = false;
                            fontSize = "1.2em";
                            numbered_active_highlight_border = "0.2em";
                            numbered_active_highlight_padding = "0.2em";
                            pill = {
                                active_width = "12em";
                                height = "4em";
                                radius = "1.9rem * 0.6";
                                width = "4em";
                            };
                            smartHighlight = true;
                            spacing = "0.5em";
                        };
                        y_margins = "0.4em";
                    };
                    dropdownGap = "2.9em";
                    floating = false;
                    label_spacing = "0.5em";
                    layer = "top";
                    location = "top";
                    margin_bottom = "0em";
                    margin_sides = "0.5em";
                    margin_top = "0.5em";
                    menus = {
                        border = {
                            radius = "0.7em";
                            size = "0.13em";
                        };
                        buttons = {
                            radius = "0.4em";
                        };
                        card_radius = "0.4em";
                        menu = {
                            battery.scaling = 100;
                            bluetooth.scaling = 100;
                            clock.scaling = 100;
                            dashboard = {
                                confirmation_scaling = 100;
                                profile.radius = "0.4em";
                                profile.size = "8.5em";
                                scaling = 80;
                            };
                            media = {
                                card.tint = 85;
                                scaling = 100;
                            };
                            network.scaling = 100;
                            notifications = {
                                height = "58em";
                                pager.show = true;
                                scaling = 100;
                                scrollbar.radius = "0.2em";
                                scrollbar.width = "0.35em";
                            };
                            power = {
                                radius = "0.4em";
                                scaling = 90;
                            };
                            volume.scaling = 100;
                        };
                        monochrome = false;
                        opacity = 100;
                        popover = {
                            radius = "0.4em";
                            scaling = 90;
                        };
                        progressbar.radius = "0.3rem";
                        scroller = {
                            radius = "0.7em";
                            width = "0.25em";
                        };
                        slider = {
                            progress_radius = "0.3rem";
                            slider_radius = "0.3rem";
                        };
                        switch = {
                            radius = "0.2em";
                            slider_radius = "0.2em";
                        };
                        tooltip.radius = "0.3em";
                    };
                    opacity = 100;
                    outer_spacing = "1.6em";
                    scaling = 100;
                    transparent = false;
                };
                font = {
                    name = "Ubuntu Nerd Font";
                    size = "1.1rem";
                    weight = 600;
                };
                matugen = false;
                matugen_settings = {
                    contrast = 0;
                    mode = "dark";
                    scheme_type = "tonal-spot";
                    variation = "standard_1";
                };
                notification = {
                    border_radius = "0.6em";
                    opacity = 100;
                    scaling = 100;
                };
                osd = {
                    active_monitor = true;
                    duration = 2500;
                    enable = true;
                    location = "right";
                    margins = "0px 5px 0px 0px";
                    monitor = 0;
                    muted_zero = false;
                    opacity = 100;
                    orientation = "vertical";
                    radius = "0.4em";
                    scaling = 100;
                };
                tooltip.scaling = 100;
            };
            wallpaper = {
                enable = true;
                image = "~/Media/Pictures/wallpaper.png";
                pywal = false;
            };
        };
    };
}