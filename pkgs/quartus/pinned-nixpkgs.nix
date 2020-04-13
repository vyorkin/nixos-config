let fetcher = { owner
              , repo
              , rev
              , sha256
              }:
    builtins.fetchTarball
    {
        inherit sha256;
        url = "https://github.com/${owner}/${repo}/archive/${rev}.tar.gz";
    };
    nixpkgs-src = fetcher
    {
        owner = "nixos";
        repo = "nixpkgs-channels";
        rev = "95fed28ac372c61eb83c87ad97c24b0f957827bf";
        sha256 = "03jdb28khdm45gzwl7wvcb7h10yb6y45s7ds8bhlfk9a8phzj4hx";
    };
in import nixpkgs-src {}
