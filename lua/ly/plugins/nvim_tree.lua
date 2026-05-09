return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,                      -- neo-tree will lazily load itself
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
        use_libuv_file_watcher = true,
        window = {
            position = "right",
            width = 30,
        },
        log_level = "error",
        enable_git_status = true,
        default_component_configs = {
            git_status = {
                symbols = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                }
            },
        },
        filesystem = {
            hijack_netrw_behavior = "open_default",
            filtered_items = {
                hide_dotfiles = false,
            },
            window = {
                mappings = {
                    ["I"] = "toggle_hidden",
                }
            }
        },
    }
}

-- local M = {
--     'nvim-tree/nvim-tree.lua',
--     dependencies = {
--         "nvim-tree/nvim-web-devicons",
--     },
--     enabled = true,
--     config = function()
--         vim.g.loaded_netrw = 1
--         vim.g.loaded_netrwPlugin = 1
--
--         require('nvim-tree').setup({
--             view = {
--                 width = 30,
--                 side = "right",
--             },
--             sort_by = "extension",
--             respect_buf_cwd = true,
--             sync_root_with_cwd = true,
--         })
--     end
-- }

-- return M
--
--
-- ["<space>"] = "toggle_node",
-- ["<2-LeftMouse>"] = "open",
-- ["<cr>"] = "open",
-- ["<esc>"] = "cancel",
-- ["P"] = "toggle_preview",
-- ["l"] = "focus_preview",
-- ["S"] = "open_split",
-- ["s"] = "open_vsplit",
-- ["t"] = "open_tabnew",
-- ["w"] = "open_with_window_picker",
-- ["C"] = "close_node",
-- ["z"] = "close_all_nodes",
-- ["a"] =  "add",,
-- ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
-- ["d"] = "delete",
-- ["r"] = "rename",
-- ["b"] = "rename_basename",
-- ["y"] = "copy_to_clipboard",
-- ["x"] = "cut_to_clipboard",
-- ["p"] = "paste_from_clipboard",
-- ["<C-r>"] = "clear_clipboard",
-- ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
-- ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
-- ["q"] = "close_window",
-- ["R"] = "refresh",
-- ["?"] = "show_help",
-- ["<"] = "prev_source",
-- [">"] = "next_source",
-- ["i"] = "show_file_details",
--

-- `<C-]>`           n    CD                         |nvim_tree.api.tree.change_root_to_node()|
-- `<C-e>`           n    Open: In Place             |nvim_tree.api.node.open.replace_tree_buffer()|
-- `<C-k>`           n    Info                       |nvim_tree.api.node.show_info_popup()|
-- `<C-r>`           n    Rename: Omit Filename      |nvim_tree.api.fs.rename_sub()|
-- `<C-t>`           n    Open: New Tab              |nvim_tree.api.node.open.tab()|
-- `<C-v>`           n    Open: Vertical Split       |nvim_tree.api.node.open.vertical()|
-- `<C-x>`           n    Open: Horizontal Split     |nvim_tree.api.node.open.horizontal()|
-- `<BS>`            n    Close Directory            |nvim_tree.api.node.navigate.parent_close()|
-- `<CR>`            n    Open                       |nvim_tree.api.node.open.edit()|
-- `<Del>`           nx   Delete                     |nvim_tree.api.fs.remove()|
-- `<Tab>`           n    Open Preview               |nvim_tree.api.node.open.preview()|
-- `>`               n    Next Sibling               |nvim_tree.api.node.navigate.sibling.next()|
-- `<`               n    Previous Sibling           |nvim_tree.api.node.navigate.sibling.prev()|
-- `.`               n    Run Command                |nvim_tree.api.node.run.cmd()|
-- `-`               n    Up                         |nvim_tree.api.tree.change_root_to_parent()|
-- `a`               n    Create File Or Directory   |nvim_tree.api.fs.create()|
-- `bd`              n    Delete Bookmarked          |nvim_tree.api.marks.bulk.delete()|
-- `bt`              n    Trash Bookmarked           |nvim_tree.api.marks.bulk.trash()|
-- `bmv`             n    Move Bookmarked            |nvim_tree.api.marks.bulk.move()|
-- `B`               n    Toggle Filter: No Buffer   |nvim_tree.api.filter.no_buffer.toggle()|
-- `c`               nx   Copy                       |nvim_tree.api.fs.copy.node()|
-- `C`               n    Toggle Filter: Git Clean   |nvim_tree.api.filter.git.clean.toggle()|
-- `[c`              n    Prev Git                   |nvim_tree.api.node.navigate.git.prev()|
-- `]c`              n    Next Git                   |nvim_tree.api.node.navigate.git.next()|
-- `d`               nx   Delete                     |nvim_tree.api.fs.remove()|
-- `D`               nx   Trash                      |nvim_tree.api.fs.trash()|
-- `E`               n    Expand All                 |nvim_tree.api.tree.expand_all()|
-- `e`               n    Rename: Basename           |nvim_tree.api.fs.rename_basename()|
-- `]e`              n    Next Diagnostic            |nvim_tree.api.node.navigate.diagnostics.next()|
-- `[e`              n    Prev Diagnostic            |nvim_tree.api.node.navigate.diagnostics.prev()|
-- `F`               n    Live Filter: Clear         |nvim_tree.api.filter.live.clear()|
-- `f`               n    Live Filter: Start         |nvim_tree.api.filter.live.start()|
-- `g?`              n    Help                       |nvim_tree.api.tree.toggle_help()|
-- `gy`              n    Copy Absolute Path         |nvim_tree.api.fs.copy.absolute_path()|
-- `ge`              n    Copy Basename              |nvim_tree.api.fs.copy.basename()|
-- `H`               n    Toggle Filter: Dotfiles    |nvim_tree.api.filter.dotfiles.toggle()|
-- `I`               n    Toggle Filter: Git Ignored |nvim_tree.api.filter.git.ignored.toggle()|
-- `J`               n    Last Sibling               |nvim_tree.api.node.navigate.sibling.last()|
-- `K`               n    First Sibling              |nvim_tree.api.node.navigate.sibling.first()|
-- `L`               n    Toggle Group Empty         |nvim_tree.api.node.open.toggle_group_empty()|
-- `M`               n    Toggle Filter: No Bookmark |nvim_tree.api.filter.no_bookmark.toggle()|
-- `m`               nx   Toggle Bookmark            |nvim_tree.api.marks.toggle()|
-- `o`               n    Open                       |nvim_tree.api.node.open.edit()|
-- `O`               n    Open: No Window Picker     |nvim_tree.api.node.open.no_window_picker()|
-- `p`               n    Paste                      |nvim_tree.api.fs.paste()|
-- `P`               n    Parent Directory           |nvim_tree.api.node.navigate.parent()|
-- `q`               n    Close                      |nvim_tree.api.tree.close()|
-- `r`               n    Rename                     |nvim_tree.api.fs.rename()|
-- `R`               n    Refresh                    |nvim_tree.api.tree.reload()|
-- `s`               n    Run System                 |nvim_tree.api.node.run.system()|
-- `S`               n    Search                     |nvim_tree.api.tree.search_node()|
-- `u`               n    Rename: Full Path          |nvim_tree.api.fs.rename_full()|
-- `U`               n    Toggle Filter: Custom      |nvim_tree.api.filter.custom.toggle()|
-- `W`               n    Collapse All               |nvim_tree.api.tree.collapse_all()|
-- `x`               nx   Cut                        |nvim_tree.api.fs.cut()|
-- `y`               n    Copy Name                  |nvim_tree.api.fs.copy.filename()|
-- `Y`               n    Copy Relative Path         |nvim_tree.api.fs.copy.relative_path()|
-- `<2-LeftMouse>`   n    Open                       |nvim_tree.api.node.open.edit()|
-- `<2-RightMouse>`  n    CD                         |nvim_tree.api.tree.change_root_to_node()|
