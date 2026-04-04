[
  {
    layer = "bottom";
    psition = "top";
    height = 30;
    margin-top = 4;
    margin-left = 4;
    margin-right = 4;
    output = [
      "eDP-1"
      "HDMI-A-1"
    ];
    modules-left = [
      "hyprland/workspaces"
      "niri/workspaces"
      "niri/window"
    ];
    modules-center = [ "clock" ];
    modules-right = [
      "network"
      "custom/padding"
      "cava"
      "pulseaudio"
      "custom/padding"
      "battery"
      "custom/padding"
      "custom/notification"
    ];

    battery = {
      format = "{icon}  {capacity}%";
      # format-alt = "{capacity}% {icon}";
      format-icons = [
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
      ];
    };

    clock = {
      format = "{:%H:%M}";
      format-alt = "{:%a, %d. %b  %H:%M}";
      tooltip = false;
    };

    "network" = {
      "format" = "{ipaddr}/{cidr}";
      "family" = "ipv4";
      "on-click" = "nmgui";
    };

    "pulseaudio" = {
      "format" = "{icon}  {volume}%";
      "format-muted" = "";
      "format-icons" = {
        "default" = [
          ""
          ""
        ];
      };
      "on-click" = "pavucontrol";
    };

    "cava" = {
      # "cava_config" = "$XDG_CONFIG_HOME/cava/cava.conf";
      "framerate" = 60;
      "autosens" = 1;
      "sensitivity" = 2;
      "bars" = 7;
      "lower_cutoff_freq" = 50;
      "higher_cutoff_freq" = 10000;
      "hide_on_silence" = false;
      # "format_silent" = "quiet";
      "method" = "pulse";
      "source" = "auto";
      "stereo" = false;
      "reverse" = false;
      "bar_delimiter" = 0;
      "monstercat" = false;
      "waves" = false;
      "noise_reduction" = 0.77;
      # "input_delay" = 2;
      "format-icons" = [
        "▁"
        "▂"
        "▃"
        "▄"
        "▅"
        "▆"
        "▇"
        "█"
      ];
      "actions" = {
        "on-click-right" = "mode";
      };
    };

    "niri/workspaces" = {
      "format" = "{icon}";
      "format-icons" = {
        "browser" = "󰈹";
      };
    };
    "niri/window" = {
      "format" = "{title}:{app_id}";
    };

    "custom/notification" = {
      "tooltip" = true;
      "format" = "<span size='13pt'>{icon}</span>";
      "format-icons" = {
        "notification" = "󱅫";
        "none" = "󰂜";
        "dnd-notification" = "󰂠";
        "dnd-none" = "󰪓";
        "inhibited-notification" = "󰂛";
        "inhibited-none" = "󰪑";
        "dnd-inhibited-notification" = "󰂛";
        "dnd-inhibited-none" = "󰪑";
      };
      "return-type" = "json";
      "exec-if" = "which swaync-client";
      "exec" = "swaync-client -swb";
      "on-click" = "swaync-client -t -sw";
      "on-click-right" = "swaync-client -d -sw";
      "escape" = true;
    };

    "custom/padding" = {
      "format" = "|";
    };
  }
]
