{ config, pkgs, username, ... }:
{
  users.users.${username} = {
    isNormalUser = true; # Standart user, not root
    description = "RandomGitHubUser1234"; # Enter your full name or nickname
    initialPassword = "nixos1234"; # Delete this line, after installation and login! Change password via "passwd"!
    extraGroups = [ "networkmanager" "wheel" "video" "libvirtd" "audio" "input" "kvm" ];
    shell = pkgs.fish; # Default shell fish
    packages = with pkgs; [
    ];
  };
}