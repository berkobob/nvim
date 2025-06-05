return {
	"vimwiki/vimwiki",
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "/home/pi/Documents/",
				syntax = "markdown",
				ext = ".md",
			},
		}
	end,
}
