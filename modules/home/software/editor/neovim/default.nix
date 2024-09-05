{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: let
  cfg = config.software.editor.neovim;
in {
  options.software.editor.neovim = {
    enable = lib.mkEnableOption "Neovim Editor";
  };

  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./plugins
  ];

  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      enable = true;

      globals = {
        mapleader = " ";
        maplocalleader = " ";
      };

      performance = {
        /*
           combinePlugins = {
          enable = true;
          standalonePlugins = [
            "hmts.nvim"
            "nvim-treesitter"
          ];
        };
        byteCompileLua.enable = true;
        */
      };

      viAlias = true;
      vimAlias = true;

      luaLoader.enable = true;
    };

    home.packages = with pkgs; [
      ripgrep
    ];
  };
}
