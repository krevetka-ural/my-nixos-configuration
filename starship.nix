programs.starship = {
  enable = true;
  enableFishIntegration = true;

  settings = {
    format = ''
      ╭─ $os $username@$hostname ─ $directory
      ├─ $time$status
      ╰─ $character
    '';

    os = {
      disabled = false;
      format = "[$symbol $type](bold blue)";
      symbols = {
        NixOS = "❄";
        Windows = "♿";
        MacOS = "🍎";
      };
    };

    username = {
      show_always = true;
      format = "[$user](bold white)";
    };

    hostname = {
      ssh_only = false;
      format = "[$hostname](bold white)";
    };

    directory = {
      format = "[$path](bold cyan)";
    };

    time = {
      disabled = false;
      format = "[$time](blue)";
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
      success_symbol = "[\\$](bold blue)";
      error_symbol = "[#](bold red)";
    };
  };
};