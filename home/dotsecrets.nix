{ pkgs, inputs, ... }:

# let host = import ../host.nix;
# in
{
  # home-manager.users.root = {
  #   home.file = {
  #     "cachix.dhall" = {
  #       source = "${inputs.secrets}/cachix + "/${host.name}.dhall";
  #       target = ".config/cachix/cachix.dhall";
  #     };
  #   };
  # };

  home-manager.users.vyorkin = {
    home.file = {
      ".authinfo" = { source = "${inputs.secrets}/authinfo"; };
      ".secret_tokens" = { source = "${inputs.secrets}/secret_tokens"; };
      ".netrc" = { source = "${inputs.secrets}/netrc"; };
      ".offlineimaprc" = { source = "${inputs.secrets}/offlineimaprc"; };
      ".goobookrc" = { source = "${inputs.secrets}/goobookrc"; };
      ".goobook_auth.json" = { source = "${inputs.secrets}/goobook_auth.json"; };
      ".bumblebee-status.conf" = { source = "${inputs.secrets}/bumblebee-status.conf"; };

      # "cachix.dhall" = {
      #   source = "${inputs.secrets}/cachix + "/${host.name}.dhall";
      #   target = ".config/cachix/cachix.dhall";
      # };

      "secrets" = {
        source = "${inputs.secrets}/emacs";
        target = ".emacs.d/secrets";
        recursive = true;
      };
    };
  };
}
