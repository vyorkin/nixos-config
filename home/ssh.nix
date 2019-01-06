{ pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    compression = true;

    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_rsa";
      };

      "bitbucket.org" = {
        hostname = "bitbucket.org";
        user = "git";
        identityFile = "~/.ssh/id_rsa";
      };

      "ksazdp" = {
        hostname = "10.101.102.130";
        user = "deployer";
        identityFile = "~/.ssh/id_rsa";
      };

      "ksazds" = {
        hostname = "10.101.102.250";
        user = "deployer";
        identityFile = "~/.ssh/id_rsa";
      };

      "dedimax" = {
        hostname = "91.134.122.220";
        user = "root";
        identityFile = "~/.ssh/id_rsa";
      };
    };
  };
}
