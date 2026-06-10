{ inputs, ... }:
{
  pkt.niri-keybinds = {
    imports = [ inputs.niri-nix.homeModules.default ];

    homeManager = {
      wayland.windowManager.niri.settings.binds = {
        # Focus Columns
        "Mod+Left".focus-column-left = [ ];
        "Mod+Right".focus-column-right = [ ];
        "Mod+Down".focus-window-down = [ ];
        "Mod+Up".focus-window-up = [ ];
        "Mod+Shift+Left".focus-monitor-left = [ ];
        "Mod+Shift+Right".focus-monitor-right = [ ];
        "Mod+Home".focus-column-first = [ ];
        "Mod+End".focus-column-last = [ ];

        # Move Columns
        "Mod+C".center-column = [ ];
        "Mod+Ctrl+C".center-visible-columns = [ ];
        "Mod+Ctrl+Left".move-column-left = [ ];
        "Mod+Ctrl+Right".move-column-right = [ ];
        "Mod+Ctrl+Down".move-window-down = [ ];
        "Mod+Ctrl+Up".move-window-up = [ ];
        "Mod+Shift+Ctrl+Left".move-column-to-monitor-left = [ ];
        "Mod+Shift+Ctrl+Right".move-column-to-monitor-right = [ ];
        "Mod+Ctrl+Home".move-column-to-first = [ ];
        "Mod+Ctrl+End".move-column-to-last = [ ];

        # Resize Columns
        "Mod+F".maximize-column = [ ];
        "Mod+M".maximize-window-to-edges = [ ];
        "Mod+Shift+F".fullscreen-window = [ ];
        "Mod+Ctrl+Shift+F".toggle-windowed-fullscreen = [ ];
        "Mod+Minus".set-column-width = "-10%";
        "Mod+Equal".set-column-width = "+10%";
        "Mod+Shift+Minus".set-window-height = "-10%";
        "Mod+Shift+Equal".set-window-height = "+10%";
        "Mod+R".switch-preset-column-width = [ ];
        "Mod+Shift+R".switch-preset-column-width-back = [ ];
        "Mod+Ctrl+Shift+R".switch-preset-window-height = [ ];

        # Expel/Consume Columns
        "Mod+V".toggle-window-floating = [ ];
        "Mod+Shift+V".switch-focus-between-floating-and-tiling = [ ];
        "Mod+W".toggle-column-tabbed-display = [ ];
        "Mod+BracketLeft".consume-or-expel-window-left = [ ];
        "Mod+BracketRight".consume-or-expel-window-right = [ ];
        "Mod+Comma".consume-window-into-column = [ ];
        "Mod+Period".expel-window-from-column = [ ];
      };
    };
  };
}
