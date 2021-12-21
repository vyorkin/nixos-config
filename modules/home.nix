{ config, ... }:

{
  environment.sessionVariables =
    config.home-manager.users.vyorkin.home.sessionVariables // {
      NIX_AUTO_RUN = "1";
    };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.vyorkin = {
      news.display = "silent";

      # Start new or changed services automatically.
      # Stop obsolte services from the previous generation
      systemd.user = {
        startServices = true;
      };

      programs.direnv = {
        enable = true;
        nix-direnv = {
          enable = true;
          # package = inputs.nix-direnv.defaultPackage.${pkgs.system};
        };
      };

      home.stateVersion = "20.09";
    };
  };
}
