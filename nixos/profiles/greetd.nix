{ pkgs, ... }: {
  services.greetd = {
    enable = true;
    settings = {
      terminal = {
        vt = 1;
      };
    };
  };
}
