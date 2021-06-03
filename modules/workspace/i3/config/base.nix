{ pkgs, lib, config, ... }:

let env = import ./env.nix;
in rec {
  input = {
    "*" = {
      repeat_delay = "200";
      repeat_rate = "40";
    };
  };

  fonts = { names = [ "IBM Plex 9" ]; };
  bars = [ ];

  colors = rec {
    background = env.theme.bg;
    unfocused = {
      text = env.theme.dark;
      border = env.theme.dark;
      background = env.theme.bg;
      childBorder = env.theme.dark;
      indicator = env.theme.fg;
    };
    focusedInactive = unfocused;
    urgent = unfocused // {
      text = env.theme.fg;
      border = env.theme.orange;
      childBorder = env.theme.orange;
    };
    focused = unfocused // {
      childBorder = env.theme.gray;
      border = env.theme.yellow;
      background = env.theme.dark;
      text = env.theme.fg;
    };
  };

  gaps = {
    inner = 0;
    smartGaps = true;
    smartBorders = "on";
  };

  focus = {
    followMouse = false;
    forceWrapping = true;
  };

  modifier = env.mod;

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

  modes = {
    resize = {
      Down = "resize grow height ${env.step2} px";
      Up = "resize shrink height ${env.step2} px";

      Escape = "mode default";
      Return = "mode default";

      Right = "resize grow width ${env.step2} px";
      Left = "resize shrink width ${env.step2} px";

      h = "resize shrink width ${env.step2} px";
      j = "resize grow height ${env.step2} px";
      k = "resize shrink height ${env.step2} px";
      l = "resize grow width ${env.step2} px";
    };
  };

  keybindings = {
    "${modifier}+q" = "kill";
    "${modifier}+Shift+q" = "exec ${pkgs.wlogout}/bin/wlogout";
    "${modifier}+Shift+c" = "reload";
    "${modifier}+Shift+r" = "restart";

    # Layout

    "${modifier}+u" = "layout stacking";
    "${modifier}+i" = "layout tabbed";
    "${modifier}+o" = "layout toggle split";

    # Navigation

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

    "${modifier}+1" = "workspace 1";
    "${modifier}+2" = "workspace 2";
    "${modifier}+3" = "workspace 3";
    "${modifier}+4" = "workspace 4";
    "${modifier}+5" = "workspace 5";
    "${modifier}+6" = "workspace 6";
    "${modifier}+7" = "workspace 7";
    "${modifier}+8" = "workspace 8";
    "${modifier}+9" = "workspace 9";
    "${modifier}+0" = "workspace 10";

    "${env.hyper}+1" = "workspace 11";
    "${env.hyper}+2" = "workspace 12";
    "${env.hyper}+3" = "workspace 13";
    "${env.hyper}+4" = "workspace 14";
    "${env.hyper}+5" = "workspace 15";
    "${env.hyper}+6" = "workspace 16";
    "${env.hyper}+7" = "workspace 17";
    "${env.hyper}+8" = "workspace 18";
    "${env.hyper}+9" = "workspace 19";
    "${env.hyper}+0" = "workspace 20";

    "${modifier}+Shift+1" = "move container to workspace 1";
    "${modifier}+Shift+2" = "move container to workspace 2";
    "${modifier}+Shift+3" = "move container to workspace 3";
    "${modifier}+Shift+4" = "move container to workspace 4";
    "${modifier}+Shift+5" = "move container to workspace 5";
    "${modifier}+Shift+6" = "move container to workspace 6";
    "${modifier}+Shift+7" = "move container to workspace 7";
    "${modifier}+Shift+8" = "move container to workspace 8";
    "${modifier}+Shift+9" = "move container to workspace 9";
    "${modifier}+Shift+0" = "move container to workspace 10";

    "${env.hyper}+Shift+1" = "move container to workspace 11";
    "${env.hyper}+Shift+2" = "move container to workspace 12";
    "${env.hyper}+Shift+3" = "move container to workspace 13";
    "${env.hyper}+Shift+4" = "move container to workspace 14";
    "${env.hyper}+Shift+5" = "move container to workspace 15";
    "${env.hyper}+Shift+6" = "move container to workspace 16";
    "${env.hyper}+Shift+7" = "move container to workspace 17";
    "${env.hyper}+Shift+8" = "move container to workspace 18";
    "${env.hyper}+Shift+9" = "move container to workspace 19";
    "${env.hyper}+Shift+0" = "move container to workspace 20";

    "${modifier}+Comma" = "workspace prev";
    "${modifier}+Period" = "workspace next";

    # Fullscreen / Floating

    "${modifier}+f" = "fullscreen toggle; floating toggle";
    "${modifier}+Shift+f" = "floating toggle";
    "${modifier}+Shift+t" = "focus toggle";

    # Modes

    "${modifier}+r" = "mode resize";
    "${modifier}+d" = "mode display";

    # Gaps

    "${modifier}+s" = "gaps inner current plus 1";
    "${modifier}+Shift+s" = "gaps inner current minus 1";

    # Player

    "${env.hyper}+Shift+l" = "exec ${pkgs.playerctl}/bin/playerctl next";
    "${env.hyper}+Shift+h" = "exec ${pkgs.playerctl}/bin/playerctl previous";
    "${env.hyper}+Shift+p" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
    "${env.hyper}+Shift+o" =
      "exec ${pkgs.lxqt.pavucontrol-qt}/bin/pavucontrol-qt";

    # Screenshots

    "${modifier}+y" = "move workspace to output left";

    "${modifier}+Control+Shift+h" = "layout splith";
    "${modifier}+Control+Shift+v" = "layout splitv";
    "${modifier}+g" = "split h";
    "${modifier}+v" = "split v";

    "${modifier}+F1" = "move to scratchpad";
    "${modifier}+F2" = "scratchpad show";

    "${modifier}+F11" = "output * dpms off";
    "${modifier}+F12" = "output * dpms on";

    "${modifier}+p" = "sticky toggle";
    "${modifier}+b" = "focus mode_toggle";

    "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
    "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
    "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
    "XF86AudioLowerVolume" = "exec ${pkgs.pamixer}/bin/pamixer -d 2";
    "XF86AudioRaiseVolume" = "exec ${pkgs.pamixer}/bin/pamixer -i 2";
    "XF86AudioMute" = "exec ${pkgs.pamixer}/bin/pamixer -t";

    "${modifier}+XF86AudioLowerVolume" =
      "exec ${pkgs.pamixer}/bin/pamixer -d 1";
    "${modifier}+XF86AudioRaiseVolume" =
      "exec ${pkgs.pamixer}/bin/pamixer -i 1";

    "button2" = "kill";
    "--whole-window ${modifier}+button2" = "kill";

    # App launch

    "${modifier}+Return" = "exec ${env.term1}";
    "${modifier}+Shift+Return" = "exec ${env.term2}";

    "${modifier}+e" = "exec ${env.apps.editor.cmd}";

    # App focus

    "${env.hyper}+q" = "[class='Telegram'] focus";
    "${env.hyper}+s" = "[class='Slack'] focus";
    "${env.hyper}+f" = "[class='Emacs'] focus";
    "${env.hyper}+c" = "[class='Code'] focus";
    "${env.hyper}+i" = "[class='${env.apps.term.desktop}'] focus";
    "${env.hyper}+b" = "[class='Zathura'] focus";
  };

  workspaceAutoBackAndForth = true;

  keycodebindings = { };
}
