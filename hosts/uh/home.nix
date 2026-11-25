{ pkgs, ... }: {
  home.stateVersion = "26.05";

  imports = [
    ../../home/profiles/fonts.nix
    ../../home/profiles/gui
    ../../home/profiles/window-manager/sway.nix
    ../../home/profiles/zsh/zsh.nix
    ../../home/profiles/input-method.nix
  ];

  wayland.windowManager.sway.config = {
    output = {
      eDP-1 = {
        mode = "1920x1080@600.0Hz";
        scale = "1.0";
        bg = "${pkgs.sway}/share/backgrounds/sway/Sway_Wallpaper_Blue_2048x1536.png fill";
      };
    };
  };

  programs.emacs.package = pkgs.emacs-pgtk;
}
