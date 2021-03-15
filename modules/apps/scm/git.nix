{ inputs, pkgs, ... }:

{
  home-manager.users.vyorkin = {
    programs.git = {
      enable = true;

      # Enable delta syntax highlighter
      delta.enable = true;
    };

    home.packages = with pkgs; [ delta ];

    home.file = {
      ".gitconfig" = { source = "${inputs.git-config}/gitconfig"; };
      ".gitignore" = { source = "${inputs.git-config}/gitignore"; };
      ".gitmessage" = { source = "${inputs.git-config}/gitmessage"; };
    };
  };
}
