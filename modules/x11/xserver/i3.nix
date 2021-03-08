{ pkgs, ... }:

{
  services.xserver = {
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;

      extraPackages = with pkgs; [
        i3lock-pixeled
        # i3lock
        # i3lock-color
        # i3lock-fancy
        # betterlockscreen
        # i3status-rust
        # i3-wk-switch
      ];
    };

    desktopManager = {
      plasma5.enable = true;
    };

    displayManager = {
      sddm.enable = true;
      job = {
        logToFile = true;
        logToJournal = true;
      };
    };
  };
}
