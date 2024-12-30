return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    autokill = false,
    browser = "default",
    commands = {
      start = "LivePreview",
      stop = "StopPreview"
    },
    dynamic_root = false,
    port = 5500,
    sync_scroll = false,
    telescope = {
      autoload = false
    }
}
