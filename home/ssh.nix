{ pkgs, inputs, ... }:

{
  home-manager.users.vyorkin = {
    home.file = {
      ".ssh" = {
        source = "${inputs.secrets}/ssh";
      };
    };
  };
}
