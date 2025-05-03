{
  config,
  pkgs,
  inputs,
  ...
}: {
  stylix.targets.firefox.profileNames = ["test"];
  programs.firefox = {
    enable = true;
    profiles.test = {
      settings = {
        "browser.shell.checkDefaultBrowser" = false;
        "browser.disableResetPrompt" = true;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "browser.startup.homepage" = "about:blank";
        "browser.newtabpage.enabled" = false;
        # "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"nav-bar":["back-button","forward-button","stop-reload-button","urlbar-container","downloads-button","ublock0_raymondhill_net-browser-action","_testpilot-containers-browser-action"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["import-button","personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","ublock0_raymondhill_net-browser-action","_testpilot-containers-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","toolbar-menubar","TabsToolbar","widget-overflow-fixed-list"],"currentVersion":18,"newElementCount":4}'';
        "dom.security.https_only_mode" = true;
        "identity.fxaccounts.enabled" = false;
        "privacy.trackingprotection.enabled" = true;
        "browser.translations.neverTranslateLanguages" = "de";
      };

      extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
        bitwarden
        ublock-origin
        youtube-shorts-block
        vimium
        istilldontcareaboutcookies
        canvasblocker
      ];

      search = {
        force = true;
        default = "google";
        order = [
          "google"
          "Searx"
        ];
        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
          };
          "NixOS Wiki" = {
            urls = [{template = "https://nixos.wiki/index.php?search={searchTerms}";}];
            icon = "https://nixos.wiki/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = ["@nw"];
          };
          "Searx" = {
            urls = [{template = "https://searx.aicampground.com/?q={searchTerms}";}];
            icon = "https://nixos.wiki/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000; # every day
            definedAliases = ["@searx"];
          };
          "bing".metaData.hidden = true;
          "google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
        };
      };
    };
    # nativeMessagingHosts.passff = true;
  };
  programs.browserpass = {
    enable = true;
    browsers = ["firefox"];
  };
  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/http" = ["firefox.desktop"];
    "x-scheme-handler/https" = ["firefox.desktop"];
  };
}
