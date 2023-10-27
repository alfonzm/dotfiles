vim.g.projectionist_heuristics = {
    artisan = {
        ['*'] = {
            start = 'php artisan serve',
            console = 'php artisan tinker',
        },

        -- Regular Laravel convention
        ['app/*.php'] = {
            type = 'source',
            alternate = {
                'tests/Unit/{}Test.php',
                'tests/Feature/{}Test.php',
            },
        },
        ['tests/Feature/*Test.php'] = {
            type = 'test',
            alternate = {
                'app/{}.php',
                'app/Http/Controllers/{}.php',
            }
        },
        ['tests/Unit/*Test.php'] = {
            type = 'test',
            alternate = 'app/{}.php',
        },
        ['app/Models/*.php'] = {
            type = 'model',
        },
        ['app/Http/Controllers/*.php'] = {
            type = 'controller',
        },
        ['routes/*.php'] = {
            type = 'route',
        },
        ['database/migrations/*.php'] = {
            type = 'migration',
        },

        -- Domain-Driven Design Laravel
        ['app/Domain/*.php'] = {
            type = 'source',
            alternate = {
                'tests/Domain/{}Test.php',
                'tests/Domains/{}Test.php',
            },
        },
        ['tests/Domains/*Test.php'] = {
            type = 'test',
            alternate = {
                'app/Domains/{}.php',
                'app/Domain/{}.php',
            }
        },

        -- Work
        ['app/Http/*.php'] = {
            type = 'source',
            alternate = {
                'tests/{}Test.php',
            },
        },
        ['tests/*.php'] = {
            type = 'source',
            alternate = {
                'app/Http/{}.php',
            },
        },
    },
}
