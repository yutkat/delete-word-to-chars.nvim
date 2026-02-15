local M = {}

local config = require("delete-word-to-chars.config")

function M.setup(user_conf)
	local c = config.set(user_conf)

	vim.keymap.set("i", "<C-w>", function()
		local isk_save = vim.bo.iskeyword
		for _, value in ipairs(c.remove_keyword) do
			vim.opt_local.iskeyword:remove(value)
		end
		for _, value in ipairs(c.add_keyword) do
			vim.opt_local.iskeyword:append(value)
		end
		local r
		if vim.fn.col(".") > vim.fn.col("$") - 1 then
			r = '<C-o>"_dvb'
		elseif string.match(vim.fn.getline("."):sub(1, vim.fn.col(".") - 1), "^%s+$") then
			r = '<C-o>"_d0'
		else
			r = '<C-o>"_db'
		end
		r = r .. "<C-\\><C-o>:<C-u>lua vim.bo.iskeyword=" .. "'" .. isk_save .. "'<CR>"
		return r
	end, { noremap = true, expr = true, silent = true })
end

return M
