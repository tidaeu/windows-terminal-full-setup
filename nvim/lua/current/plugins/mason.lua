return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local settings = require "current.lsp_settings"
        print(settings)
        require("mason").setup()

        require("mason-lspconfig").setup({
            automatic_installation = true,
            ensure_installed = {"lua_ls", "jsonls", "tailwindcss","ts_ls","html","cssls","eslint"},
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettier",
                "stylua", -- lua formatter
            },
        })

        require("lspconfig").lua_ls.setup {}
    end,
}
