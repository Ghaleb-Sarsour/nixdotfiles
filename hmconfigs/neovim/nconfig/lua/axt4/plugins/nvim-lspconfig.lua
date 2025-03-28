-- return {
--     "neovim/nvim-lspconfig",
--     opts = {
--       -- NEW: Configure diagnostic signs to differentiate between LSP and Checkstyle
--       diagnostic_signs = {
--         { name = "DiagnosticSignError", text = "󰅚" },
--         { name = "DiagnosticSignWarn", text = "󰀦" },
--         { name = "DiagnosticSignHint", text = "󰌶" },
--         { name = "DiagnosticSignInfo", text = "" },
--       },
--     },
--     config = function()
--       -- NEW: Configure diagnostic display
--       vim.diagnostic.config({
--         virtual_text = {
--           prefix = "",
--           source = true,  -- Show source in virtual text
--         },
--         float = {
--           source = true,  -- Show source in hover
--         },
--         signs = true,
--         underline = true,
--         update_in_insert = false,
--         severity_sort = true,
--       })
--     end,
--   }
return {
    "neovim/nvim-lspconfig",
    opts = {
      -- NEW: Configure diagnostic signs to differentiate between LSP and Checkstyle
      diagnostic_signs = {
        { name = "DiagnosticSignError", text = "󰅚" },
        { name = "DiagnosticSignWarn", text = "󰀦" },
        { name = "DiagnosticSignHint", text = "󰌶" },
        { name = "DiagnosticSignInfo", text = "" },
      },
    },
    config = function()
      -- NEW: Configure diagnostic display
      vim.diagnostic.config({
        virtual_text = {
          prefix = "",
          source = true,  -- Show source in virtual text
        },
        float = {
          source = true,  -- Show source in hover
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  }
