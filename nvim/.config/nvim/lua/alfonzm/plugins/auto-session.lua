require('auto-session').setup {
    log_level = 'error',
    auto_session_pre_save_cmds = { "tabdo NvimTreeClose" }
}
