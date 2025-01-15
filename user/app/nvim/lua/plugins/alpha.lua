local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header (ASCII art)
dashboard.section.header.val = {
        "                                                      ",
        "                                                      ",
        "                                                      ",
        "                                                      ",
        "░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓███████▓▒░ ░▒▓██████▓▒░  ",
        "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ",
        "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ",
        "░▒▓███████▓▒░░▒▓████████▓▒░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░ ",
        "░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ",
        "░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ ",
        "░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░  ",
        "                                                      ",
        "          from git@github.com:cooparo",
        "                                                      ",
        "                                                      ",
        "                                                      ",
        "                                                      ",
        "                                                      ",
}

-- Set menu (keybindings)
dashboard.section.buttons.val = {
    dashboard.button("r", "󰶦  Recents", ":Telescope oldfiles<CR>"),
    dashboard.button("f", "  Explore", ":Telescope find_files<CR>"),
    dashboard.button("G", "  Ripgrep", ":Telescope live_grep<CR>"),
    dashboard.button("l", "  LazyGit", ":LazyGit<CR>"),
    dashboard.button("t", "  TODOs", ":TodoTelescope keywords=TODO,FIX<CR>"),
}

alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
