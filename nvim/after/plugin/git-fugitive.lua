-- Alias Git fugitive commands, same as zsh git aliases
-- https://stackoverflow.com/questions/3878692/how-to-create-an-alias-for-a-command-in-vim
function _G.abbreviate_or_noop(input, output)
    local cmdtype = vim.fn.getcmdtype()
    local cmdline = vim.fn.getcmdline()

    if (cmdtype == ":" and cmdline == input) then
        return output
    else
        return input
    end
end

local create_command_alias = function(input, output)
    vim.api.nvim_command("cabbrev <expr> " .. input .. " " .. "v:lua.abbreviate_or_noop('" .. input .. "', '" .. output .. "')")
end

create_command_alias('gst', 'G status')
create_command_alias('gd', 'G diff')
create_command_alias('gaa', 'G add .')
