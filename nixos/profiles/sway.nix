{ pkgs, ... }: {
  programs.sway = {
    enable = true;
    xwayland.enable = true;
  };
  services.greetd.settings.default_session = {
    user = "greeter";
    command = "${pkgs.greetd}/bin/agreety --cmd sway";
  };

}
