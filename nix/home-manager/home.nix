{ config, pkgs, ... }:

{
  home.username = "kyosuke";
  home.homeDirectory = "/home/kyosuke";
  
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    fzf
  ];

 programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      nvim-treesitter.withAllGrammars
      telescope-nvim
      plenary-nvim

      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
    ];

    extraPackages = with pkgs; [
      ripgrep
      fd
      wl-clipboard
    ];

    # 💡 最新の仕様に合わせて「initLua」に戻し、読み込み先を「config.lua」に変更！
    initLua = ''
      local physical_config = vim.fn.expand("$HOME/.dotfiles/nvim-src/config.lua")
      if vim.fn.filereadable(physical_config) == 1 then
        vim.cmd("source " .. physical_config)
      end
    '';
  }; 

  programs.home-manager.enable = true;
}
