{ config, pkgs, ... }:
{
# Virtual machines
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}