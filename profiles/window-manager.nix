{ pkgs, lib, config, ... }: {
  wayland.windowManager.sway = let
      modifier = "Mod4";
      terminal = "footclient";
      menu = "fuzzel";
      left = "h";
      down = "j";
      up = "k";
      right = "l";
  in {
    enable = true;

    config = {
      inherit
        modifier
        terminal
        menu
        left
        down
        up
        right
        ;

      startup = [
        { command = "mako"; }
        { command = "fcitx5"; }
        {
          command = let
            binDir = "${pkgs.waybar}/bin";
            cfgDir = "${pkgs.waybar}/etc/xdg/waybar";
          in
            "${binDir}/waybar -c ${cfgDir}/config.jsonc -s ${cfgDir}/style.css";
        }
        { command = "foot -s"; }
      ];

      input = {
        "type:touchpad" = {
          dwt = "enabled";
          tap = "enabled";
          natural_scroll = "enabled";
          middle_emulation = "enabled";
        };
        "type:keyboard" = {
          xkb_layout = "jp";
          xkb_options = "ctrl:nocaps";
          repeat_rate = "12";
          repeat_delay = "200";
        };
      };

      defaultWorkspace = "workspace number 1";

      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
        terminal = config.wayland.windowManager.sway.config.terminal;
        menu = config.wayland.windowManager.sway.config.menu;
        left = config.wayland.windowManager.sway.config.left;
        right = config.wayland.windowManager.sway.config.right;
        up = config.wayland.windowManager.sway.config.up;
        down = config.wayland.windowManager.sway.config.down;
      in lib.mkOptionDefault {
        "${modifier}+t" = "exec ${terminal}";
        "${modifier}+space" = "exec ${menu}";

        "${modifier}+q" = "kill";
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";

        "${modifier}+${left}" = "focus left";
        "${modifier}+${down}" = "focus down";
        "${modifier}+${up}" = "focus up";
        "${modifier}+${right}" = "focus right";
        "${modifier}+Shift+${left}" = "move left";
        "${modifier}+Shift+${down}" = "move down";
        "${modifier}+Shift+${up}" = "move up";
        "${modifier}+Shift+${right}" = "move right";

        # "${modifier}+n" = "move scratchpad" ;
        # "${modifier}+Shift+n" = "move scratchpad" ;

        "${modifier}+i" = "workspace next";
        "${modifier}+o" = "workspace next";
        "${modifier}+Shift+i" = "move container to workspace next";
        "${modifier}+Shift+o" = "move container to workspace prev";

        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";
        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";

        "${modifier}+v" = "splith";
        "${modifier}+s" = "splitv";
        "${modifier}+d" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";

        "${modifier}+f" = "fullscreen";
        "${modifier}+m" = "focus mode_toggle";
        "${modifier}+a" = "focus parent";

        "${modifier}+Shift+T" = "floating toggle";
      };

      gaps.outer = 10;
      gaps.inner = 5;

      bars = [ ];

      floating = {
        inherit modifier;
      };
    };
  };
}
