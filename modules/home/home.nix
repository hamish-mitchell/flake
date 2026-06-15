{pkgs, ...}: {
  imports = [
    ./alacritty.nix
    ./stylix.nix
    ./niri.nix
    ./zen-browser.nix
    ./zsh.nix
  ];

  home = {
    username = "hamish";
    homeDirectory = "/home/hamish";

    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      name = "breeze_cursors";
      package = pkgs.kdePackages.breeze;
      size = 24;
    };

    packages = with pkgs; [
      alacritty
      kdePackages.ark
      kdePackages.dolphin
      maple-mono.Normal-NF
      proton-vpn
      qbittorrent
      zed-editor
    ];
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  # Fonts
  fonts.fontconfig.enable = true;

  programs = {
    distrobox.enable = true;
    fuzzel.enable = true;
    gh.enable = true;
    helix.enable = true;
    vscode.enable = true;
    waybar.enable = true;
  };

  home.stateVersion = "26.05";
}
