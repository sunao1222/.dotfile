{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    keymaps = [
      {
        action = "<esc>";
        key = "jk";
        mode = [ "i" ];
        options = {
          silent = true;
          noremap = true;
        };
      }
      {
        action = "<Cmd>confirm quit<CR>";
        key = "<Leader>q";
        mode = [ "n" ];
        options= {
          silent = true;
          noremap = true;
        };
      }
      {
        action = "<Cmd>update<CR>";
        key = "<Leader>w";
        mode = [ "n" ];
        options = {
          silent = true;
          noremap = true;
        };
      }
    ];
  };
}
