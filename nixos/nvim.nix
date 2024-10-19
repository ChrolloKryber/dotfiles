{config, pkgs, ...}:

{
  programs.neovim = {
    extraPackages = with pkgs; [
      wl-clipboard
      luajitPackages.lua-lsp
      docker-compose-language-service
      dockerfile-language-server-nodejs
    ];
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;

        extraLuaConfig = ''
            ${builtins.readFile ./nvim/options.lua}
            ${builtins.readFile ./nvim/plugin/telescope.lua}
            ${builtins.readFile ./nvim/plugin/lsp.lua}
            ${builtins.readFile ./nvim/plugin/cmp.lua}
            ${builtins.readFile ./nvim/plugin/other.lua}
            ${builtins.readFile ./nvim/plugin/treesitter.lua}
        '';

        plugins = with pkgs.vimPlugins; [
            neodev-nvim
            nvim-cmp
            cmp-nvim-lsp
            luasnip
            lazy-lsp-nvim
            cmp_luasnip
            friendly-snippets
            nvim-treesitter.withAllGrammars
            nvim-lspconfig
            comment-nvim
            lualine-nvim
            catppuccin-nvim
            telescope-nvim
            telescope-fzf-native-nvim
            vim-nix
        ];
    };
}
