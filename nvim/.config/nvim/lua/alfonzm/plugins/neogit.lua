local neogit = require('neogit')

neogit.setup {
    integrations = {
        diffview = true
    },
    sections = {
        untracked = {
            folded = false
        },
        unstaged = {
            folded = false
        },
        staged = {
            folded = false
        },
        stashes = {
            folded = true
        },
        unpulled = {
            folded = true
        },
        unmerged = {
            folded = true
        },
        recent = {
            folded = true
        },
    },
}
