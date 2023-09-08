<?php

use SwooleCli\Library;
use SwooleCli\Preprocessor;

return function (Preprocessor $p) {
    $libxdp_prefix = EXAMPLE_PREFIX;
    $libxdp_prefix = LIBXDP_PREFIX;
    $openssl_prefix = OPENSSL_PREFIX;
    $gettext_prefix = GETTEXT_PREFIX;

    //文件名称 和 库名称一致
    $lib = new Library('libxdp');
    $lib->withHomePage('https://github.com/xdp-project/xdp-tools.git')
        ->withLicense('https://github.com/xdp-project/xdp-tools/blob/master/LICENSE', Library::LICENSE_LGPL)
        ->withManual('https://github.com/xdp-project/xdp-tools.git')

        ->withFile('xdp-tools-latest.tar.gz')
        ->withDownloadScript(
            'xdp-tools',
            <<<EOF
                git clone -b master  --depth=1 https://github.com/xdp-project/xdp-tools.git
EOF
        )
        ->withPrefix($libxdp_prefix)

        ->withConfigure(
            <<<EOF

            ./configure --help

            PACKAGES='openssl  '
            PACKAGES="\$PACKAGES zlib"

            CPPFLAGS="$(pkg-config  --cflags-only-I  --static \$PACKAGES)" \
            LDFLAGS="$(pkg-config   --libs-only-L    --static \$PACKAGES) " \
            LIBS="$(pkg-config      --libs-only-l    --static \$PACKAGES)" \
            ./configure \
            --prefix={$libxdp_prefix} \
            --enable-shared=no \
            --enable-static=yes

EOF
        )


        ->withPkgName('example')
        ->withBinPath($libxdp_prefix . '/bin/')
        ->withDependentLibraries('zlib', 'libbpf')

    ;

    $p->addLibrary($lib);

};
