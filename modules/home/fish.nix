{ pkgs, username, hostname, ... }: {
#  <*>< <*>< <*>< 
  programs.fish = {
    enable = true;

  # Disable greeting and show fastfetch
    interactiveShellInit = ''
      set fish_greeting
      fastfetch
    '';

  # Aliases for fish
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#${hostname}";
      ddeell = "sudo nix-collect-garbage -d";
      snano = "sudo nano";
      home = "cd /home/${username}/";
      edit = "cd /etc/nixos";
      bye = "sudo reboot";
      ff = "fastfetch";
      bb = "bash";
    };
  };
}
