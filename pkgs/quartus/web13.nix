let nixpkgs = import ./pinned-nixpkgs.nix;
in (nixpkgs.callPackage ./quartus-versions.nix {}).altera-quartus-ii-web-13
