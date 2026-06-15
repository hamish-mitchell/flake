{inputs, pkgs, ...}: {
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

  # Packages
  home.packages = with pkgs; [
    alacritty
    maple-mono.Normal-NF
    kdePackages.dolphin
    kdePackages.ark
    qbittorrent
    proton-vpn
    zed-editor
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
      window.padding = { x = 12; y = 12; };
    };
  };

  # Helix
  programs.helix = {
    enable = true;
  };

  # GitHub CLI
  programs.gh = {
    enable = true;
  };

  # VS Code
  programs.vscode = {
    enable = true;
  };

  programs.zen-browser = {
    enable = true;
  };

  stylix.targets.zen-browser.enable = false;

  # Fuzzel
  programs.fuzzel = {
    enable = true;
  };

  programs.waybar = {
    enable = true;
  };

  programs.distrobox = {
    enable = true;
  };

  home.stateVersion = "26.05";
}
