{ config, pkgs, ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format = ''
        ╭─ $os ─ $hostname@$username ─ $directory
        ├─ $time$status
        ╰─ $character
      '';
      os = {
        disabled = false;
        format = "[$symbol $type](blue)";
        symbols = {
          NixOS = "❄";
        };
      };
      username = {
        show_always = true;
        format = "[$user](cyan)";
      };
      hostname = {
        ssh_only = false;
        format = "[$hostname](cyan)";
      };
      directory = {
        format = "[$path](bold red)";
      };
      time = {
        disabled = false;
        format = "[$time](yellow)";
        time_format = "%H:%M";
      };
      status = {
        disabled = false;
        format = " ─ ✗ $status";
        pipestatus = true;
        symbol = "✗";
        not_executable_symbol = "✗";
        not_found_symbol = "✗";
        sigint_symbol = "✗";
        signal_symbol = "✗";
      };
      character = {
          success_symbol = "[\\$](bold green)";
          error_symbol = "[#](bold red)";
      };
    };
  };
}
