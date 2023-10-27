local M = {}

function M.toggle_test_file()
  -- Get the current file name
  local current_file = vim.fn.expand('%:p')

  -- Extract the base name without the directory
  local base_name = vim.fn.fnamemodify(current_file, ':t')

  -- Define the search directory for Test files (in this case, 'tests/')
  local test_search_dir = 'tests/'

  -- Define the search directory for regular files (e.g., 'app/')
  local regular_search_dir = 'app/'

  -- Check if the current file is a Test file
  if string.match(base_name, 'Test%.php$') then
    -- Remove 'Test.php' suffix and change search directory
    local original_base_name = base_name:gsub('Test%.php$', '.php')
    local cmd = 'rg --files --type php -g "' .. original_base_name .. '" ' .. regular_search_dir
    local result = vim.fn.systemlist(cmd)

    -- Check if the original file was found
    if not vim.tbl_isempty(result) then
      -- Get the first found original file
      local original_file = result[1]
      -- Open the original file in Neovim
      vim.api.nvim_command('edit ' .. original_file)
    else
      -- If no original file is found, show an error message
      print('No original file found for ' .. original_base_name)
    end
  else
    -- If it's not a Test file, look for the Test file
    local cmd = 'rg --files --type php -g "' .. base_name:gsub('%.php$', 'Test.php') .. '" ' .. test_search_dir
    local result = vim.fn.systemlist(cmd)

    -- Check if the Test file was found
    if not vim.tbl_isempty(result) then
      -- Get the first found Test file
      local test_file = result[1]
      -- Open the Test file in Neovim
      vim.api.nvim_command('edit ' .. test_file)
    else
      -- If no Test file is found, show an error message
      print('No Test file found for ' .. base_name)
    end
  end
end

return M
