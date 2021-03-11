{ pkgs, config, lib, inputs, ... }:

let
  system = "x86_64-linux";
  old = import inputs.nixpkgs-20-09 ({
    config = config.nixpkgs.config;
    localSystem = { inherit system; };
  });
in {
  nixpkgs.overlays = [
    inputs.emacs.overlay
    inputs.nixpkgs-wayland.overlay

    (self: super: rec {
      nix = super.nix // {
        meta = super.nix.meta // { platforms = lib.platforms.unix; };
      };

      nur = (import inputs.NUR {
        pkgs = old;
        nurpkgs = pkgs;
      }).repos;

      inherit old;

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
