{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

  # Disable greeting and show fastfetch
    interactiveShellInit = ''
      set fish_greeting
      fastfetch
    '';

  # Aliases for fish
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake .";
      shit = "sudo reboot";
      ff = "fastfetch";
      bb = "bash";
    };
  };
}