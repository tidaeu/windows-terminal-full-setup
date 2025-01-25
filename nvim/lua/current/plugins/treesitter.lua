return {
  {
    "nvim-treesitter/nvim-treesitter",  
     build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = {"lua", "vim", "vimdoc", "typescript", "javascript", "html", "css", "c_sharp", "powershell", "json" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  }
}
