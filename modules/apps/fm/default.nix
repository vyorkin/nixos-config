{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ranger

    # An alternative for w3mimgdisplay
    python39Packages.ueberzug
  ];

  home-manager.users.vyorkin = {
    programs.broot = {
      enable = false;
    };
  };
}
