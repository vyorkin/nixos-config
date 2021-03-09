{
  services.xserver.displayManager = {
    sddm.enable = true;
    job = {
      logToFile = true;
      logToJournal = true;
    };
  };
}
