{ pkgs, ... }: {
  programs.home-manager = {
    enable = true;
  };
  programs.git = {
    enable = true;
    lfs = {
      enable = true;
    };
    settings.user = {
      name = "nagnagi";
      email = "nag.nagipon@gmail.com";
    };
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
