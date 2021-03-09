{
  home-manager.users.vyorkin = {
    home.file = {
      ".psqlrc" = { source = ./psqlrc; };

      "pgcli" = {
        source = ./pgcli;
        target = ".config/pgcli/config";
      };
    };
  };
}
