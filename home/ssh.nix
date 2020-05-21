{ pkgs, lib, config, inputs, ... }:

{
  home-manager.users = lib.attrsets.genAttrs config.nix.trustedUsers (_: {
    home.file = {
      ".ssh" = {
        source = "${inputs.secrets}/ssh";
        recursive = true;
      };
    };
  });
}
