{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # grafana
    grafana-loki
    grafana_reporter
  ];

}
