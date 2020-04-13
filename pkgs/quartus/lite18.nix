let nixpkgs = import ./pinned-nixpkgs.nix;
in (nixpkgs.callPackage ./quartus-versions.nix {}).altera-quartus-prime-lite-18
