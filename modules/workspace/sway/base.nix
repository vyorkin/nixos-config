{ pkgs, lib, config, ... }:

let
  apps = config.defaultApps;

  thm = pkgs.my.thmHash;

  browser1 = apps.browser.cmd;
  browser2 = "${pkgs.google-chrome}/bin/google-chrome-stable";
  browser3 = "${pkgs.tor-browser}/bin/tor-browser";
  browser4 = "${pkgs.qutebrowser}/bin/qutebrowser";

  term1 = apps.term.cmd;
  term2 = "${pkgs.kitty}/bin/kitty";

  mod = "Mod4";
  hyper = "Alt_R";

  lock_fork =
    pkgs.writeShellScript "lock_fork" "sudo /run/current-system/sw/bin/lock &";
  lock = pkgs.writeShellScript "lock"
    "swaymsg 'output * dpms off'; sudo /run/current-system/sw/bin/lock; swaymsg 'output * dpms on'";

  step1 = "1";
  step2 = "10";
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
    extraPackages = lib.mkForce (with pkgs; [
      swayidle
      xwayland
      waybar
      swaykbdd
      swaybg
      wofi
      wlogout
      flashfocus
    ]);
  };
  programs.xwayland.enable = true;

  users.users.vyorkin.extraGroups = [ "sway" ];

  environment.loginShellInit = lib.mkAfter ''[[ "$(tty)" == /dev/tty1 ]] && sway'';

  home-manager.users.vyorkin.wayland.windowManager.sway = {
    enable = true;
    xwayland = true;

    config = rec {
      input = {
        "*" = {
          repeat_delay = "200";
          repeat_rate = "40";
        };
      };

      fonts = {
        names = [ config.themes.fonts.main.family ];
        style = "Regular";
        size = 9.0;
      };

      bars = [ ];

      colors = rec {
        background = thm.base00;
        unfocused = {
          text = thm.base02;
          border = thm.base01;
          background = thm.base00;
          childBorder = thm.base01;
          indicator = thm.base07;
        };
        focusedInactive = unfocused;
        urgent = unfocused // {
          text = thm.base05;
          border = thm.base09;
          childBorder = thm.base09;
        };
        focused = unfocused // {
          childBorder = thm.base03;
          border = thm.base03;
          background = thm.base01;
          text = thm.base05;
        };
      };

      gaps = {
        inner = 0;
        smartGaps = true;
        smartBorders = "on";
      };

      focus = {
        followMouse = false;
        # forceWrapping = true;
      };

      modifier = mod;

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
        { command = "${pkgs.xorg.xrdb}/bin/xrdb -merge ~/.Xresources"; }
        {
          command =
            "swayidle -w before-sleep '${lock_fork}' lock '${lock_fork}' unlock 'pkill -9 swaylock'";
        }
        { command = "${pkgs.swaykbdd}/bin/swaykbdd"; }
        { command = "${pkgs.flashfocus}/bin/flashfocus"; }
      ];

      modes = {
        resize = {
          Down = "resize grow height ${step2} px";
          Up = "resize shrink height ${step2} px";

          Escape = "mode default";
          Return = "mode default";

          Right = "resize grow width ${step2} px";
          Left = "resize shrink width ${step2} px";

          h = "resize shrink width ${step2} px";
          j = "resize grow height ${step2} px";
          k = "resize shrink height ${step2} px";
          l = "resize grow width ${step2} px";
        };
      };

      keybindings =
        let script = name: content: "exec ${pkgs.writeScript name content}";
        in {
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

          "${hyper}+1" = "workspace 11";
          "${hyper}+2" = "workspace 12";
          "${hyper}+3" = "workspace 13";
          "${hyper}+4" = "workspace 14";
          "${hyper}+5" = "workspace 15";
          "${hyper}+6" = "workspace 16";
          "${hyper}+7" = "workspace 17";
          "${hyper}+8" = "workspace 18";
          "${hyper}+9" = "workspace 19";
          "${hyper}+0" = "workspace 20";

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

          "${hyper}+Shift+1" = "move container to workspace 11";
          "${hyper}+Shift+2" = "move container to workspace 12";
          "${hyper}+Shift+3" = "move container to workspace 13";
          "${hyper}+Shift+4" = "move container to workspace 14";
          "${hyper}+Shift+5" = "move container to workspace 15";
          "${hyper}+Shift+6" = "move container to workspace 16";
          "${hyper}+Shift+7" = "move container to workspace 17";
          "${hyper}+Shift+8" = "move container to workspace 18";
          "${hyper}+Shift+9" = "move container to workspace 19";
          "${hyper}+Shift+0" = "move container to workspace 20";

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

          "${hyper}+Shift+l" = "exec ${pkgs.playerctl}/bin/playerctl next";
          "${hyper}+Shift+h" = "exec ${pkgs.playerctl}/bin/playerctl previous";
          "${hyper}+Shift+p" =
            "exec ${pkgs.playerctl}/bin/playerctl play-pause";
          "${hyper}+Shift+o" =
            "exec ${pkgs.lxqt.pavucontrol-qt}/bin/pavucontrol-qt";

          # Screenshots

          "${modifier}+Print" = script "screenshot"
            "${pkgs.grim}/bin/grim Pictures/$(date +'%Y-%m-%d+%H:%M:%S').png";

          "${modifier}+Control+Print" = script "screenshot-copy"
            "${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard}/bin/wl-copy";

          "--release ${modifier}+Shift+Print" = script "screenshot-area" ''
            ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" Pictures/$(date +'%Y-%m-%d+%H:%M:%S').png'';

          "--release ${modifier}+Control+Shift+Print" =
            script "screenshot-area-copy" ''
              ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.wl-clipboard}/bin/wl-copy'';

          "${modifier}+y" = "move workspace to output left";

          "${modifier}+Control+Shift+h" = "layout splith";
          "${modifier}+Control+Shift+v" = "layout splitv";
          "${modifier}+g" = "split h";
          "${modifier}+v" = "split v";

          "${modifier}+F1" = "move to scratchpad";
          "${modifier}+F2" = "scratchpad show";

          "${modifier}+F11" = "output * dpms off";
          "${modifier}+F12" = "output * dpms on";

          "${modifier}+x" = "exec ${lock}";
          "${modifier}+p" = "sticky toggle";
          "${modifier}+backslash" = script "0x0"
            ''wl-paste | curl -F"file=@-" https://0x0.st | wl-copy'';
          "${modifier}+b" = "focus mode_toggle";

          "${modifier}+Space" =
            script "" "${pkgs.wofi}/bin/wofi --show drun -f -i --width 320";

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

          "${modifier}+Return" = "exec ${term1}";
          "${modifier}+Shift+Return" = "exec ${term2}";

          "${modifier}+e" = "exec ${apps.editor.cmd}";

          # App focus

          "${hyper}+q" = "[class='Telegram'] focus";
          "${hyper}+s" = "[class='Slack'] focus";
          "${hyper}+f" = "[class='Emacs'] focus";
          "${hyper}+c" = "[class='Code'] focus";
          "${hyper}+i" = "[class='${apps.term.desktop}'] focus";
          "${hyper}+b" = "[class='Zathura'] focus";
        };

      keycodebindings = { };

      workspaceAutoBackAndForth = true;
    };
    wrapperFeatures = { gtk = true; };
    extraConfig = ''
      bindsym --to-code {
        ${mod}+h focus child; focus left
        ${mod}+j focus child; focus down
        ${mod}+k focus child; focus up
        ${mod}+l focus child; focus right

        ${mod}+Shift+h move left
        ${mod}+Shift+j move down
        ${mod}+Shift+k move up
        ${mod}+Shift+l move right
      }

      default_border pixel 1
      mouse_warping none
      hide_edge_borders --i3 smart
      exec pkill swaynag

      output * bg ${thm.base00} solid_color
    '';
  };
}
