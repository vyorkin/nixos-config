{
  services.openssh = {
    enable = true;
    settings = {
      passwordAuthentication = false;
      permitRootLogin = "no";
      # forwardX11 = true;
    };
    ports = [ 22 ];
  };

  home-manager.users.vyorkin.programs.ssh = {
    enable = true;
    matchBlocks = {
      "*" = {
        compression = false;
      };
    };
  };
}
