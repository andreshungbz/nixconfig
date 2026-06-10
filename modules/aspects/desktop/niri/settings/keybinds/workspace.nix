{ inputs, ... }:
{
  pkt.niri-keybinds = {
    imports = [ inputs.niri-nix.homeModules.default ];

    homeManager = {
      wayland.windowManager.niri.settings.binds = {
        # Workspace Navigation & Column Movements
        "Mod+Page_Down".focus-workspace-down = [ ];
        "Mod+Page_Up".focus-workspace-up = [ ];
        "Mod+Shift+Page_Down".move-workspace-down = [ ];
        "Mod+Shift+Page_Up".move-workspace-up = [ ];
        "Mod+Ctrl+Page_Down".move-column-to-workspace-down = [ ];
        "Mod+Ctrl+Page_Up".move-column-to-workspace-up = [ ];

        # Workspace Number Navigation & Column Movements
        "Mod+1".focus-workspace = 1;
        "Mod+2".focus-workspace = 2;
        "Mod+3".focus-workspace = 3;
        "Mod+4".focus-workspace = 4;
        "Mod+5".focus-workspace = 5;
        "Mod+6".focus-workspace = 6;
        "Mod+7".focus-workspace = 7;
        "Mod+8".focus-workspace = 8;
        "Mod+9".focus-workspace = 9;
        "Mod+Ctrl+1".move-column-to-workspace = 1;
        "Mod+Ctrl+2".move-column-to-workspace = 2;
        "Mod+Ctrl+3".move-column-to-workspace = 3;
        "Mod+Ctrl+4".move-column-to-workspace = 4;
        "Mod+Ctrl+5".move-column-to-workspace = 5;
        "Mod+Ctrl+6".move-column-to-workspace = 6;
        "Mod+Ctrl+7".move-column-to-workspace = 7;
        "Mod+Ctrl+8".move-column-to-workspace = 8;
        "Mod+Ctrl+9".move-column-to-workspace = 9;

        # Column Mouse Scroll Right
        "Mod+WheelScrollDown" = {
          _props.cooldown-ms = 150;
          focus-column-right = [ ];
        };

        # Column Mouse Scroll Left
        "Mod+WheelScrollUp" = {
          _props.cooldown-ms = 150;
          focus-column-left = [ ];
        };

        # Workspace Mouse Scroll Down
        "Mod+Ctrl+WheelScrollDown" = {
          _props.cooldown-ms = 150;
          focus-workspace-down = [ ];
        };

        # Workspace Mouse Scroll Up
        "Mod+Ctrl+WheelScrollUp" = {
          _props.cooldown-ms = 150;
          focus-workspace-up = [ ];
        };
      };
    };
  };
}
