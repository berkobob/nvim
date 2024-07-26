return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({
			decorations = {
				statusline = {
					device = true,
				},
			},
			debugger = {
				enabled = true,
        register_configurations = function() 
          require("dap").configurations.dart = {

  {
    type = "dart",
    request = "launch",
    name = "Launch dart",
    dartSdkPath = "/Users/antoine/Library/Flutter/bin/dart", -- ensure this is correct
    flutterSdkPath = "/Users/antoine/Library/Flutter/bin/flutter",                  -- ensure this is correct
    program = "${workspaceFolder}/lib/main.dart",     -- ensure this is correct
    cwd = "${workspaceFolder}",
    device = "macos",
    toolArgs = {"-d", "macos"}
  },
  {
    type = "flutter",
    request = "launch",
    name = "Launch flutter",
    dartSdkPath = "/Users/antoine/Library/Flutter/bin/dart", -- ensure this is correct
    flutterSdkPath = "/Users/antoine/Library/Flutter/bin/flutter",             -- ensure this is correct
    program = "${workspaceFolder}/lib/main.dart",     -- ensure this is correct
    cwd = "${workspaceFolder}",
    device = "macos",
    toolArgs = {"-d", "macos"}
          }
          -- require("dap.ext.vscode").load_launchjs()
          }
        end
			},
      widget_guides = {
        enabled = true,
      }
		})
	end,
}
