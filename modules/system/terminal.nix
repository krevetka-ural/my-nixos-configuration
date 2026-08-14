{ config, pkgs, ... }:
{
# Use Xkeyboard config in TTY or console
  console.useXkbConfig = true;

# Set font in TTY by 20 pixel size
  console.font = "ter-v20n";
}