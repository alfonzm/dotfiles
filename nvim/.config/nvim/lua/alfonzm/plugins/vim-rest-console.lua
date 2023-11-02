vim.g.vrc_header_content_type = 'application/json'
vim.g.vrc_response_default_content_type = 'application/json'
vim.g.vrc_output_buffer_name = '_OUTPUT.json'
vim.g.vrc_auto_format_response_patterns = {
    json = 'jq "."'
}

vim.api.nvim_set_var('vrc_curl_opts', {
    ['-sS'] = '',
    -- ['--connect-timeout'] = 10,
    -- ['-i'] = '',
    -- ['--max-time'] = 60,
    ['-k'] = '',
})

-- Show cURL command in the output
-- vim.g.vrc_show_command = 1
