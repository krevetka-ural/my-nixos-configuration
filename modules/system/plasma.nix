{ config, pkgs, ... }:
{
  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs.kdePackages; [
    partitionmanager
    kdenlive
    kcalc
    kate
    gwenview
    spectacle
    ark
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    qrca
    print-manager
    plasma-browser-integration
  ];
}