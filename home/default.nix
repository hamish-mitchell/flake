{inputs, ...}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.hamish = import ./home.nix;
    extraSpecialArgs = {inherit inputs;};
  };
}
