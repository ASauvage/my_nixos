{ pkgs, ... }:

{
    programs.firefox = {
        enable = true;
        package = pkgs.firefox;
        languagePacks = {
            "en-US"
            "fr-FR"
        };
        policies = {
            DefaultDownloadDirectory = "\${home}/Downloads";
            DisplayMenuBar = "always";
            DisableTelemetry = true;
            DisableFirefoxStudies = true;
            DisableSetDesktopBackground = true;
            DisablePocket = true;
            OfferToSaveLogins = false;
            Preferences = {
                "extensions.pocket.enabled" = lock-false;
                "browser.newtabpage.pinned" = lock-empty-string;
                "browser.topsites.contile.enabled" = lock-false;
                "browser.newtabpage.activity-stream.showSponsored" = lock-false;
                "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
                "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
            };
            FirefoxHome = {
                Search = true;
                TopSites = false;
                SponsoredTopSites = false;
                Highlights = false;
                Pocket = false;
                SponsoredPocket = false;
                Snippets = false;
                Locked = false;
            };
            ExtensionSettings = {
                "uBlock0@raymondhill.net" = {
                    installation_mode = "normal_installed";
                    private_browsing = true;
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                };
                "idcac-pub@guus.ninja" = {
                    installation_mode = "normal_installed";
                    private_browsing = true;
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/istilldontcareaboutcookies/latest.xpi";
                };
                "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
                    installation_mode = "normal_installed";
                    private_browsing = true;
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
                };
                "{85860b32-02a8-431a-b2b1-40fbd64c9c69}" = {
                    installation_mode = "normal_installed";
                    private_browsing = true;
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/github-file-icons/latest.xpi";
                };
            };
            Bookmarks = [
                {
                    Title = "Deepl";
                    URL = "https://www.deepl.com/fr/translator";
                    Favicon = "https://www.deepl.com/favicon.ico";
                    Placement = "toolbar";
                }
                {
                    Title = "Gmail";
                    URL = "https://mail.google.com/mail/u/0/#inbox";
                    Favicon = "https://mail.google.com/favicon.ico";
                    Placement = "toolbar";
                }
                {
                    Title = "Github";
                    URL = "https://github.com/";
                    Favicon = "https://github.com/favicon.ico";
                    Placement = "toolbar";
                }
                {
                    Title = "Youtube";
                    URL = "https://youtube.com";
                    Favicon = "https://youtube.com/favicon.ico";
                    Placement = "toolbar";
                }
                {
                    Title = "Netflix";
                    URL = "https://netflix.com/browse";
                    Favicon = "https://netflix.com/favicon.ico";
                    Placement = "toolbar";
                    Folder = "Streaming";
                }
                {
                    Title = "Prime Video";
                    URL = "https://www.primevideo.com/region/eu/storefront";
                    Favicon = "https://www.primevideo.com/favicon.ico";
                    Placement = "toolbar";
                    Folder = "Streaming";
                }
                {
                    Title = "Crunchyroll";
                    URL = "https://www.crunchyroll.com/fr";
                    Favicon = "https://www.crunchyroll.com/build/assets/img/favicons/favicon-v2-16x16.png";
                    Placement = "toolbar";
                    Folder = "Streaming";
                }
            ];
        }
    }
}