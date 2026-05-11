{
  lib,
  config,
  pkgs,
  ...
}:
{

  home.packages = with pkgs; [
    tor-browser
  ];

  programs.firefox = {
    enable = true;
    languagePacks = [
      "ja"
      "en-us"
    ];
    profiles.default = {
      name = "default";
      isDefault = true;
      search = {
        default = "4get";
        engines = {
          "4get" = {
            name = "4get";
            urls = [{ template = "https://4get.sunao1222.net/web?s={searchTerms}"; }];
            definedAliases = [ "@4" ];
          };
        };
      };
      settings = {
        "browser.startup.homepage" = "https://4get.hn.sunao1222.net";
        "browser.search.region" = "JP";
        "intl.locale.requested" = "ja,en-US";
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      userChrome = ''
        #main-window[tabsintitlebar="true"]:not([extradragspace="true"]) #TabsToolbar > .toolbar-items {
          opacity: 0;
          pointer-events: none;
        }
        #main-window:not([tabsintitlebar="true"]) #TabsToolbar {
          visibility: collapse !important;
        }
      '';
      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          vimium
        ];
      };
    };
  };

  # programs.chromium = {
  #   enable = true;
  #   package = pkgs.chromium.override { enableWideVine = true; };
  #   commandLineArgs = [
  #     # waylandSupport
  #     "--ozone-platform-hint=auto"
  #     "--enable-wayland-ime"
  #     # vlukanSupport
  #     # ジェスチャーでの操作の有効化
  #     #タブスクロールを有効化
  #     "--enable-features=TouchpadOverscrollHistoryNavigation,ScrollableTabStrip:minTabWidth/54,VaapiVideoDecodeLinuxGL,VaapiVideoEncoder,Vulkan,VulkanFromANGLE,DefaultANGLEVulkan,VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport,UseMultiPlaneFormatForHardwareVideo"
  #   ];
  # };

  home.file = {
    torrc = {
      source = ./torrc;
      target = ".tor\ project/Tor/torrc";
    };
  };
}
