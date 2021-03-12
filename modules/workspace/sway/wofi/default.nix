{ config, lib, pkgs, ... }:

let
  theme = config.themes.colors;
  wofiConfig = {
    key_left = "Control_L-h";
    key_down = "Control_L-j";
    key_up = "Control_L-k";
    key_right = "Control_L-l";
    term = "${config.defaultApps.term.cmd}";
    insensitive = true;
  };

  wofiTheme = with config.theme.colors; ''
    window {
      margin: 0px;
      border: 1px solid ${theme.dark};
      background-color: ${theme.bg};
    }
    #input {
      margin: 5px;
      border: none;
      color: ${theme.fg};
      background-color: ${theme.dark};
    }
    #inner-box {
      margin: 5px;
      border: none;
      background-color: ${theme.dark};
    }
    #outer-box {
      margin: 5px;
      border: none;
      background-color: ${theme.dark};
    }
    #scroll {
      margin: 0px;
      border: none;
    }
    #text {
      margin: 5px;
      border: none;
      color: ${theme.fg};
    }
    #text:selected {
      color: ${theme.fg};
    }
    #entry:selected {
      background-color: ${theme.bg};
      color: ${theme.fg};
    }
  '';
in {
  home-manager.users.vyorkin = {
    xdg.configFile."wofi/style.css".text = wofiTheme;
    xdg.configFile."wofi/config".text =
      lib.generators.toKeyValue { } wofiConfig;
  };
}
