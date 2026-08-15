{ pkgs, config, ... }:
{
  programs.alacritty = {
    enable = true;

  # Alacritty terminal settings
    settings = {
    # Change window tittle
      window = {
        title = "This is Hahacritty";
        opacity = 0.85;
      };
    # Custom cursor interaction
      cursor = {
        style = {
          shape = "Beam";
          blinking = "On";
        };
        blink_interval = 150;
        blink_timeout = 0;
      };
    # Set fonts JetBrains Mono NF
      font = {
        size = 12;
      # Regular Font
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
      # Bold Font
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
      # Italic Font
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
      # Bold Italic Font
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold Italic";
        };
      };
    # Change terminal schema Kribiska
      colos = {
      # Backgound colors
        primary = {
          background = "#31283d";
          foreground = "#f4f1ea";
        };
      # Cursor colors
        cursor = {
          cursor = "#f4f1ea";
          text = "#766f7f";
        };
      # Select color
        selection = {
          background = "#f4f1ea";
          text = "#31283d";
        };
      # Normal color schema
        normal = {
          black = "#31283d";
          red = "#c7514d";
          green = "#009463";
          yellow = "#ffc84b";
          blue = "#007491";
          magenta = "#a35994";
          cyan = "#766f7f";
          white = "#f4f1ea";
        };
      };
    };
  };
}
