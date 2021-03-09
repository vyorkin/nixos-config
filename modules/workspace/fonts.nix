{ pkgs, lib, ... }:
{
  fonts = {
    fontconfig = {
      enable = lib.mkForce true;

      # Use embedded bitmaps for fonts like Calibri
      useEmbeddedBitmaps = true;

      # System-wide default fonts
      defaultFonts = {
        monospace = [ "IBM Plex Mono 13" ];
        sansSerif = [ "IBM Plex Sans 13" ];
        serif = [ "IBM Plex Serif 13" ];
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
}
