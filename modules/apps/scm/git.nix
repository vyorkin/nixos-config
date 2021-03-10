{ inputs, ... }:

{
  home-manager.users.vyorkin = {
    programs.git.enable = true;

    home.file = {
      ".gitconfig" = { source = "${inputs.git-config}/gitconfig"; };
      ".gitignore" = { source = "${inputs.git-config}/gitignore"; };
      ".gitmessage" = { source = "${inputs.git-config}/gitmessage"; };
    };
  };
}
