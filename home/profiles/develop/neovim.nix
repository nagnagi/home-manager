{ pkgs, lib, config, ... }: {
  home.packages = with pkgs; [
    tree-sitter
    deno
    typos-lsp
  ];

  programs.neovim = {
    enable = true;
    sideloadInitLua = true;
  };
  xdg.configFile."nvim/init.lua".enable = false;
  home.activation.cloneNvimConfig =
    lib.hm.dag.entryAfter ["linkGeneration" ] ''
      NVIM_DIR="${config.xdg.configHome}/nvim"
      REPO_URL="https://github.com/nagnagi/nvim.git"

      if [ ! -d "$NVIM_DIR" ]; then
        $DRY_RUN_CMD ${pkgs.git}/bin/git \
          -c core.sshCommand="${pkgs.openssh}/bin/ssh -o StrictHostKeyChecking=accept-new" \
          clone "$REPO_URL" "$NVIM_DIR"
      fi
    '';
}
