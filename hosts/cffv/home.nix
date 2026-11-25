{ pkgs, ... }: {
  home.username = "nag";
  home.homeDirectory = "/home/nag";
  home.stateVersion = "26.05";

  imports = [
    ../../home/profiles/genericLinux.nix
    ../../home/profiles/zsh/zsh.nix
    ../../home/profiles/neovim.nix
    ../../home/profiles/fonts.nix
    ../../home/profiles/gui
    ../../home/profiles/window-manager/sway.nix
  ];

  wayland.windowManager.sway.config = {
    output = {
      eDP-1 = {
        mode = "2160x1440@600.0Hz";
        scale = "1.25";
        bg = "${pkgs.sway}/share/backgrounds/sway/Sway_Wallpaper_Blue_2048x1536.png fill";
      };
    };
  };

  programs.emacs.package = pkgs.emacs-pgtk;
}
