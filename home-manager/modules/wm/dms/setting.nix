{ pkgs, ... }:
let
  tokyonight-night-moon = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/duxlabs-dev/dux-plugin-registry/refs/heads/master/themes/tokyonight-night-moon/theme.json";
    sha256 = "GcK+qX7FSSpzBkOFuLG0af86vrB2BSsYPN+1P2gPCM4=";
  };
in
{
  currentThemeName = "custom";
  customThemeFile = tokyonight-night-moon;
  radiusStrength = 38;
  clockFormat = "24h";
  blurBorderEnabled = true;
  blurBorderCustomColor = "#7aa2f7";
  greeterEnableFprint = true;
  useAutoLocation = true;
  dockConfigs = [
    {
      id = "dock";
      name = "Dock";
      enabled = false;
      screenPreferences = [
        "all"
      ];
      showOnLastDisplay = true;
      position = 1;
      mode = "compact";
      middleClickAction = "close";
      taskbarAlign = "center";
      widgetExpansion = "popout";
      iconSize = 40;
      spacing = 8;
      itemSpacing = 8;
      margin = 0;
      bottomGap = 0;
      transparency = 0.85;
      followInterfaceStyle = false;
      autoHide = false;
      smartAutoHide = false;
      useOverlayLayer = false;
      editOnRightClick = false;
      showOnFullscreen = false;
      openOnOverview = false;
      groupByApp = false;
      separatePinnedAndRunningApps = false;
      restoreSpecialWorkspaceOnClick = false;
      isolateDisplays = false;
      indicatorStyle = "circle";
      borderEnabled = false;
      borderColor = "surfaceText";
      borderOpacity = 1;
      borderThickness = 1;
      launcherEnabled = false;
      launcherLogoMode = "apps";
      launcherLogoCustomPath = "";
      launcherLogoColorOverride = "";
      launcherLogoSizeOffset = 0;
      launcherLogoBrightness = 0.5;
      launcherLogoContrast = 1;
      maxVisibleApps = 0;
      maxVisibleRunningApps = 0;
      showOverflowBadge = true;
      showTrash = false;
      trashFileManager = "default";
      trashCustomCommand = "";
      magnification = false;
      magnificationScale = 130;
      magnificationProfile = "parabolic";
      magnificationExpand = false;
      order = [ ];
      widgets = [
        {
          id = "dock_launcher";
          widgetId = "dockLauncher";
          enabled = true;
        }
        {
          id = "dock_apps";
          widgetId = "appsDock";
          enabled = true;
        }
        {
          id = "dock_trash";
          widgetId = "dockTrash";
          enabled = true;
        }
      ];
    }
  ];
  currentThemeCategory = "custom";
  popupTransparency = 0.75;
  dmsWindowsFloatingSeeded = [
    "niri"
  ];
  niriLayoutBorderSize = "-1";
  density = "comfortable";
  interfaceStyle = "expressive";
  blurEnabled = false;
  blurStrength = 72;
  blurBorderSeeded = true;
  blurForegroundLayers = false;
  foregroundLayerTransparency = 1;
  blurLayerOutlineOpacity = 0;
  controlCenterWidgets = [
    {
      id = "user";
      enabled = true;
      w = 5;
      h = 1;
    }
    {
      id = "settings";
      enabled = true;
      w = 1;
      h = 1;
      small = true;
    }
    {
      id = "lock";
      enabled = true;
      w = 1;
      h = 1;
      small = true;
    }
    {
      id = "power";
      enabled = true;
      w = 1;
      h = 1;
      small = true;
    }
    {
      id = "volumeSlider";
      enabled = true;
      w = 4;
      h = 1;
    }
    {
      id = "brightnessSlider";
      enabled = true;
      w = 4;
      h = 1;
      deviceName = "software:HDMI-A-1";
    }
    {
      id = "wifi";
      enabled = true;
      w = 4;
      h = 1;
    }
    {
      id = "bluetooth";
      enabled = true;
      w = 4;
      h = 1;
    }
    {
      id = "audioOutput";
      enabled = true;
      w = 4;
      h = 1;
    }
    {
      id = "audioInput";
      enabled = true;
      w = 4;
      h = 1;
    }
    {
      id = "nightMode";
      enabled = true;
      w = 4;
      h = 1;
    }
    {
      id = "darkMode";
      enabled = true;
      w = 4;
      h = 1;
    }
    {
      id = "plugin_dankKDEConnect";
      enabled = true;
      w = 4;
      h = 1;
    }
    {
      id = "plugin_displayMirror";
      enabled = true;
      w = 4;
      h = 1;
    }
    {
      id = "builtin_vpn";
      enabled = true;
      w = 4;
      h = 1;
    }
    {
      id = "builtin_tailscale";
      enabled = true;
      w = 4;
      h = 1;
    }
    {
      id = "edit";
      enabled = true;
      w = 1;
      h = 1;
      small = true;
    }
    {
      id = "runningApps";
      enabled = true;
      w = 4;
      h = 1;
      small = true;
      col = 0;
      row = 8;
    }
  ];
  appIdSubstitutions = [ ];
  spotlightSectionViewModes = {
    apps = "list";
  };
  spotlightBarShowModeChips = false;
  dashTabs = [
    {
      id = "overview";
      enabled = true;
    }
    {
      id = "media";
      enabled = true;
    }
    {
      id = "wallpaper";
      enabled = true;
    }
    {
      id = "weather";
      enabled = true;
    }
    {
      id = "notifications";
      enabled = true;
    }
  ];
  networkPreference = "wifi";
  cursorSettings = {
    theme = "System Default";
    size = 24;
    niri = {
      hideWhenTyping = false;
      hideAfterInactiveMs = 0;
    };
    hyprland = {
      hideOnKeyPress = false;
      hideOnTouch = false;
      inactiveTimeout = 0;
    };
    dwl = {
      cursorHideTimeout = 0;
    };
  };
  notepadShowLineNumbers = true;
  lockBeforeSuspend = true;
  launchPrefix = "uwsm-app --";
  lockAtStartup = false;
  enableFprint = true;
  osdPowerProfileEnabled = true;
  screenPreferences = {
    wallpaper = [
      "all"
    ];
  };
  displayShowDisconnected = false;
  connectedFrameBarStyleBackups = { };
  barConfigs = [
    {
      id = "default";
      name = "Main Bar";
      enabled = true;
      position = 0;
      screenPreferences = [
        "all"
      ];
      showOnLastDisplay = true;
      leftWidgets = [
        {
          id = "launcherButton";
          enabled = true;
        }
        {
          id = "workspaceSwitcher";
          enabled = true;
        }
        {
          id = "focusedWindow";
          enabled = true;
        }
      ];
      centerWidgets = [
        {
          id = "music";
          enabled = true;
        }
        {
          id = "clock";
          enabled = true;
        }
        {
          id = "weather";
          enabled = true;
        }
      ];
      rightWidgets = [
        {
          id = "githubHeatmapPlus";
          enabled = true;
        }
        {
          id = "dankTranslateAI";
          enabled = true;
        }
        {
          id = "githubHeatmapRevive";
          enabled = true;
        }
        {
          id = "systemTray";
          enabled = true;
          trayUseInlineExpansion = true;
        }
        {
          id = "cpuUsage";
          enabled = true;
          minimumWidth = true;
        }
        {
          id = "memUsage";
          enabled = true;
          minimumWidth = true;
          showSwap = false;
          showInGb = false;
        }
        {
          id = "clipboard";
          enabled = true;
        }
        {
          id = "notificationButton";
          enabled = true;
        }
        {
          id = "battery";
          enabled = true;
        }
        {
          id = "controlCenterButton";
          enabled = true;
          showMicPercent = true;
        }
      ];
      spacing = 4;
      innerPadding = 6;
      bottomGap = 0;
      transparency = 0.5;
      widgetTransparency = 0.5;
      squareCorners = false;
      noBackground = false;
      maximizeWidgetIcons = false;
      maximizeWidgetText = false;
      widgetPadding = 8;
      gothCornersEnabled = false;
      gothCornerRadiusOverride = false;
      gothCornerRadiusValue = 12;
      borderEnabled = false;
      borderColor = "surfaceText";
      borderOpacity = 1;
      borderThickness = 1;
      widgetOutlineEnabled = false;
      widgetOutlineColor = "primary";
      widgetOutlineOpacity = 1;
      widgetOutlineThickness = 1;
      fontScale = 1.11;
      iconScale = 1;
      autoHide = false;
      autoHideDelay = 250;
      showOnWindowsOpen = false;
      openOnOverview = false;
      visible = true;
      popupGapsAuto = true;
      popupGapsManual = 4;
      maximizeDetection = true;
      scrollEnabled = true;
      scrollXBehavior = "focusWindow";
      scrollYBehavior = "workspace";
      shadowIntensity = 0;
      shadowOpacity = 60;
      shadowColorMode = "default";
      shadowCustomColor = "#000000";
      clickThrough = false;
      followInterfaceStyle = false;
      widgetFollowInterfaceStyle = false;
      island = false;
      dot = false;
    }
    {
      id = "dot1793277748242";
      name = "Dot";
      enabled = false;
      position = 0;
      screenPreferences = [
        "all"
      ];
      showOnLastDisplay = true;
      leftWidgets = [
        {
          id = "launcherButton";
          enabled = true;
        }
        {
          id = "workspaceSwitcher";
          enabled = true;
        }
        {
          id = "focusedWindow";
          enabled = true;
        }
      ];
      centerWidgets = [
        {
          id = "music";
          enabled = true;
        }
        {
          id = "clock";
          enabled = true;
        }
        {
          id = "weather";
          enabled = true;
        }
      ];
      rightWidgets = [
        {
          id = "systemTray";
          enabled = true;
          trayUseInlineExpansion = true;
        }
        {
          id = "cpuUsage";
          enabled = true;
          minimumWidth = true;
        }
        {
          id = "memUsage";
          enabled = true;
          minimumWidth = true;
          showSwap = false;
          showInGb = false;
        }
        {
          id = "clipboard";
          enabled = true;
        }
        {
          id = "notificationButton";
          enabled = true;
        }
        {
          id = "battery";
          enabled = true;
        }
        {
          id = "controlCenterButton";
          enabled = true;
          showMicPercent = true;
        }
      ];
      spacing = 4;
      innerPadding = 4;
      bottomGap = 0;
      transparency = 0.5;
      widgetTransparency = 0.5;
      squareCorners = false;
      noBackground = false;
      maximizeWidgetIcons = false;
      maximizeWidgetText = false;
      widgetPadding = 8;
      gothCornersEnabled = false;
      gothCornerRadiusOverride = false;
      gothCornerRadiusValue = 12;
      borderEnabled = false;
      borderColor = "surfaceText";
      borderOpacity = 1;
      borderThickness = 1;
      widgetOutlineEnabled = false;
      widgetOutlineColor = "primary";
      widgetOutlineOpacity = 1;
      widgetOutlineThickness = 1;
      fontScale = 1;
      iconScale = 1;
      autoHide = false;
      autoHideDelay = 250;
      showOnWindowsOpen = false;
      openOnOverview = false;
      visible = true;
      popupGapsAuto = true;
      popupGapsManual = 4;
      maximizeDetection = true;
      scrollEnabled = true;
      scrollXBehavior = "focusWindow";
      scrollYBehavior = "workspace";
      shadowIntensity = 0;
      shadowOpacity = 60;
      shadowColorMode = "default";
      shadowCustomColor = "#000000";
      clickThrough = false;
      followInterfaceStyle = false;
      widgetFollowInterfaceStyle = false;
      island = false;
      dot = true;
      islandCompactThickness = 38;
      islandSatelliteGap = 12;
    }
  ];
  desktopWidgetInstances = [
    {
      id = "dw_1794250219330_mfzfeyomg";
      widgetType = "githubHeatmapPlus";
      name = "GitHub Heatmap Plus";
      enabled = true;
      config = {
        displayPreferences = [
          "all"
        ];
      };
    }
    {
      id = "dw_1794253951080_onn8rqly5";
      widgetType = "audioFx";
      name = "AudioFX";
      enabled = true;
      config = {
        displayPreferences = [
          "all"
        ];
        form = "dots";
        depth = 600;
        sensitivity = 75;
        glowStrength = 300;
        glowColor = "accent";
        glowColors = "light";
        discTint = 0;
        discRing = 8;
      };
    }
  ];
  builtInPluginSettings = {
    dms_settings_search = {
      trigger = "?";
    };
    dms_clipboard_search = {
      trigger = "cb";
    };
    dms_power = {
      trigger = "pw";
    };
    dms_qr_generator = {
      trigger = "qrg";
    };
  };
  frameEnabled = false;
  configVersion = 43;
}
