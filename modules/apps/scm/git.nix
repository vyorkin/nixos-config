{ inputs, ... }:

{
  home-manager.users.vyorkin = {
    programs.git.enable = true;

    home.file = {
      ".gitconfig" = { source = "${inputs.gitconfig}/gitconfig"; };
      ".gitignore" = { source = "${inputs.gitconfig}/gitignore"; };
      ".gitmessage" = { source = "${inputs.gitconfig}/gitmessage"; };
    };
  };
}
