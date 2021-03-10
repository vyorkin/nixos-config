{
  home-manager.users.vyorkin = {
    programs.htop = {
      enable = true;
      vimMode = true;
      delay = 5;
      showCpuFrequency = true;
      showCpuUsage = true;
    };
  };
}
