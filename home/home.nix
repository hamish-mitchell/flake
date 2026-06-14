{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./niri.nix
    inputs.zen-browser.homeModules.default
  ];

  home.username = "hamish";
  home.homeDirectory = "/home/hamish";

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "breeze_cursors";
    package = pkgs.kdePackages.breeze;
    size = 24;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct"; # Or "gnome"
  };

  # Packages
  home.packages = with pkgs; [
    alacritty
    maple-mono.NF
  ];

  # Fonts
  fonts.fontconfig.enable = true;

  # Zsh
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

  # Alacritty
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "Maple Mono NF";
        size = 12.0;
      };

      window = {
        padding = {
          x = 12;
          y = 12;
        };
      };
    };
  };

  # Helix
  programs.helix = {
    enable = true;
    settings = {
      theme = "...";
    };
  };

  # GitHub CLI
  programs.gh = {
    enable = true;
  };

  # VS Code
  programs.vscode = {
    enable = true;
  };

  # Firefox
  programs.firefox = {
    enable = true;
  };

  programs.zen-browser = {
    enable = true;
  };

  # Fuzzel
  programs.fuzzel = {
    enable = true;
  };

  home.stateVersion = "26.05";
}
