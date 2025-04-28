local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt


-- Cycle through arguments
vim.keymap.set({ "i", "s" }, "<A-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

------------ PYTHON ---------------
-- Doc string
ls.add_snippets("python", {
    s("dc", fmt(
        [[
        """
        {}
        Args:
            {}
        Returns:
            {}
        Raises:
            {}

        """
        ]], {
            i(1), i(2), i(3), i(4)
        }))
})
