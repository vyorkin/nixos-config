{ pkgs, config, lib, ... }:

{
  fonts = {
    fontconfig =
      let fonts = config.themes.fonts;
      in {
        enable = lib.mkForce true;

        # System-wide default fonts
        defaultFonts = {
          monospace = [ "${fonts.mono.family} ${toString fonts.mono.size}" ];
          sansSerif = [ "${fonts.main.family} ${toString fonts.main.size}" ];
          serif = [ "${fonts.serif.family} ${toString fonts.serif.size}" ];
      };
    };

    # Enable a basic set of fonts providing font styles and
    # families and reasonable coverage of Unicode
    enableDefaultFonts = true;

    # Create a directory with links to all fonts in
    # /run/current-system/sw/share/X11/fonts
    fontDir.enable = true;

    # List of primary font paths
    fonts = with pkgs; [
      ibm-plex
      jetbrains-mono
      hasklig
      hack-font
      nerdfonts

      material-design-icons
      material-icons

      powerline-fonts
      emacs-all-the-icons-fonts

      fira
      fira-mono
      fira-code
      fira-code-symbols

      noto-fonts
      noto-fonts-emoji

      roboto
      roboto-mono
      roboto-slab

      anonymousPro
      corefonts
      source-code-pro
      symbola
    ];
  };

  themes.fonts = {
    main = {
      family = "IBM Plex Sans";
      size = 12;
    };
    serif = {
      family = "IBM Plex Serif";
      size = 12;
    };
    mono = {
      family = "IBM Plex Mono";
      size = 12;
    };
  };
}
