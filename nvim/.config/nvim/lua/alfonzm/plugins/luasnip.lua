local ls = require('luasnip')

ls.config.set_config({
    history = true,
    updateevents = 'TextChanged,TextChangedI',
})

ls.add_snippets('typescript', {
    ls.parser.parse_snippet('import', "import $1 from '$0';"),
    ls.parser.parse_snippet('cl', 'console.log($0);'),
    ls.parser.parse_snippet('cll', "console.log('$1', $0)"),
})

ls.add_snippets('javascript', {
    ls.parser.parse_snippet('import', "import $1 from '$0'"),
    ls.parser.parse_snippet('cl', 'console.log($0)'),
    ls.parser.parse_snippet('cll', "console.log('$1', $0)"),
})
