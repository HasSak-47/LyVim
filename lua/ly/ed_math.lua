local opts = {remap = false}
vim.keymap.set('n', '<leader>wOlatex', 'i$$\\begin{aligned}\n\\end{aligned}$$<esc>', opts)
vim.keymap.set('n', '<leader>wlint', 'i\\int_a^b{}{d}<esc>', opts)
vim.keymap.set('n', '<leader>wlfrac', 'i\\frac{}{}<esc>', opts)
