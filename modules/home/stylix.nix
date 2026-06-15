{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.stylix.homeModules.stylix
  ];
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    polarity = "dark";
    fonts = {
      monospace = {
        package = pkgs.maple-mono.Normal-NF;
        name = "Maple Mono NF";
      };
    };
    targets.zen-browser.enable = false;
  };
}
