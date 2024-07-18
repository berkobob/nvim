return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function ()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.startify')
        --local dashboard = require('alpha.themes.dashboard')

        dashboard.section.header.val = {
"··············································································",
":░█▀▀░█░█░█▀█░█░░░█░░░░░█░█░█▀▀░░░█▀█░█░░░█▀█░█░█░░░█▀█░░░█▀▀░█▀█░█▄█░█▀▀░▀▀█:",
":░▀▀█░█▀█░█▀█░█░░░█░░░░░█▄█░█▀▀░░░█▀▀░█░░░█▀█░░█░░░░█▀█░░░█░█░█▀█░█░█░█▀▀░░▀░:",
":░▀▀▀░▀░▀░▀░▀░▀▀▀░▀▀▀░░░▀░▀░▀▀▀░░░▀░░░▀▀▀░▀░▀░░▀░░░░▀░▀░░░▀▀▀░▀░▀░▀░▀░▀▀▀░░▀░:",
"··············································································",
        }

        dashboard.section.top_buttons.header= "Projects"
        dashboard.section.top_buttons.val = {
			dashboard.button("n", "neovim config", function() vim.cmd(':cd ~/.config/nvim') vim.cmd('Telescope find_files') end),
			dashboard.button("r", "RPM2", function() vim.cmd(':cd ~/dev/src/rpm2') vim.cmd('Telescope find_files') end),
        }


            -- disable MRU
            -- dashboard.section.mru.val = { { type = "padding", val = 0 } }
            -- disable MRU cwd
            -- dashboard.section.mru_cwd.val = { { type = "padding", val = 0 } }
            -- disable nvim_web_devicons
            -- dashboard.nvim_web_devicons.enabled = false
            -- startify.nvim_web_devicons.highlight = false
            -- startify.nvim_web_devicons.highlight = 'Keyword'
            --
            dashboard.section.bottom_buttons.val = {
                dashboard.button( "q", "Quit NVIM" , ":qa<CR>"),
                dashboard.button( "h", "Check health" , ":checkhealth<CR>"),
            }
            dashboard.section.footer = {
                { type = "text", val = "footer" },
            }
            -- ignore filetypes in MRU

            -- dashboard.mru_opts.ignore = function(path, ext)
            --     return
            --             (string.find(path, "COMMIT_EDITMSG"))
            --         or  (vim.tbl_contains(default_mru_ignore, ext))
            -- end


        alpha.setup(dashboard.opts)
    end,
}

