{
  home-manager.users.vyorkin = {
    home.file = {
      "monitoring" = {
        source = ./monitoring.sgrd;
        target = ".config/ksysguard/monitoring.sgrd";
      };
    };
  };
}
