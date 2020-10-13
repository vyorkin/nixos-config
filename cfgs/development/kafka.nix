{ pkgs, ... }:

{
  services = {
    apache-kafka = {
      enable = true;
      port = 9092;
    };

    zookeeper = {
      enable = true;
      port = 2181;
    };
  };

  environment.systemPackages = with pkgs; [
    kafkacat
    kt
    kcli
  ];
}
