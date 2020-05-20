{ lib, inputs, ... }:

let
  userjs = builtins.readFile "${inputs.ghacks}/user.js";
  userjs-overrides = builtins.readFile ../dotfiles/firefox/ghacks-user-overrides.js;
in
with import ../../support.nix { inherit lib; }; {
  home-manager.users.vyorkin = {
    home.file = {
      "qutebrowser" = {
        source = ../dotfiles/qutebrowser;
        target = ".config/qutebrowser";
        recursive = true;
      };

      ".mozilla/firefox/profiles.ini".text = genIni {
        General.StartWithLastProfile = 1;
        Profile0 = {
          Name = "default";
          IsRelative = 1;
          Path = "profile.default";
          Default = 1;
        };
      };

      # see: https://github.com/ghacksuserjs/ghacks-user.js/wiki/3.2-Applying-Your-Changes
      ".mozilla/firefox/profile.default/user.js".text = userjs + "\n\n" + userjs-overrides;
    };
  };
}
