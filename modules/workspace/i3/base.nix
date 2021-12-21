{ pkgs, inputs, lib, config, ... }:

let
  cfg = import ./config/base.nix { inherit pkgs lib config; };
  env = import ./config/env.nix { };
  scripts = import ./scripts pkgs config;
in {
  services.xserver = {
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      configFile = ./config/native;
      extraPackages = with pkgs; [
        i3status
        i3blocks
        xrandr-invert-colors
        dmenu
        nitrogen
        rofi
        dunst
        betterlockscreen
        i3lock-pixeled
      ];
    };
  };

  # It seems that i3blocks read it's contents from a hardcoded path in /etc by default.
  # Since in nixos, this path look something like:
  # /nix/store/k78nc1bplhy4yjblqwlc14h6rdisix3w-i3blocks-1.4/libexec/i3blocks/[BLOCKS]
  # So we have to create a link to this path by adding this line:
  environment.pathsToLink = [ "/libexec" ];

  home-manager.users.vyorkin = {
    services.picom = {
      # Enable Picom X11 compositor.
      enable = true;

      # Opacity of active windows.
      activeOpacity = "0.9";

      # Backend to use: glx or xrender.
      backend = "xrender";

      # Disable background blur on transparent windows.
      blur = false;

      # List of windows to exclude background blur.
      # See the picom(1) man page for more examples.
      blurExclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "class_g = 'i3-frame'"
        "_GTK_FRAME_EXTENTS@:c"
      ];

      # Don't fade windows in and out.
      fade = true;

      # Time between fade animation step (in ms).
      fadeDelta = 7;

      # List of conditions of windows that should not be faded.
      # See the picom(1) man page for more examples.
      fadeExclude = [];

      # Opacity change between fade steps (in and out).
      fadeSteps = [ "0.05" "0.05" ];

      # Dim inactive windows.
      # inactiveDim = "0.2";

      # Opacity of inactive windows.
      inactiveOpacity = "0.8";

      # Opacity of dropdown and popup mune.
      menuOpacity = "0.90";

      # Avoid shadow on drag-and-drop windows.
      noDNDShadow = true;

      # Avoid shadow on docks.
      noDockShadow = true;

      # Automatically detect screen refresh rate.
      refreshRate = 0;

      # Draw window shadows.
      shadow = true;

      # List of conditions of windows that should have no shadow.
      # See the picom(1) man page for more examples.
      shadowExclude = [
        "name = 'Notification'"
        "_GTK_FRAME_EXTENTS@:c"
        "class_g = 'i3-frame'"
        "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
        "_NET_WM_STATE@:32a *= '_NET_WM_STATE_STICKY'"
        "!I3_FLOATING_WINDOW@:c"
        "! name~=''"
        "n:e:Notification"
        "n:e:Plank"
        "n:e:Docky"
        "g:e:Synapse"
        "g:e:Kupfer"
        "g:e:Conky"
        "n:w:*Firefox*"
        "n:w:*Chrome*"
        "n:w:*Chromium*"
        "class_g ?= 'Notify-osd'"
        "class_g ?= 'Cairo-dock'"
        "class_g ?= 'Xfce4-notifyd'"
        "class_g ?= 'Xfce4-power-manager'"
      ];

      # Horizontal and vertical offsets for shadows (in pixels).
      shadowOffsets = [ (-5) 0 ];

      # Window shadows opacity (number in range 0 - 1).
      shadowOpacity = "0.8";

      # Disable vertical synchronization.
      vSync = false;

      extraOptions = ''
        # Shadow
        shadow-radius = 10;
        shadow-red = 0.11;
        shadow-green = 0.12;
        shadow-blue = 0.13;
        shadow-ignore-shaped = true;

        # Opacity
        frame-opacity = 0.90;  # i.e. titlebars, borders
        inactive-opacity-override = false;
        # opacity-rule = [
        #   "99:class_g = 'Google-chrome' && focused",
        #   "99:class_g = 'Firefox' && focused"
        # ];

        mark-wmwin-focused = true;
        mark-ovredir-focused = true;

        # Use EWMH _NET_WM_ACTIVE_WINDOW to determine which window is focused instead of using FocusIn/Out events.
        # Usually more reliable but depends on a EWMH-compliant WM.
        use-ewmh-active-win = true;

        # Detect rounded corners and treat them as rectangular when --shadow-ignore-shaped is on.
        detect-rounded-corners = true;

        # detect-client-opacity = true;
        dbe = false;
        unredir-if-possible = false;
        focus-exclude = [ "class_g = 'Cairo-clock'" ];
        detect-transient = true;
        detect-client-leader = true;
        invert-color-include = [ ];
      '';
    };

    home.file = {
      "i3blocks-contrib" = {
        source = inputs.i3blocks-contrib;
        target = ".config/i3blocks-contrib";
      };
      "i3blocks-custom" = {
        source = ./config/blocks;
        target = ".config/i3blocks-custom";
      };
      "i3blocks" = {
        source = ./config/i3blocks.conf;
        target = ".i3blocks.conf";
      };
      "dunst" = {
        source = ./dunst;
        target = ".config/dunst";
        recursive = true;
      };
      "rofi" = {
        source = ./rofi;
        target = ".config/rofi";
      };
    };
  };
}
