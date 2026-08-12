{ config, pkgs, username, ... }:
{
  users.users.${username} = {
    isNormalUser = true; # Standart user, not root
    description = "RandomGitHubUser1234"; # Enter your full name or nickname
    extraGroups = [ "networkmanager" "wheel" "video" "libvirtd" "audio" "input" "kvm" ];
    shell = pkgs.fish; # Default shell fish
    packages = with pkgs; [
    ];
  };
}