{ pkgs, config, lib, inputs, ... }:
let
  theme = builtins.mapAttrs (name: value: builtins.substring 1 7 value) config.themes.colors;
  materia_colors = pkgs.writeTextFile {
    name = "gtk-generated-colors";
    text = ''
      BG=${theme.bg}
      FG=${theme.fg}
      BTN_BG=${theme.bg}
      BTN_FG=${theme.fg}
      MENU_BG=${theme.bg}
      MENU_FG=${theme.fg}
      ACCENT_BG=${theme.alt}
      SEL_BG=${theme.dark}
      SEL_FG=${theme.bg}
      TXT_BG=${theme.bg}
      TXT_FG=${theme.fg}
      HDR_BTN_BG=${theme.bg}
      HDR_BTN_FG=${theme.fg}
      WM_BORDER_FOCUS=${theme.alt}
      WM_BORDER_UNFOCUS=${theme.dark}
      MATERIA_STYLE_COMPACT=True
      MATERIA_COLOR_VARIANT=dark
      UNITY_DEFAULT_LAUNCHER_STYLE=False
      NAME=generated
    '';
  };
in {
  nixpkgs.overlays = [
    (self: super: {
      generated-gtk-theme = self.stdenv.mkDerivation rec {
        name = "generated-gtk-theme";
        src = inputs.materia-theme;
        buildInputs = with self; [ sassc bc which inkscape optipng ];
        installPhase = ''
          HOME=/build
          chmod 777 -R .
          patchShebangs .
          mkdir -p $out/share/themes
          substituteInPlace change_color.sh --replace "\$HOME/.themes" "$out/share/themes"
          echo "Changing colours:"
          ./change_color.sh -o Generated ${materia_colors}
          chmod 555 -R .
        '';
      };
    })
  ];

  home-manager.users.vyorkin = {
    gtk = {
      enable = true;
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      theme = {
        name = "Generated";
        package = pkgs.generated-gtk-theme;
      };
      font = { name = "IBM Plex 12"; };
      gtk3 = {
        bookmarks = [
          "file:///home/vyorkin/projects Projects"
        ];
        extraConfig = {
          gtk-cursor-theme-name = "Breeze";
        };
      };
    };

    home.sessionVariables.GTK_THEME = "Generated";
  };
}
