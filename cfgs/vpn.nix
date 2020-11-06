{ pkgs, inputs, ... }:

{
  services.openvpn = {
    servers = {
      home = {
        config = "config ${inputs.secrets}/vpn/home.ovpn";
        autoStart = false;
        updateResolvConf = true;
      };

      work = {
        config = "config ${inputs.secrets}/vpn/work.ovpn";
        autoStart = false;
        updateResolvConf = true;
      };
    };
  };
}
