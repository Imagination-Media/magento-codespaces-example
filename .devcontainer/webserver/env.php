<?php
return [
    'backend' => [
        'frontName' => 'admin'
    ],
    'cron_consumers_runner' => [
        'cron_run' => true,
        'max_messages' => 30000,
        'consumers' => [
            'product_action_attribute.update',
            'product_action_attribute.website.update',
            'codegeneratorProcessor',
            'exportProcessor',
            'negotiableQuotePriceUpdate',
            'sharedCatalogUpdatePrice',
            'sharedCatalogUpdateCategoryPermissions',
            'quoteItemCleaner',
            'inventoryQtyCounter',
            'async.operations.all'
        ]
    ],
    'crypt' => [
        'key' => '27ac005c0f6afd144f2ff912b8e4a90d'
    ],
    'db' => [
        'table_prefix' => '',
        'connection' => [
            'default' => [
                'host' => 'db',
                'dbname' => 'magento',
                'username' => 'magento',
                'password' => 'magento',
                'model' => 'mysql4',
                'engine' => 'innodb',
                'initStatements' => 'SET NAMES utf8;',
                'active' => '1',
                'driver_options' => [
                    1014 => false
                ]
            ]
        ]
    ],
    'resource' => [
        'default_setup' => [
            'connection' => 'default'
        ]
    ],
    'x-frame-options' => 'SAMEORIGIN',
    'MAGE_MODE' => 'developer',
    'session' => [
        'save' => 'redis',
        'redis' => [
            'host' => 'redis',
            'port' => '6379',
            'database' => '1'
        ]
    ],
    'cache' => [
        'frontend' => [
            'default' => [
                'id_prefix' => 'b1e_',
                'backend_options' => [
                    'server' => 'redis',
                    'database' => '0',
                    'port' => '6379',
                    'password' => '',
                    'compress_data' => '1',
                    'compression_lib' => ''
                ],
                'backend' => 'Magento\\Framework\\Cache\\Backend\\Redis'
            ],
            'page_cache' => [
                'id_prefix' => 'b1e_',
                'backend_options' => [
                    'server' => 'redis',
                    'database' => '3',
                    'port' => '6379'
                ],
                'backend' => 'Magento\\Framework\\Cache\\Backend\\Redis'
            ]
        ],
        'allow_parallel_generation' => false
    ],
    'lock' => [
        'provider' => 'db',
        'config' => [
            'prefix' => null
        ]
    ],
    'cache_types' => [
        'config' => 1,
        'layout' => 1,
        'block_html' => 1,
        'collections' => 1,
        'reflection' => 1,
        'db_ddl' => 1,
        'compiled_config' => 1,
        'eav' => 1,
        'customer_notification' => 1,
        'config_integration' => 1,
        'config_integration_api' => 1,
        'full_page' => 1,
        'config_webservice' => 1,
        'translate' => 1,
        'vertex' => 1,
        'target_rule' => 1,
        'google_product' => 1
    ],
    'downloadable_domains' => [
        'localhost'
    ],
    'system' => [
        'default' => [
            'smile_elasticsuite_core_base_settings' => [
                'es_client' => [
                    'servers' => 'elasticsearch:9200',
                    'enable_https_mode' => 0,
                    'enable_http_auth' => 1
                ]
            ]
        ]
    ],
    'install' => [
        'date' => 'Wed, 29 Jul 2020 15:08:04 +0000'
    ],
    'queue' => [
        'amqp' => [
            'host' => 'rabbitmq',
            'port' => '5672',
            'user' => 'guest',
            'password' => 'guest',
            'virtualhost' => '/',
            'ssl' => 'false',
            'ssl_options' => [

            ]
        ],
        'consumers_wait_for_messages' => 0
    ]
];
