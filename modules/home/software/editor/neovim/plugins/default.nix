{
  imports = [
    ./cmp.nix
    ./lsp.nix
  ];

  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      settings.indent.enable = true;
    };
    treesitter-context = {
      enable = true;
      settings = {max_lines = 2;};
    };
    rainbow-delimiters.enable = true;
    autoclose = {
      enable = true;
    };
    chadtree = {
      enable = true;
    };
    chatgpt = {
      enable = true;
    };
    codesnap = {
      enable = true;
    };
    comment = {
      enable = true;
    };
    comment-box = {
      enable = true;
    };
    crates-nvim = {
      enable = true;
    };
  };
}
