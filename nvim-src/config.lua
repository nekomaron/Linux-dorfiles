-- 🎨 テーマの設定
vim.cmd.colorscheme("catppuccin-mocha")

-- 📋 行番号の表示、インデント、クリップボード共有
vim.opt.number = true          -- 行番号を表示
vim.opt.relativenumber = false  -- 移動しやすいように相対行番号にする
vim.opt.clipboard = "unnamedplus" -- システムとクリップボードを同期
vim.opt.tabstop = 4            -- Tab幅を4スペースに
vim.opt.shiftwidth = 4
vim.opt.expandtab = true       -- Tabをスペースに変換
vim.opt.smartindent = true     -- スマートインデント

-- ⌨️ キーバインド設定
vim.g.mapleader = " "          -- リーダーキーをスペースに
vim.keymap.set('i', 'jj', '<Esc>', { silent = true })

-- 🔎 Telescope のキーバインド
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- 🚀 プロジェクト別 LSP 自動検知・起動設定
-- グローバル環境への書き込みをせず、nix developがでパスが通ったLSPのみを起動させる.

-- 補完プラグイン(cmp)の能力を取得する関数
local function get_capabilities()
  local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
  if has_cmp then
    return cmp_lsp.default_capabilities()
  end
  return vim.lsp.protocol.make_client_capabilities()
end

-- 🐍 Python用設定 (pyright)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    -- 💡 注: LSP本体の正しいバイナリ名は pyright-langserver です
    if vim.fn.executable("pyright-langserver") == 1 then
      vim.lsp.start({
        name = "pyright",
        cmd = { "pyright-langserver", "--stdio" },
        root_dir = vim.fs.root(0, { "pyproject.toml", "setup.py", "requirements.txt", "flake.nix", ".git" }) or vim.fn.getcwd(),
        capabilities = get_capabilities(),
      })
    end
  end,
})

-- 🦀 Rust用設定 (rust-analyzer)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    if vim.fn.executable("rust-analyzer") == 1 then
      vim.lsp.start({
        name = "rust_analyzer",
        cmd = { "rust-analyzer" },
        root_dir = vim.fs.root(0, { "Cargo.toml", "flake.nix", ".git" }) or vim.fn.getcwd(),
        capabilities = get_capabilities(),
      })
    end
  end,
})

-- ✨ 自動補完メニュー (nvim-cmp) の UI設定
local cmp_status, cmp = pcall(require, "cmp")
if cmp_status then
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
    -- ⌨️ 補完操作のキーバインド
    mapping = cmp.mapping.preset.insert({
      ['<S-Tab>'] = cmp.mapping.complete(),         -- Ctrl+Space で手動で補完を出す
    }),
    -- 📡 補完データの取得元
    sources = cmp.config.sources({
      { name = 'nvim_lsp' }, -- LSPからの賢い補完をメインにする
    })
  })
end
