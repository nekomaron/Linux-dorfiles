{ config, pkgs, ... }:

{
  home.username = "kyosuke";
  home.homeDirectory = "/home/kyosuke";
  
  home.stateVersion = "26.05";

  imports = [
   ./nvim
  ];

  home.packages = with pkgs; [
    fzf
  ];

  programs.fzf = {
      enable = true;
      enableBashIntegration = true;
  };

  programs.zsh = {
      enable = true;
      initContent = ''
        PS1='%m %1~ %# '
      '';
  };

  programs.home-manager.enable = true;
}
