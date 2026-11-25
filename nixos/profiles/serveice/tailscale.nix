{ pkgs, ... }: {
  services.tailscale = {
    enable = true;
    port = 41641;
    derper.port = 8010;
    openFirewall = false;
  };
}
