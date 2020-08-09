{ pkgs, lib, config, inputs, ... }:

{
  home-manager.users = lib.attrsets.genAttrs config.nix.trustedUsers (_: {
    home.file = {
      "cachix.dhall" = {
        source = "${inputs.secrets}/cachix/${config.host}.dhall";
        target = ".config/cachix/cachix.dhall";
      };

      ".authinfo" = { source = "${inputs.secrets}/authinfo"; };
      ".secret_tokens" = { source = "${inputs.secrets}/secret_tokens"; };
      ".netrc" = { source = "${inputs.secrets}/netrc"; };
      ".offlineimaprc" = { source = "${inputs.secrets}/offlineimaprc"; };
      ".goobookrc" = { source = "${inputs.secrets}/goobookrc"; };
      ".goobook_auth.json" = { source = "${inputs.secrets}/goobook_auth.json"; };
      ".bumblebee-status.conf" = { source = "${inputs.secrets}/bumblebee-status.conf"; };
      ".gitcfg" = { source = "${inputs.secrets}/gitcfg"; };

      "secrets" = {
        source = "${inputs.secrets}/emacs";
        target = ".emacs.d/secrets";
        recursive = true;
      };
    };
  });
}
