require("obsidian").setup({
    workspaces = {
        {
            name = "personal",
            path = "~/projects/notes/obsidian_notes/",
        }
    },
    note_id_func = function(title)
        return title
    end
})
