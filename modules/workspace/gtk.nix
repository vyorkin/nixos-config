{ pkgs, old, config, lib, inputs, ... }:

let
  thm = config.themes.colors;
  thm' = builtins.mapAttrs (name: value: { hex.rgb = value; }) thm;
in {
  nixpkgs.overlays = [
    (self: super: {
      generated-gtk-theme =
        pkgs.callPackage "${inputs.rycee}/pkgs/materia-theme" {
          configBase16 = {
            name = "Generated";
            kind = "dark";
            colors = thm' // {
              base01 = thm'.base00;
              base02 = thm'.base00;
            };
          };
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
      font = {
        name = with config.themes.fonts; "${main.family} ${toString main.size}";
      };

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
