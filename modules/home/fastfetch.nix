{ pkgs, ... }:
{
# Fastfetch configuation
  programs.fastfetch = {
    enable = true;

  # Configuration
    settings = {
      logo = {
        source = "nixos_old";
      };
      display = {
        key = {
          width = 12;
        };
        bar = {
          char = "~>";
        };
      };

      modules = [
        "title"
        "separator"
        "break"
        {
          type = "os";
          key = "SYSTEM";
        }
        {
          type = "packages";
          key = "PACKAGES";
        }
        "break"
        {
          type = "de"; # or "wm"
          key = "DESKTOP";
        }
        {
          type = "terminal";
          key = "TERMINAL";
        }
        {
          type = "shell";
          key = "SHELL";
        }
        "break"
        {
          type = "cpu";
          key = "CPU";
        }
        {
          type = "gpu";
          key = "GPU";
        }
        {
          type = "memory";
          key = "RAM";
          percent = {
            type = 3;
          };
        }
        {
          type = "color";
          symbol = "circle";
        }
      ];
    };
  };
}