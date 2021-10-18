{
  home-manager.users.vyorkin = {
    services = {
      lorri.enable = true;
      # dropbox.enable = true;

      # Automatically mount new devices
      udiskie = {
        enable = true;
      };
    };
  };
}
