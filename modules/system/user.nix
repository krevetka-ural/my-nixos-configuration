{ config, pkgs, username, ... }: {
# User settings
  users.users.${username} = {
    isNormalUser = true; # standart user, not root
    description = "RandomGitHubUser1234"; # enter your full name or nickname
    extraGroups = [ "networkmanager" "wheel" "video" "libvirtd" "audio" "input" "kvm" ];
    shell = pkgs.fish; # default shell fish
    ignoreShellProgramCheck = true; # Fish install via Home Manager
    packages = with pkgs; [ ];
  };
}
