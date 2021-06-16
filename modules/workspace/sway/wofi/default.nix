{ config, lib, pkgs, ... }:

let
  wofiConfig = {
    key_left = "Control_L-h";
    key_down = "Control_L-j";
    key_up = "Control_L-k";
    key_right = "Control_L-l";
    term = "${config.defaultApps.term.cmd}";
    insensitive = true;
  };

  wofiTheme = ''
    window {
      margin: 0px;
      border: 1px solid #222222;
      background-color: #000000;
    }
    #input {
      margin: 5px;
      border: none;
      color: #FFFFFF;
      background-color: #222222;
    }
    #inner-box {
      margin: 5px;
      border: none;
      background-color: #222222;
    }
    #outer-box {
      margin: 5px;
      border: none;
      background-color: #222222;
    }
    #scroll {
      margin: 0px;
      border: none;
    }
    #text {
      margin: 5px;
      border: none;
      color: #FFFFFF;
    }
    #text:selected {
      color: #FFFFFF;
    }
    #entry:selected {
      background-color: #000000;
      color: #FFFFFF;
    }
  '';
in {
  home-manager.users.vyorkin = {
    xdg.configFile."wofi/style.css".text = wofiTheme;
    xdg.configFile."wofi/config".text =
      lib.generators.toKeyValue { } wofiConfig;
  };
}
