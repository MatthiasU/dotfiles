require('telescope').setup{
  defaults = {
    path_display={"smart"}
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
    git_files = {
      theme = "ivy",
    },
    buffers = {
      theme = "ivy",
    }
  },
}

