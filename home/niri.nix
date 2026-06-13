{
  config,
  lib,
  ...
}: {
  programs.niri.settings = {
    animations.enable = true;

    "Mod+Q".action.quit = [];
    "Mod+Return".action.spawn = lib.getExe config.programs.alacritty.package;
    "Mod+P".action.spawn = lib.getExe config.programs.fuzzel.package;

    "Mod+N".action.focus-column-or-monitor-left = [];
    "Mod+E".action.focus-window-or-workspace-down = [];
    "Mod+I".action.focus-window-or-workspace-up = [];
    "Mod+O".action.focus-column-or-monitor-right = [];
  };
}
