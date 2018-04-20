{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      tls = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "mighttpd2";
          version = "3.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Kazu Yamamoto <kazu@iij.ad.jp>";
        author = "Kazu Yamamoto <kazu@iij.ad.jp>";
        homepage = "http://www.mew.org/~kazu/proj/mighttpd/";
        url = "";
        synopsis = "High performance web server on WAI/warp";
        description = "High performance web server to handle static\nfiles and CGI on WAI/warp.\nReverse proxy functionality is also provided\nto connect web applications behind.";
        buildType = "Simple";
      };
      components = {
        mighttpd2 = {
          depends  = [
            hsPkgs.base
            hsPkgs.array
            hsPkgs.blaze-builder
            hsPkgs.byteorder
            hsPkgs.bytestring
            hsPkgs.case-insensitive
            hsPkgs.conduit
            hsPkgs.directory
            hsPkgs.filepath
            hsPkgs.http-date
            hsPkgs.http-types
            hsPkgs.io-choice
            hsPkgs.network
            hsPkgs.parsec
            hsPkgs.process-conduit
            hsPkgs.unix
            hsPkgs.unix-time
            hsPkgs.unordered-containers
            hsPkgs.wai
            hsPkgs.wai-app-file-cgi
            hsPkgs.warp
          ];
        };
        exes = {
          mighty = {
            depends  = [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.http-client
              hsPkgs.http-date
              hsPkgs.http-types
              hsPkgs.mighttpd2
              hsPkgs.network
              hsPkgs.network-conduit
              hsPkgs.transformers
              hsPkgs.unix
              hsPkgs.wai
              hsPkgs.wai-app-file-cgi
              hsPkgs.wai-logger
              hsPkgs.warp
            ] ++ pkgs.lib.optionals _flags.tls [
              hsPkgs.tls
              hsPkgs.warp-tls
            ];
          };
          mighty-mkindex = {
            depends  = [
              hsPkgs.base
              hsPkgs.directory
              hsPkgs.old-locale
              hsPkgs.time
              hsPkgs.unix
            ];
          };
          mightyctl = {
            depends  = [
              hsPkgs.base
              hsPkgs.unix
              hsPkgs.mighttpd2
            ];
          };
        };
        tests = {
          spec = {
            depends  = [
              hsPkgs.base
              hsPkgs.hspec
              hsPkgs.mighttpd2
              hsPkgs.http-client
            ] ++ pkgs.lib.optionals _flags.tls [
              hsPkgs.tls
              hsPkgs.warp-tls
            ];
          };
        };
      };
    }