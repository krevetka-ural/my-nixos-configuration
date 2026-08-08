{ config, pkgs, username, ... }:
{
  users.users.${username} = {
    isNormalUser = true; # Standart user, not root
    description = "Krevedka"; # Name Krevedka lol
    initialPassword = "nixos1234";
    extraGroups = [ "networkmanager" "wheel" "video" "libvirtd" "audio" "input" "kvm" ];
    shell = pkgs.fish; # Default shell fish
    packages = with pkgs; [
    ];
  };
}