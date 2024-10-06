local function keys()
    local trouble = require("trouble")
    return {
        { "<leader>tt", function() trouble.toggle("diagnostics") end },
    }
end

return {
	"folke/trouble.nvim",
	config = true,
	keys = keys,
}
