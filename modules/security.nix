{
  security = {
    # Whether users of the wheel group must provide a
    # password to run commands as super user via sudo
    sudo = {
      wheelNeedsPassword = false;
    };

    # Enable the AppArmor Mandatory Access Control system
    apparmor.enable = true;
  };

  programs = {
    # Enable the Firejail namespaces and seccomp-bpf sandbox.
    # See: https://github.com/netblue30/firejail
    firejail.enable = true;
  };
}
