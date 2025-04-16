{ pkgs, ... }:

{
    services.hypridle = {
        enable = true;
        package = pkgs.hypridle;
        settings = {
            general = {
                lock_cmd = "pidof hyprlock || hyprlock";
                before_sleep_cmd = "loginctl lock-session";
                after_sleep_cmd = "hyprctl dispatch dpms on";
                ignore_dbus_inhibit = false;
            };
            listener = [
                {
                    # Screenlock
                    timeout = 600;
                    on-timeout = "loginctl lock-session";
                }
                {
                    # dpms
                    timeout = 660;
                    on-timeout = "hyprctl dispatch dpms off";
                    on-resume = "hyprctl dispatch dpms on";
                }
                {
                    # Suspend
                    timeout = 0;
                }
            ];
        };
    };
}