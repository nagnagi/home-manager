{ pkgs, ... }: {
  home.packages = with pkgs; [
    grim
    slurp
  ];

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "monospace:size=14";
        dpi-aware = false;
        prompt = "\"❯ \"";

        lines = 12;
        width = 60;
        tabs = 4;
        horizontal-pad = 60;
        vertical-pad = 20;
        inner-pad = 20;

        image-size-ratio = 0.25;
      };
      colors = {
        background = "000000C0";
        text = "ffffffff";
        match = "7fb3d3ff";
        selection-match = "7fb3d3ff";
        selection-text = "ffffffff";
        prompt = "ffffffff";
        input = "ffffffff";
        selection = "ffffff40";
      };
    };
  };
  programs.swappy = {
    enable = true;
  };
  
  services.mako = {
    enable = true;
    settings = {
      font = "Noto Sans CJK JP 10";
      sort = "-time";
      layer = "overlay";
      background-color = "#000000C0";
      width = 400;
      height = 120;
      margin = 5;
      padding = "0,5,10";
      border-size = 2;
      border-color = "#28BEC5";
      border-radius = 15;
      icons = 1;
      max-icon-size = 64;
      default-timeout = 5000;
      ignore-timeout = 1;
    };
  };
}
