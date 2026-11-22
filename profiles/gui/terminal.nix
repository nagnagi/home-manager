{ pkgs, ... }: {
  home.packages = with pkgs; [
    kitty
  ];

  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "Plemol JP ConsoleNF:size=14";
      };
      bell = {
        system="no";
      };
      url = {
        launch = "xdg-open $${url}";
      };
      cursor = {
        style = "block";
        blink = "yes";
        blink-rate = 500;
        beam-thickness = 1.5;
      };
    };
  };
}
