<?php

use SwooleCli\Preprocessor;
use SwooleCli\Library;
use SwooleCli\Extension;

return function (Preprocessor $p) {

    $p->withExportVariable('PHP_MONGODB_SSL', 'yes');
    $p->withExportVariable('PHP_MONGODB_SSL_CFLAGS', '$(pkg-config --cflags --static libcrypto libssl  openssl)');
    $p->withExportVariable('PHP_MONGODB_SSL_LIBS', '$(pkg-config   --libs   --static libcrypto libssl  openssl)');


    $p->withExportVariable('PHP_MONGODB_ICU', 'yes');
    $p->withExportVariable('PHP_MONGODB_ICU_CFLAGS', '$(pkg-config --cflags --static icu-i18n  icu-io  icu-uc)');
    $p->withExportVariable('PHP_MONGODB_ICU_LIBS', '$(pkg-config   --libs   --static icu-i18n  icu-io  icu-uc)');

    $p->withExportVariable('PHP_MONGODB_ZSTD_CFLAGS', '$(pkg-config --cflags --static libzstd)');
    $p->withExportVariable('PHP_MONGODB_ZSTD_LIBS', '$(pkg-config   --libs   --static libzstd)');

    $p->withExportVariable('PHP_MONGODB_ZLIB_CFLAGS', '$(pkg-config --cflags --static zlib)');
    $p->withExportVariable('PHP_MONGODB_ZLIB_LIBS', '$(pkg-config   --libs   --static zlib)');


    $options = ' --enable-mongodb ';
    $options .= ' --with-mongodb-system-libs=no ';
    $options .= ' --with-mongodb-ssl=openssl ';
    $options .= ' --with-mongodb-icu=yes ';
    $options .= ' --with-mongodb-snappy=no ';
    $options .= ' --with-mongodb-zlib=yes ';
    $options .= ' --with-mongodb-zstd=yes ';
    $options .= ' --with-mongodb-sasl=no ';
    $options .= ' --with-system-libs=yes ';
    $ext = new Extension('mongodb');

    $ext->withHomePage('https://www.php.net/mongodb')
        ->withHomePage('https://www.mongodb.com/docs/drivers/php/')
        ->withOptions($options)
        ->withPeclVersion('1.16.1')
        ->withDependentExtensions('openssl')
    ;

    $depends = ['icu', 'openssl', 'zlib', 'libzstd','mongo_c_driver'];

    //$depends[] = 'libsasl';
    //$depends[] = 'snappy';

    call_user_func_array([$ext, 'withDependentLibraries'], $depends);

    $p->addExtension($ext);
};
