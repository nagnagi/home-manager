{ pkgs, ... }:
let
  zshrcCompiled = pkgs.runCommand "zshrc-main" {
    natveBuildInputs = [ pkgs.zsh ];
  } ''
    cat ${./home/zsh/zshrc.zsh} > zshrc.zsh
    ${pkgs.zsh}/bin/zsh -f -c 'zcompile zshrc.zsh'
    install -Dm644 zshrc.zsh     $out/zshrc.zsh
    install -Dm444 zshrc.zsh.zwc $out/zshrc.zsh.zwc
  '';
in
{
  programs.zsh = {
    enable = false;
    enableCompletion = false;
    initContent = builtins.readFile ./zshrc.zsh;
  };
}
