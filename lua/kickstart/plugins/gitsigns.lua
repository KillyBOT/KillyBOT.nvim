-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      -- on_attach = function(bufnr)
      --   local gitsigns = require 'gitsigns'
      --
      --   local function map(mode, l, r, opts)
      --     opts = opts or {}
      --     opts.buffer = bufnr
      --     vim.keymap.set(mode, l, r, opts)
      --   end
      --
      --   -- Navigation
      --   map('n', ']c', function()
      --     if vim.wo.diff then
      --       vim.cmd.normal { ']c', bang = true }
      --     else
      --       gitsigns.nav_hunk 'next'
      --     end
      --   end, { desc = 'Jump to next git [c]hange' })
      --
      --   map('n', '[c', function()
      --     if vim.wo.diff then
      --       vim.cmd.normal { '[c', bang = true }
      --     else
      --       gitsigns.nav_hunk 'prev'
      --     end
      --   end, { desc = 'Jump to previous git [c]hange' })
      --
      --   -- Actions
      --   -- visual mode
      --   map('v', '<leader>ghs', function()
      --     gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      --   end, { desc = '[s]tage' })
      --   map('v', '<leader>ghr', function()
      --     gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      --   end, { desc = '[r]eset' })
      --   -- normal mode
      --   map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = '[s]tage' })
      --   map('n', '<leader>ghr', gitsigns.reset_hunk, { desc = '[r]eset' })
      --   map('n', '<leader>ghS', gitsigns.stage_buffer, { desc = '[S]tage buffer' })
      --   map('n', '<leader>ghu', gitsigns.stage_hunk, { desc = '[u]ndo stage' })
      --   map('n', '<leader>ghR', gitsigns.reset_buffer, { desc = '[R]eset buffer' })
      --   map('n', '<leader>ghp', gitsigns.preview_hunk, { desc = '[p]review' })
      --   map('n', '<leader>ghb', gitsigns.blame_line, { desc = '[b]lame line' })
      --   map('n', '<leader>gd', gitsigns.diffthis, { desc = '[d]iff' })
      --   map('n', '<leader>gD', function()
      --     gitsigns.diffthis '@'
      --   end, { desc = '[G]it [D]iff against last commit' })
      --   -- Toggles
      --   map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Git [b]lame line' })
      --   map('n', '<leader>tD', gitsigns.preview_hunk_inline, { desc = 'Git [D]eleted' })
      -- end,
      on_attach = function(buffer)
        local gitsigns = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end
        -- stylua: ignore start
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, "Next [h]unk")
        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, "Prev [h]unk")
        map("n", "]H", function() gitsigns.nav_hunk("last") end, "Last [H]unk")
        map("n", "[H", function() gitsigns.nav_hunk("first") end, "First [H]unk")

        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "[s]tage")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "[r]eset")
        map("n", "<leader>ghS", gitsigns.stage_buffer, "Stage [B]uffer")
        map("n", "<leader>ghu", gitsigns.undo_stage_hunk, "[u]ndo")
        map("n", "<leader>ghR", gitsigns.reset_buffer, "[R]eset buffer")
        map("n", "<leader>ghp", gitsigns.preview_hunk_inline, "[p]review inline")
        map("n", "<leader>ghb", function() gitsigns.blame_line({ full = true }) end, "[b]lame line")
        map("n", "<leader>ghB", function() gitsigns.blame() end, "[B]lame buffer")
        map("n", "<leader>ghd", gitsigns.diffthis, "[d]iffthis")
        map("n", "<leader>ghD", function() gitsigns.diffthis("~") end, "[D]iffthis~")
        -- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
}
