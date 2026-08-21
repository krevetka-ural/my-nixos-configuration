{ config, pkgs, ... }: {
# Gamemode for performance
  programs.gamemode.enable = true;

# Steam settings
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Enable RemotePlay
    dedicatedServer.openFirewall = true; # Dedicated Servers for old games
  };
}
