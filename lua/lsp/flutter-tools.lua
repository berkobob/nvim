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
					project_config = true,
				},
			},
			debugger = {
				enabled = true,
				run_via_dap = true,
				register_configurations = function(paths)
					require("dap").adapters.dart = {
						type = "executable",
						command = paths.flutter_bin,
						args = { "debug-adapter" },
					}
					require("dap").configurations.dart = {}
					require("dap.ext.vscode").load_launchjs()
				end,
			},
			widget_guides = {
				enabled = true,
			},
			lsp = {
				settings = {
					showtodos = true,
					completfunctioncalls = true,
					renamefileswithclasses = "prompt",
					updateimportsonrename = true,
					enablesnippers = true,
				},
			},

			require("which-key").add({
				{ "<leader>f", group = "Flutter" },
				{ "<leader>fx", "<cmd>Telescope flutter commands <CR>", desc = "Show Flutter commands", mode = "n" },
				{ "<leader>fd", "<cmd>FlutterDevices <CR>", desc = "Show Flutter devices", mode = "n" },
				{ "<leader>fs", "<cmd>FlutterRun <CR>", desc = "Flutter start", mode = "n" },
				{ "<leader>fq", "<cmd>FlutterQuit <CR>", desc = "Flutter quit", mode = "n" },
				{ "<leader>fr", "<cmd>FlutterRestart <CR>", desc = "Flutter hot restart", mode = "n" },
				{ "<leader>fR", "<cmd>FlutterReload <CR>", desc = "Flutter reload", mode = "n" },
				{ "<leader>fo", "<cmd>FlutterOutlineToggle <CR>", desc = "Flutter outline", mode = "n" },
				{ "<leader>fu", "<cmd>FlutterCopyProfileUrl <CR>", desc = "Copy profile URL", mode = "n" },
			}),
		})
	end,
}

--[[
Example dap.configurations.dart:

{
	type = "dart",
	request = "launch",
	name = "Launch dart",
	dartSdkPath = "/Users/antoine/Library/Flutter/bin/dart", -- ensure this is correct
	flutterSdkPath = "/Users/antoine/Library/Flutter/bin/flutter", -- ensure this is correct
	program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
	cwd = "${workspaceFolder}",
	device = "macos",
	toolArgs = { "-d", "macos" },
},
{
	type = "flutter",
	request = "launch",
	name = "Launch flutter",
	dartSdkPath = "/Users/antoine/Library/Flutter/bin/dart", -- ensure this is correct
	flutterSdkPath = "/Users/antoine/Library/Flutter/bin/flutter", -- ensure this is correct
	program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
	cwd = "${workspaceFolder}",
	-- device = "macos",
	-- toolArgs = { "-d", "macos" },
	-- console = "integratedTerminal",
}, ]]
