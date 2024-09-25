require("rest-nvim").setup({
    -- Open request results in a horizontal split
    result_split_horizontal = false,
    -- Keep the http file buffer above|left when split horizontal|vertical
    result_split_in_place = true,
    -- Skip SSL verification, useful for unknown certificates
    skip_ssl_verification = true,
    -- Encode URL before making request
    encode_url = true,
    -- Highlight request on run
    highlight = {
        enabled = true,
        timeout = 20,
    },
    result = {
        show_url = true,
        show_curl_command = false,
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response body [optional]
        -- set them to false if you want to disable them
        formatters = {
            json = function(body)
                return vim.fn.system({"jq", "."}, body)
            end,
            html = function(body)
                return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
            end
        },
    },
    -- Jump to request line on run
    jump_to_request = false,
    env_file = '.env',
    -- custom_dynamic_variables = {},
    -- yank_dry_run = true,
})

vim.keymap.set('n', '<Leader>j', ':lua require("rest-nvim").run()<CR>')

-- Define a table containing HTTP verbs
local http_verbs = { 'GET', 'POST', 'PATCH', 'PUT', 'DELETE' }

-- Define a function to navigate between HTTP request lines
function navigate_http_requests(direction)
    -- Check if the current buffer has a 'filetype' of 'http'
    if vim.bo.filetype == 'http' then
        local current_line = vim.fn.getline('.')
        local target_line_number = nil

        -- Construct the search pattern using the HTTP verbs from the table
        local search_pattern = table.concat(http_verbs, '\\|')

        -- Search for the next/previous HTTP request line with the defined verbs
        if direction == 'next' then
            target_line_number = vim.fn.search(search_pattern, 'W')
        elseif direction == 'prev' then
            target_line_number = vim.fn.search(search_pattern, 'bW')
        end

        -- If found, navigate to the target line
        if target_line_number > 0 then
            vim.fn.cursor(target_line_number, 1)
        else
            -- If not found, return to the original line
            vim.fn.cursor(vim.fn.line('.'), vim.fn.col('.'))
        end
    end
end

-- Create key mappings for navigating HTTP requests
vim.api.nvim_set_keymap('n', '[[', [[:lua navigate_http_requests('prev')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']]', [[:lua navigate_http_requests('next')<CR>]], { noremap = true, silent = true })
