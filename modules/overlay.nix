{ pkgs, config, lib, inputs, ... }:

let
  filterGit =
    builtins.filterSource (type: name: name != ".git" || type != "directory");

  system = "x86_64-linux";
  old = import inputs.nixpkgs-21-11 ({
    config = config.nixpkgs.config;
    localSystem = { inherit system; };
  });

  mkKeyValue = key: value:
    let
      mvalue = if builtins.isBool value then
        (if value then "true" else "false")
      else if builtins.isString value then
        value
      else
        builtins.toString value;
    in ''${key}=${mvalue}'';
  attrsToList = with builtins;
    x:
    (map (key: {
      name = key;
      value = getAttr key x;
    }) (attrNames x));
in {
  nixpkgs.overlays = [
    inputs.emacs.overlay
    # inputs.nixpkgs-wayland.overlay

    (self: super: rec {
      nix = super.nix // {
        meta = super.nix.meta // { platforms = lib.platforms.unix; };
      };

      my = rec {
        genIni = lib.generators.toINI { inherit mkKeyValue; };
        genIniOrdered = lst:
          (builtins.concatStringsSep "\n" (map ({ name ? "widget", ... }@attrs:
            builtins.concatStringsSep "\n" ([ "[${name}]" ]
              ++ (map ({ name, value }: mkKeyValue name value)
                (attrsToList (builtins.removeAttrs attrs [ "name" ]))))) lst))
          + "\n";
        thm = config.themes.colors;
        splitHex = hexStr:
          map (x: builtins.elemAt x 0) (builtins.filter (a: a != "" && a != [ ])
            (builtins.split "(.{2})" hexStr));
        hex2decDigits = rec {
          "0" = 0;
          "1" = 1;
          "2" = 2;
          "3" = 3;
          "4" = 4;
          "5" = 5;
          "6" = 6;
          "7" = 7;
          "8" = 8;
          "9" = 9;
          "a" = 10;
          "b" = 11;
          "c" = 12;
          "d" = 13;
          "e" = 14;
          "f" = 15;
          A = a;
          B = b;
          C = c;
          D = d;
          E = e;
          F = f;
        };

        doubleDigitHexToDec = hex:
          16 * hex2decDigits."${builtins.substring 0 1 hex}"
          + hex2decDigits."${builtins.substring 1 2 hex}";
        thmDec = builtins.mapAttrs (name: color: colorHex2Dec color) thm;
        thmHash = builtins.mapAttrs (name: color: "#${color}") thm;
        colorHex2Dec = color:
          builtins.concatStringsSep ","
          (map (x: toString (doubleDigitHexToDec x)) (splitHex color));
      };

      nur = (import inputs.NUR {
        pkgs = old;
        nurpkgs = pkgs;
      }).repos;

      inherit old;

      nerdfonts = nur.balsoft.pkgs.roboto-mono-nerd;

      mtxclient = super.mtxclient.overrideAttrs (_: {
        src = inputs.mtxclient;
      });

      nheko = (super.nheko.overrideAttrs (oa: {
        src = inputs.nheko;
      })).override { mtxclient = self.mtxclient; };

      weechatScripts.wee-slack = super.weechatScripts.wee-slack.overrideAttrs (oa: {
        src = inputs.wee-slack;
        patches = [(builtins.elemAt oa.patches 0)];
      });

      nix-zsh-completions = super.nix-zsh-completions.overrideAttrs (_: {
        src = inputs.nix-zsh-completions;
      });
    })
  ];
}
