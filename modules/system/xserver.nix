{ config, pkgs, ... }:
{
  console.useXkbConfig = true;
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:caps_toggle";
  };
}