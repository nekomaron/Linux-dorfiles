{ pkgs, ... }:
{
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

    # 🌐 全プロジェクト共通で確定インストールしたいもの
    extraPackages = with pkgs; [
      ripgrep
      fd
      nixd          
      marksman     

      #Arch-Wayland限定
      wl-clipboard
    ];

    initLua = ''
      ${builtins.readFile ./lua/options.lua}
      ${builtins.readFile ./lua/keymaps.lua}
      ${builtins.readFile ./lua/telescope.lua}
      ${builtins.readFile ./lua/cmp.lua}
      ${builtins.readFile ./lua/lsp.lua}
    '';
  };
}
