{ pkgs, home, ... }: {
  programs.nh = {
    enable = true;
    clean.enable = true;
  };
  programs.nix-index = {
    enable = true;
  };
  programs.nix-index-database = {
    comma.enable = true;
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  home.packages = with pkgs; [
    nix-output-monitor
    nix-tree
    nixd
    nixfmt
    statix
    deadnix
  ];
}
