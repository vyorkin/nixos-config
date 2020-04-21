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
    secretnix = import ../secret.nix;

    # > lib.mapAttrs (name: value: name + "-" + value) { x = "foo"; y = "bar"; }
    # { x = "x-foo"; y = "y-bar"; }
    secrets = if isNull secretnix then
      mapAttrs (n: v: null) options.secrets
    else
      secretnix;
  in { inherit secrets; };
}
