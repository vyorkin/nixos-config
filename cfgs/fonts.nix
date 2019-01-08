{ pkgs, ... }:

{
  fonts = {
    fontconfig = {
      enable = true;
      useEmbeddedBitmaps = true;
    };

    enableFontDir = true;
    enableGhostscriptFonts = true;

    fonts = with pkgs; [
      anonymousPro
      corefonts
      dejavu_fonts
      dosemu_fonts
      emacs-all-the-icons-fonts
      emojione
      fantasque-sans-mono
      fira
      fira-code
      fira-mono
      font-awesome-ttf
      freefont_ttf
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
    ];
  };
}
