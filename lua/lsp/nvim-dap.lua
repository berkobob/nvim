return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			ui.setup({
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.25 },
							{ id = "watches", size = 0.25 },
							{ id = "breakpoints", size = 0.25 },
							{ id = "stacks", size = 0.25 },
						},
						position = "left",
						size = 0.28,
					},
					{
						elements = {
							{ id = "repl", size = 0.5 },
							{ id = "console", size = 0.5 },
						},
						position = "bottom",
						size = 0.3,
					},
				},
			})

			require("nvim-dap-virtual-text").setup({
				all_references = true,
			})

			require("neodev").setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
			})

			local dapui = require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			-- Dart CLI adapter (recommended)
			-- dap.adapters.dart = {
			-- 	type = "executable",
			-- 	command = "dart",
			-- 	args = { "debug_adapter" },
			-- 	console = "integratedTerminal",
			-- 	options = {
			-- 		detached = false,
			-- 	},
			-- }
			-- dap.adapters.flutter = {
			-- 	type = "executable",
			-- 	command = "flutter",
			-- 	args = { "debug_adapter" },
			-- 	console = "debugConsole",
			-- 	options = {
			-- 		detached = false,
			-- 	},
			-- }

			-- vim.highlight.create('DapBreakpoint', { ctermbg=0, guifg='#993939', guibg='#31353f' }, false)
			-- vim.highlight.create('DapLogPoint', { ctermbg=0, guifg='#61afef', guibg='#31353f' }, false)
			vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
			vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
			vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })

			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "⭕️", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapBreakpointRejected",
				{ text = "🟢", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define("DapLogPoint", {
				text = "‼️",
				texthl = "DapLogPoint",
				linehl = "DapLogPoint",
				numhl = "DapLogPoint",
			})
			vim.fn.sign_define("DapStopped", {
				text = "🟢",
				texthl = "DapStopped",
				linehl = "DapStopped",
				numhl = "DapStopped",
			})
			require("which-key").add({
				{ "<Leader>d", group = "Debugger" },
				{ "<Leader>db", ":DapToggleBreakpoint <CR>", desc = "Toggle breakpoint", mode = "n" },
				{ "<Leader>dc", ":DapContinue <CR>", desc = "Start/continue", mode = "n" },
				{ "<Leader>dq", ":DapTerminate <CR>", desc = "Stop debugging", mode = "n" },
				{ "<A-Right>", ":DapStepOver <CR>", desc = "Step Over", mode = "n" },
				{ "<A-Down>", ":DapStepInto <CR>", desc = "Step down", mode = "n" },
				{ "<A-Up>", ":DapStepOut <CR>", desc = "Step out", mode = "n" },
				{ "<Leader>dl", ":DapShowLog <CR>", desc = "Show Dap Log", mode = "n" },
				{ "<Leader>dr", ":lua require('dapui').open({reset = true}) <CR>", desc = "Reset Dap UI", mode = "n" },
				{ "<Leader>du", ":lua require('dapui').toggle() <CR>", desc = "Toggle Dap UI", mode = "n" },
			})
		end,
	},
	{ "folke/neodev.nvim", opts = {} },
}

--[[
edit: e
expand: <CR> or left click
open: o
remove: d
repl: r
toggle: t
--]]
