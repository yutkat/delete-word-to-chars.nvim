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
		local r
		if vim.fn.col(".") > vim.fn.col("$") - 1 then
			r = "<C-o>dvb"
		elseif string.match(vim.fn.getline("."):sub(0, vim.fn.col(".") - 1), "^%s+$") then
			r = "<C-o>d0"
		else
			r = "<C-o>db"
		end
		r = r .. "<C-\\><C-o>:<C-u>lua vim.bo.iskeyword=" .. "'" .. isk_save .. "'<CR>"
		return r
	end, { noremap = true, expr = true, silent = false })
end

return M
