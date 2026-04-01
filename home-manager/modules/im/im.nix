{ pkgs, ... }:

{
  i18n = {
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        settings = {
          "inputMethod" = {
            "GroupOrder" = {
              "0" = "Default";
            };
            "Groups/0" = {
              "Name" = "Default";
              "Default Layout" = "us";
              "DefaultIM" = "skk";
            };
            "Groups/0/Items/0" = {
              "Name" = "skk";
            };
          };
          "globalOptions" = {
            "Behavior" = {
              # デフォルトで有効にする
              "ActiveByDefault" = "False";
              # フォーカス時に状態をリセット
              "resetStateWhenFocusIn" = "No";
              # 入力状態を共有する
              "ShareInputState" = "No";
              # アプリケーションにプリエディットを表示する
              "PreeditEnabledByDefault" = "True";
              # 入力メソッドを切り替える際に入力メソッドの情報を表示する
              "ShowInputMethodInformation" = "True";
              # フォーカスを変更する際に入力メソッドの情報を表示する
              "showInputMethodInformationWhenFocusIn" = "False";
              # 入力メソッドの情報をコンパクトに表示する
              "CompactInputMethodInformation" = "True";
              # 第1入力メソッドの情報を表示する
              "ShowFirstInputMethodInformation" = "True";
              # デフォルトのページサイズ
              "DefaultPageSize" = "5";
              # XKB オプションより優先する
              "OverrideXkbOption" = "False";
              # Preload input method to be used by default
              "PreloadInputMethod" = "True";
              # パスワード欄に入力メソッドを許可する
              "AllowInputMethodForPassword" = "False";
              # パスワード入力時にプリエディットテキストを表示する
              "ShowPreeditForPassword" = "False";
              # ユーザーデータを保存する間隔（分）
              "AutoSavePeriod" = "30";
            };
          };
          addons = {
            classicui = {
              globalSection = {
                "Vertical Candidate List" = "False";
                "WheelForPaging" = "True";
                "Font" = "Sans 10";
                "MenuFont" = "Sans 10";
                "TrayFont" = "Sans Bold 10";
                "TrayOutlineColor" = "#000000";
                "TrayTextColor" = "#ffffff";
                "PreferTextIcon" = "False";
                "ShowLayoutNameInIcon" = "True";
                "UseInputMethodLanguageToDisplayText" = "True";
                "UseDarkTheme" = "True";
                "UseAccentColor" = "True";
                "PerScreenDPI" = "False";
                "ForceWaylandDPI" = "0";
                "EnableFractionalScale" = "True";
                "Theme" = "Tokyonight-Day";
                "DarkTheme" = "Tokyonight-Storm";
              };
            };
            skk = {
              globalSection = {
                "Rule" = "StickyShift";
                "PunctuationStyle" = "English";
                "InitialInputMode" = "Latin";
                "PageSize" = "7";
                "Candidate Layout" = "Vertical";
                "EggLikeNewLine" = "False";
                "ShowAnnotation" = "True";
                "CandidateChooseKey" = "Qwerty Center Row (a,s,d,...)";
                "NTriggersToShowCandWin" = "4";
              };
              sections = {
                "CandidatesPageUpKey" = {
                  "0" = "Page_Up";
                };
                "CandidatesPageDownKey" = {
                  "0" = "Page_Down";
                };
                "CursorUp" = {
                  "0" = "Up";
                  "1" = "Control+P";
                };
                "CursorDown" = {
                  "0" = "Down";
                  "1" = "Control+N";
                };
              };
            };
          };
        };
        addons = [
          pkgs.fcitx5-skk
          pkgs.fcitx5-tokyonight
        ];
      };
    };
  };

  home.packages = [
    pkgs.skktools
  ];

  xdg.configFile = {
    "metadata.json" = {
      source = ./metadata.json;
      target = "libskk/rules/StickyShift/metadata.json";
    };
    "hiragana.json" = {
      source = ./hiragana.json;
      target = "libskk/rules/StickyShift/keymap/hiragana.json";
    };
    "katakana.json" = {
      source = ./katakana.json;
      target = "libskk/rules/StickyShift/keymap/katakana.json";
    };
  };
}
