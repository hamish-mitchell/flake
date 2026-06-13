{pkgs, ...}: {
  imports = [
    ./niri.nix
  ];

  home.username = "hamish";
  home.homeDirectory = "/home/hamish";

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
        size = 13.0;
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

  # Fuzzel
  programs.fuzzel = {
    enable = true;
  };

  home.stateVersion = "26.05";
}
