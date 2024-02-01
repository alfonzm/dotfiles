-- local lsp_status = require('lsp-status')

-- Gruvbox
local colors = {
    black        = '#282828',
    white        = '#ebdbb2',
    red          = '#fb4934',
    green        = '#b8bb26',
    blue         = '#83a598',
    yellow       = '#fe8019',
    gray         = '#a89984',
    darkgray     = '#3c3836',
    lightgray    = '#504945',
    inactivegray = '#7c6f64',
}

local default_color = {bg = colors.black, fg = colors.inactivegray}
local highlighted_color = {bg = colors.darkgray, fg = colors.gray}

local gruvbox = {
    normal = {
        a = {bg = colors.gray, fg = colors.black, gui = 'bold'},
        b = default_color,
        c = default_color,
        x = default_color,
        y = default_color,
        z = default_color
    },
    insert = {
        a = {bg = colors.green, fg = colors.black, gui = 'bold'},
        b = highlighted_color,
        c = highlighted_color,
        x = highlighted_color,
        y = highlighted_color,
        z = highlighted_color
    },
    visual = {
        a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
        b = highlighted_color,
        c = highlighted_color,
        x = highlighted_color,
        y = highlighted_color,
        z = highlighted_color
    },
    replace = {
        a = {bg = colors.red, fg = colors.black, gui = 'bold'},
        b = highlighted_color,
        c = highlighted_color,
        x = highlighted_color,
        y = highlighted_color,
        z = highlighted_color
    },
    command = {
        a = {bg = colors.green, fg = colors.black, gui = 'bold'},
        b = highlighted_color,
        c = highlighted_color,
        x = highlighted_color,
        y = highlighted_color,
        z = highlighted_color
    },
    inactive = {
        a = {bg = colors.darkgray, fg = colors.gray, gui = 'bold'},
        b = highlighted_color,
        c = highlighted_color,
        x = highlighted_color,
        y = highlighted_color,
        z = highlighted_color
    }
}

-- Register the progress handler
-- lsp_status.register_progress()

-- local default_color = { bg = colors.black, fg = colors.inactivegray }

-- temporary because lualine branch shows \ at the start of the branch name
local function current_git_branch()
    local git_command = "git -C " .. vim.fn.getcwd() .. " branch --show-current 2>&1"  -- Run the Git command and redirect stderr to stdout
    local handle = io.popen(git_command)
    local result = handle:read("*a")  -- Read the command's output
    handle:close()

    -- Check if the result contains 'fatal: not a git repository' or similar error message
    if result:match("fatal: not a git repository") then
        return ""  -- Return empty if it's not a git repo
    else
        return result:gsub("\n$", "")  -- Remove trailing newline and return the branch name
    end
end

require('lualine').setup({
    options = {
        theme = gruvbox,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'vim-plug', 'NvimTree' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            { 'filename', file_status = false, path = 1 },
        },
        -- lualine_c = { "os.date('%H:%M:%S')"},
        lualine_c = { '' },
        lualine_x = { 'diagnostics' },
        lualine_y = { { current_git_branch } },
        -- lualine_z = { "require'lsp-status'.status()" },
        lualine_z = {
            -- 'progress',
            'location',
            -- 'diff',
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {
            { 'filename', file_status = false, path = 1 },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    }
})
