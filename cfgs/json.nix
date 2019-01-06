{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jq
    jid
  ];
}
