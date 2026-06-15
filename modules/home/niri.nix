{
  config,
  lib,
  ...
}: {
  programs.niri.settings = {
    animations.enable = true;

    prefer-no-csd = true;

    window-rules = [
      {
        geometry-corner-radius = let
          radius = 8.0;
        in {
          bottom-left = radius;
          bottom-right = radius;
          top-left = radius;
          top-right = radius;
        };
        clip-to-geometry = true;
      }
    ];

    cursor.theme = "breeze_cursors";

    input.mouse = {
      accel-speed = -0.1;
      accel-profile = "flat";
    };

    binds = with config.lib.niri.actions; {
      "Mod+Q" = {
        repeat = false;
        action = close-window;
      };
      "Mod+Return".action = spawn (lib.getExe config.programs.alacritty.package);
      "Mod+P".action = spawn (lib.getExe config.programs.fuzzel.package);

      "Mod+F".action = maximize-column;
      "Mod+Left".action = focus-column-left;
      "Mod+Down".action = focus-window-down;
      "Mod+Up".action = focus-window-up;
      "Mod+Right".action = focus-column-right;
      "Mod+H".action = focus-column-left;
      "Mod+J".action = focus-window-down;
      "Mod+K".action = focus-window-up;
      "Mod+L".action = focus-column-right;
    };

    outputs = {
      "DP-2" = {
        mode = {
          width = 1920;
          height = 1080;
        };
        position = {
          x = 0;
          y = 0;
        };
        scale = 1.0;
      };
      "DP-1" = {
        mode = {
          width = 2560;
          height = 1440;
        };
        position = {
          x = 1920;
          y = 0;
        };
        scale = 1.0;
      };
    };
  };
}
