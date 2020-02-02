{ pkgs, ... }:

{
  imports = [
    ./dbms.nix
    ./clients.nix
  ];

  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    authentication = pkgs.lib.mkForce ''
      # TYPE  DATABASE        USER            ADDRESS                 METHOD
      local   all             all                                     trust
      host    all             all             127.0.0.1/32            trust
      host    all             all             ::1/128                 trust
      host    all             all             0.0.0.0/0               md5
    '';
  };
}