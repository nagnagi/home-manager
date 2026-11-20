{ pkgs, ... }: {
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

        image-size-ratio = .25;
      };
      colors = {
        background="000000C0";
        text="ffffffff";
        match="7fb3d3ff";
        selection-match="7fb3d3ff";
        selection-text="ffffffff";
        prompt="ffffffff";
        input="ffffffff";
        selection="ffffff40";
      };
    };
  };
}
