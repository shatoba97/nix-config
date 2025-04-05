{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      nixd
      vimPlugins.nvim-treesitter-parsers.hyprlang
    ];
  };
}
