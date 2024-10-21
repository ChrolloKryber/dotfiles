{config, pkgs, ...}:

{
  programs.neovim = {
    extraPackages = with pkgs; [
      wl-clipboard
      luajitPackages.lua-lsp
      docker-compose-language-service
      dockerfile-language-server-nodejs
      nil
      python312Packages.python-lsp-server
      gopls
      docker-compose-language-service
      terraform-lsp
    ];
    
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;


    extraLuaConfig = ''
      ${builtins.readFile ./nvim/options.lua}
      ${builtins.readFile ./nvim/plugin/neodev.lua}
      ${builtins.readFile ./nvim/plugin/neotree.lua}
      ${builtins.readFile ./nvim/plugin/lsp.lua}
      ${builtins.readFile ./nvim/plugin/cmp.lua}
      ${builtins.readFile ./nvim/plugin/other.lua}
      ${builtins.readFile ./nvim/plugin/treesitter.lua}
      ${builtins.readFile ./nvim/plugin/colorizer.lua}
      ${builtins.readFile ./nvim/plugin/telescope.lua}
      ${builtins.readFile ./nvim/plugin/whichkey.lua}
    '';

    plugins = with pkgs.vimPlugins; [
      neo-tree-nvim
      neodev-nvim
      nvim-colorizer-lua
      nvim-cmp
      cmp-nvim-lsp
      cmp-path
      luasnip
      lazy-lsp-nvim
      cmp_luasnip
      friendly-snippets
      nvim-treesitter.withAllGrammars
      nvim-lspconfig
      comment-nvim
      lualine-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      vim-nix
      which-key-nvim
    ];
  };
}
