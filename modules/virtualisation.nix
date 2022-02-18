{ pkgs, ... }:

{
  virtualisation = {
    docker = {
      # Enable docker daemon
      enable = true;

      # Periodically prune docker resources
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };

    # Enable a daemon that manages virtual machines.
    # Docs: https://wiki.archlinux.org/index.php/libvirt
    libvirtd.enable = true;

    # Allow unprivileged user to pass USB devices connected to
    # this machine to libvirt VMs, both local and remote
    # spiceUSBRedirection.enable = true;
  };

  home-manager.users.vyorkin.home.packages = with pkgs; [ docker-compose ];
}
