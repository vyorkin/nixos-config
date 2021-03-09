{ pkgs, lib, config, inputs, ... }:

{
  systemd.coredump.enable = true;

  environment.sessionVariables = config.home-manager.users.vyorkin.home.sessionVariables // {
    NIX_AUTO_RUN = "1";
  };

  home-manager.users.vyorkin = {
    xdg = {
      enable = true;
      userDirs.enable = true;
    };

    home.activation."mimeapps-remove" = {
      before = [ "linkGeneration" ];
      after = [ ];
      data = "rm -f /home/vyorkin/.config/mimeapps.list";
    };

    news.display = "silent";
    systemd.user.startServices = true;

    programs.direnv = {
      enable = true;
      enableNixDirenvIntegration = true;
    };
  };
}
