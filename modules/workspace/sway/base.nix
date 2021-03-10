{ pkgs, lib, config, ... }:

let
  theme = config.themes.colors;
  apps = config.defaultApps;

  browser1 = apps.browser.cmd;
  browser2 = "${pkgs.google-chrome}/bin/google-chrome-stable";
  browser3 = "${pkgs.tor-browser}/bin/tor-browser";
  browser4 = "${pkgs.qutebrowser}/bin/qutebrowser";

  term1 = apps.term.cmd;
  term2 = "${pkgs.kitty}/bin/kitty";

  hyper = "Mod3";

  lock_fork =
    pkgs.writeShellScript "lock_fork" "sudo /run/current-system/sw/bin/lock &";
  lock = pkgs.writeShellScript "lock"
    "swaymsg 'output * dpms off'; sudo /run/current-system/sw/bin/lock; swaymsg 'output * dpms on'";
in {
  environment.sessionVariables = {
    _JAVA_AWT_WM_NONREPARENTING = "1";
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = lib.mkForce (with pkgs; [ swayidle xwayland ]);
  };

  users.users.vyorkin.extraGroups = [ "sway" ];

  environment.loginShellInit = ''
    [[ "$(tty)" == /dev/tty? ]] && sudo /run/current-system/sw/bin/lock this
    [[ "$(tty)" == /dev/tty1 ]] && sway
  '';

  home-manager.users.vyorkin.wayland.windowManager.sway = {
    enable = true;
    config = rec {
      fonts = [ "IBM Plex 9" ];

      colors = rec {
        background = theme.bg;
        unfocused = {
          text = theme.dark;
          border = theme.dark;
          background = theme.bg;
          childBorder = theme.dark;
          indicator = theme.fg;
        };
        focusedInactive = unfocused;
        urgent = unfocused // {
          text = theme.fg;
          border = theme.orange;
          childBorder = theme.orange;
        };
        focused = unfocused // {
          childBorder = theme.gray;
          border = theme.gray;
          background = theme.dark;
          text = theme.fg;
        };
      };
      gaps = {
        inner = 6;
        smartGaps = true;
        smartBorders = "on";
      };
      focus.followMouse = false;
      focus.forceWrapping = true;
      modifier = "Mod4";
      window = {
        border = 1;
        titlebar = true;
        commands = [
          {
            command = "border pixel 2px";
            criteria = { window_role = "popup"; };
          }
          {
            command = "sticky enable";
            criteria = { floating = ""; };
          }
        ];
      };
      startup = [
        { command = browser1; }
        { command = "${pkgs.xorg.xrdb}/bin/xrdb -merge ~/.Xresources"; }
        {
          command =
            "swayidle -w before-sleep '${lock_fork}' lock '${lock_fork}' unlock 'pkill -9 swaylock'";
        }
      ];

      keybindings = let
        script = name: content: "exec ${pkgs.writeScript name content}";
      in {
        "${modifier}+q" = "kill";
        "${modifier}+Shift+q" = "move container to workspace temp; [workspace=__focused__] kill; workspace temp; move container to workspace temp; workspace temp";
        "${modifier}+Return" = "exec ${term1}";
        "${modifier}+Shift+Return" = "exec ${term2}";
        "${modifier}+e" = "exec ${apps.editor.cmd}";

        "${modifier}+u" = "layout stacking";
        "${modifier}+i" = "layout tabbed";
        "${modifier}+o" = "layout toggle split";

        "${modifier}+Left" = "focus child; focus left";
        "${modifier}+Right" = "focus child; focus right";
        "${modifier}+Up" = "focus child; focus up";
        "${modifier}+Down" = "focus child; focus down";

        "${modifier}+Control+Left" = "focus parent; focus left";
        "${modifier}+Control+Right" = "focus parent; focus right";
        "${modifier}+Control+Up" = "focus parent; focus up";
        "${modifier}+Control+Down" = "focus parent; focus down";

        "${modifier}+Shift+Up" = "move up";
        "${modifier}+Shift+Down" = "move down";
        "${modifier}+Shift+Right" = "move right";
        "${modifier}+Shift+Left" = "move left";

        "${modifier}+Comma" = "workspace prev";
        "${modifier}+Period" = "workspace next";

        "${modifier}+h" = "focus child; focus left";
        "${modifier}+j" = "focus child; focus down";
        "${modifier}+k" = "focus child; focus up";
        "${modifier}+l" = "focus child; focus right";

        "${modifier}+Control+h" = "focus parent; focus left";
        "${modifier}+Control+j" = "focus parent; focus down";
        "${modifier}+Control+k" = "focus parent; focus up";
        "${modifier}+Control+l" = "focus parent; focus right";

        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move right";
        "${modifier}+Shift+l" = "move up";

        "${modifier}+f" = "fullscreen toggle; floating toggle";
        "${modifier}+r" = "mode resize";
        "${modifier}+Shift+f" = "floating toggle";
        "${modifier}+Shift+t" = "focus toggle";

        "${hyper}+Shift+l" = "exec ${pkgs.playerctl}/bin/playerctl next";
        "${hyper}+Shift+h" = "exec ${pkgs.playerctl}/bin/playerctl previous";
        "${hyper}+Shift+p" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        "${hyper}+Shift+o" = "exec ${pkgs.lxqt.pavucontrol-qt}/bin/pavucontrol-qt";

        "${modifier}+Print" = script "screenshot"
          "${pkgs.grim}/bin/grim Pictures/$(date +'%Y-%m-%d+%H:%M:%S').png";

        "${modifier}+Control+Print" = script "screenshot-copy"
          "${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard}/bin/wl-copy";

        "--release ${modifier}+Shift+Print" = script "screenshot-area" ''
          ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" Pictures/$(date +'%Y-%m-%d+%H:%M:%S').png'';

        "--release ${modifier}+Control+Shift+Print" =
          script "screenshot-area-copy" ''
            ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.wl-clipboard}/bin/wl-copy'';

        "${modifier}+x" = "focus output right";
        "${modifier}+Shift+x" = "move workspace to output right";
        "${modifier}+F5" = "reload";
        "${modifier}+Shift+F5" = "exit";

        "${modifier}+Control+Shift+h" = "layout splith";
        "${modifier}+Control+Shift+v" = "layout splitv";
        "${modifier}+g" = "split h";
        "${modifier}+v" = "split v";

        "${modifier}+F1" = "move to scratchpad";
        "${modifier}+F2" = "scratchpad show";

        "${modifier}+F11" = "output * dpms off";
        "${modifier}+F12" = "output * dpms on";

        "${modifier}+End" = "exec ${lock}";
        "${modifier}+p" = "sticky toggle";
        "${modifier}+backslash" =
          script "0x0" ''wl-paste | curl -F"file=@-" https://0x0.st | wl-copy'';
        "${modifier}+b" = "focus mode_toggle";

        "${modifier}+Space" = script "lambda-launcher"
          "${pkgs.lambda-launcher}/bin/lambda-launcher";

        "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
        "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
        "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
        "XF86AudioLowerVolume" = "exec ${pkgs.pamixer}/bin/pamixer -d 2";
        "XF86AudioRaiseVolume" = "exec ${pkgs.pamixer}/bin/pamixer -i 2";
        "XF86AudioMute" = "exec ${pkgs.pamixer}/bin/pamixer -t";

        "${modifier}+XF86AudioLowerVolume" = "exec ${pkgs.pamixer}/bin/pamixer -d 1";
        "${modifier}+XF86AudioRaiseVolume" = "exec ${pkgs.pamixer}/bin/pamixer -i 1";

        "button2" = "kill";
        "--whole-window ${modifier}+button2" = "kill";
      };

      keycodebindings = { };

      workspaceLayout = "tabbed";
      workspaceAutoBackAndForth = true;
    };
    wrapperFeatures = { gtk = true; };
    extraConfig = ''
      default_border pixel 1
      mouse_warping container
      hide_edge_borders --i3 smart
      exec pkill swaynag
    '';
  };
}
