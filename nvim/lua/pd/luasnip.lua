local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Load VSCode-style snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Custom snippets
ls.add_snippets("all", {
    s("test", {
        t("Hello, this is a test of "),
        i(1), -- Insert node 1 - cursor will be placed here
    }),
})
