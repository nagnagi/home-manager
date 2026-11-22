{ pkgs, lib, config, ... }: {
  home.packages = with pkgs; [
    hostname
    zoxide
    rclone
    wget
    zip
    nixd
    openssh
  ];

  programs.btop = {
    enable = true;
  };
  programs.eza = {
    enable = true;
  };
  programs.fzf = {
    enable = true;
  };
  programs.lazydocker = {
    enable = true;
  };
  programs.lazygit = {
    enable = true;
  };
  programs.nnn = {
    enable = true;
  };
  programs.vim = {
    enable = true;
  };
  programs.fd = {
    enable = true;
  };
  programs.ripgrep = {
    enable = true;
  };
  programs.tmux = {
    enable = true;
  };
  programs.gh = {
    enable = true;
  };
  programs.uv = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    sideloadInitLua = true;
  };
  xdg.configFile."nvim/init.lua".enable = false;
  home.activation.cloneNvimConfig =
    lib.hm.dag.entryAfter ["linkGeneration" ] ''
      NVIM_DIR="${config.xdg.configHome}/nvim"
      REPO_URL="git@github.com:nagnagi/nvim.git"

      if [ ! -d "$NVIM_DIR" ]; then
        $DRY_RUN_CMD ${pkgs.git}/bin/git \
          -c core.sshCommand="${pkgs.openssh}/bin/ssh -o StrictHostKeyChecking=accept-new" \
          clone "$REPO_URL" "$NVIM_DIR"
      fi
    '';

  services.pueue = {
    enable = true;
  };
}
