{ pkgs, config, lib, ... }:

with lib;
with types;
let
  secret = description:
  mkOption {
    inherit description;
    type = nullOr str;
  };
  mkCredOption = service: extra:
  mkOption {
    description = "Credentials for ${service}";
    type = nullOr (submodule {
      options = {
        user = mkOption {
          type = str;
          description = "Username for ${service}";
        };
        password = mkOption {
          type = str;
          description = "Password for ${service}";
        };
      } // extra;
    });
  };
in rec {
  options.secrets = {
    cachix_signing_key = secret "CACHIX_SIGNING_KEY";
  };
  config = let
    unlocked = import (pkgs.runCommand "check-secret" { }
      "set +e; grep -qI . ${../secret.nix}; echo $? > $out") == 0;
    secretnix = import ../secret.nix;
    secrets = if !unlocked || isNull secretnix then
      builtins.trace "secret.nix locked, building without any secrets"
      (mapAttrs (n: v: null) options.secrets)
    else
      secretnix;
  in { inherit secrets; };
}
