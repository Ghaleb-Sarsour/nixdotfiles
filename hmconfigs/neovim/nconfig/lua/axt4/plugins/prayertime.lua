return {
   "awesomegeek/prayertime.nvim",
   dependencies = { "nvim-lua/plenary.nvim" },
   opts = {
      city = "Roswell",
      coords = { "34.07012799864088", "-84.35726575889723" },
      method = 3, -- MWL
   },
    keys = {
      { "<leader>pt", "<cmd>SalatPopup<cr>", desc = "Show Prayer Time Popup" }
   },
}
