{
  self,
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    "${self}/modules/home"
    ./hardware-configuration.nix
    inputs.niri.nixosModules.niri
  ];

  services.gnome.gnome-keyring.enable = true;

  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Networking
  networking = {
    hostName = "archie";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [80 443 8080 9999];
    useDHCP = false;
    interfaces.enp42s0 = {
      ipv4.addresses = [
        {
          address = "192.168.68.222";
          prefixLength = 24;
        }
      ];
    };

    defaultGateway = "192.168.68.1";
    nameservers = ["1.1.1.1" "8.8.8.8"];
  };

  # Locale
  time.timeZone = "Australia/Melbourne";
  i18n.defaultLocale = "en_AU.UTF-8";

  # Nvidia
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  hardware.graphics.enable = true;

  # Niri
  nixpkgs.overlays = [inputs.niri.overlays.niri];
  niri-flake.cache.enable = true;
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  # greetd + tuigreet
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri";
        user = "greeter";
      };
    };
  };

  # Audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # User
  users.users.hamish = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "video"];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
  ];

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-color-emoji
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = ["Noto Sans"];
      };
    };
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  # Nix settings
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05";
}
