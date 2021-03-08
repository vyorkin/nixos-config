{
  networking = {
    # The global useDHCP flag is deprecated, therefore
    # explicitly set to false here. Per-interface useDHCP will
    # be mandatory in the future
    useDHCP = false;

    interfaces = {
      enp4s0.useDHCP = true;
    };

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };
}
