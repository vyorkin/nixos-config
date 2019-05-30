{ pkgs, ... }:

{
  fonts = {
    fontconfig = {
      enable = true;
      useEmbeddedBitmaps = true;
      ultimate = {
        enable = true;
        substitutions = "combi";
        #useEmbeddedBitmaps = true;
      };
      defaultFonts = {
        monospace = [ "Hack" ];
        sansSerif = [ "Roboto" ];
        serif = [ "Roboto Slab" ];
      };
    };

    enableFontDir = true;
    enableGhostscriptFonts = true;

    fonts = with pkgs; [
      anonymousPro
      corefonts
      dejavu_fonts
      dosemu_fonts
      emacs-all-the-icons-fonts
      league-of-moveable-type
      emojione
      fantasque-sans-mono
      fira
      fira-code
      fira-code-symbols
      fira-mono
      font-awesome-ttf
      freefont_ttf
    # nerdfonts
      go-font
      gohufont
      google-fonts
      hack-font
      inconsolata
      iosevka
      liberation_ttf
      mononoki
      mplus-outline-fonts
      noto-fonts
      noto-fonts-emoji
      powerline-fonts
      profont
      proggyfonts
      roboto
      roboto-mono
      roboto-slab
      source-code-pro
      terminus_font
      terminus_font_ttf
      ttf_bitstream_vera
      ubuntu_font_family
      unifont
      vistafonts
      hasklig
      stix-otf
      stix-two
    ];
  };
}
