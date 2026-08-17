{ pkgs, ... }:
{
# Fastfetch configuration
  programs.fastfetch = {
    enable = true;

  # Configuration
    settings = {
      logo = {
        source = "nixos_old";
      };
      display = {
        separator = " = ";
      };

      modules = [
      {
          type = "custom";
          format = "# fastfetch.nix";
      }
      {
        type = "custom";
        format = "{ config, pkgs, lib, ... }:";
      }
      {
        type = "custom";
        format = "{";
      }
      {
        type = "custom";
        format = "# Nix System Configuration";
      } 
      {
        type = "os";
        key = "  system.stateVersion";
        format = "{4} {12};";
      } 
      {
        type = "packages";
        key = "  environment.systemPackages";
        format = "{1};";
      } 
      "break"
      {
        type = "custom";
        format = "# Nix Terminal Config";
      } 
      {
        type = "de";
        key = "  services.desktopManager";
        format = "{1};";
      } 
      {
        type = "terminal";
        key = "  programs.terminal";
        format = "{1};";
      } 
      {
        type = "shell";
        key = "  users.defaultUserShell";
        format = "{1};";
      } 
      "break"
      {
        type = "custom";
        format = "# Hardware Configuration My PC";
      } 
      {
        type = "cpu";
        key = "  hardware.processor";
        format = "{1};";
      } 
      {
        type = "gpu";
        key = "  services.xserver.videoCard";
        format = "{1} {2};";
      } 
      {
        type = "memory";
        key = "  hardware.memorySize";
        format = "[{3}] {2};";
      } 
      {
        type = "monitor";
        key = "  hardware.monitorsConfig";
        format = "[{2}x{3}] {refresh-rate}Hz;";
      }
      "break"
      {
        type = "custom";
        format = "# Boot Options";
      } 
      {
        type = "kernel";
        key = "  boot.kernelPackages";
        format = "{1}.{4};";
      } 
      {
        type = "locale";
        key = "  i18n.defaultLocale";
        format = "{1};";
      } 
      {
        type = "timezone";
        key = "  time.timeZone";
        format = "{1};";
      } 
      {
        type = "bootmgr";
        key = "  boot.loader.package";
        format = "{1};";
      } 
      "break"
      {
        type = "custom";
        format = "# Circles For Circles :)";
      } 
      {
        type = "colors";
        key = "  nix.colors";
        symbol = "circle";
      } 
      {
        type = "custom";
        format = "}";
      } 
      ];
    };
  };
}
