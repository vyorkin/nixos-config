{ lib, ... }:

{
  nix = {
    # Maximum number of jobs that Nix will try to build in parallel.
    # Set to the total number of logical cores in the system
    settings.max-jobs = lib.mkDefault 6;
  };
}
