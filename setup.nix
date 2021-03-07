{ config, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix
    ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      cores = 2
      connect-timeout = 3
      max-jobs = 4
      min-free = ${toString (500 * 1024 * 1024)}
      max-free = ${toString (5 * 1024 * 1024 * 1024)}
    '';

    # Enable automatic garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    # Detect files in the store that have identical contents,
    # and replace them with hard links to a single copy.
    autoOptimiseStore = true;

    optimise = {
      # Automatically run the nix optimiser at a specific time
      automatic = true;
      dates = [ "07:00" ];
    };

    # Number of nixbld user accounts created to perform secure
    # concurrent builds. If you receive an error message saying that
    # "all build users are currently in use", you should increase this value
    nrBuildUsers = 16;

    trustedBinaryCaches = [
      "http://hydra.nixos.org"
      "http://cache.nixos.org"

      "https://nixcache.reflex-frp.org"
      "https://nixfmt.cachix.org"
      "https://all-hies.cachix.org"
      "https://iohk.cachix.org"
      "https://ghcide-nix.cachix.org"
      "https://cache.dhall-lang.org"
      "https://dhall.cachix.org"
      "https://bs-platform.cachix.org"
    ];

    binaryCachePublicKeys = [
      "cache.dhall-lang.org:I9/H18WHd60olG5GsIjolp7CtepSgJmM2CsO813VTmM="
      "dhall.cachix.org-1:8laGciue2JBwD49ICFtg+cIF8ddDaW7OFBjDb/dHEAo="
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Automatically add other operating system to the grub menu.
  boot.loader.grub.useOSProber = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp4s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the GNOME 3 Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome3.enable = true;
  

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vyorkin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git wget neovim
    firefox ranger tmux
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}

