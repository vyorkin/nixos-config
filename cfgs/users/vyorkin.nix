{ authorizedKeys, ... }:

{
  isNormalUser = true;
  uid = 1000;
  description = "Vasiliy Yorkin";
  home = "/home/vyorkin";
  extraGroups = [
    "wheel"
    "video"
    "audio"
    "networkmanager"
    "input"
    "scanner"
    "lp"

    # access to the serial and USB ports
    "dialout"

    # grant access to Android Debug Bridge (ADB)
    "adbusers"

    "vboxusers"
    "wireshark"
    "docker"
    "adbusers"
    "render"
  ];
  createHome = true;
  initialPassword = "whatever";
  useDefaultShell = true;
  openssh.authorizedKeys.keys = authorizedKeys;
}
