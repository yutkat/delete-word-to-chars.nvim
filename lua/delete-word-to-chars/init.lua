local M = {}

local config = require("delete-word-to-chars.config")

function M.setup(user_conf)
	local c = config.set(user_conf)

	vim.keymap.set("i", "<C-w>", function()
		local isk_save = vim.bo.iskeyword
		for index, value in ipairs(c.remove_keyword) do
			vim.opt_local.iskeyword:remove(value)
		end
		for index, value in ipairs(c.add_keyword) do
			vim.opt_local.iskeyword:append(value)
		end

		vim.cmd([[normal! db]])
		if vim.fn.col(".") == vim.fn.col("$") - 1 then
			vim.cmd([[startinsert!]])
		else
			vim.cmd([[startinsert]])
		end

		vim.bo.iskeyword = isk_save
	end, { noremap = true, expr = false, silent = true })
end

return M
