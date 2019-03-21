{ ... }:

{
  home.file = {
    ".psqlrc" = { source = ./dotfiles/postgresql/psqlrc; };

    "pgcli" = {
      source = ./dotfiles/postgresql/pgcli;
      target = ".config/pgcli/config";
    };
  };
}
