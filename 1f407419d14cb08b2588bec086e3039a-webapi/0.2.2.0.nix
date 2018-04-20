{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "webapi";
          version = "0.2.2.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "magesh85@gmail.com";
        author = "Magesh B";
        homepage = "http://byteally.github.io/webapi/";
        url = "";
        synopsis = "WAI based library for web api";
        description = "WAI based library for web api";
        buildType = "Simple";
      };
      components = {
        webapi = {
          depends  = [
            hsPkgs.base
            hsPkgs.text
            hsPkgs.containers
            hsPkgs.binary
            hsPkgs.bytestring
            hsPkgs.vector
            hsPkgs.aeson
            hsPkgs.http-types
            hsPkgs.blaze-builder
            hsPkgs.bytestring-trie
            hsPkgs.bytestring-lexing
            hsPkgs.wai
            hsPkgs.wai-extra
            hsPkgs.case-insensitive
            hsPkgs.http-client
            hsPkgs.http-client-tls
            hsPkgs.network-uri
            hsPkgs.time
            hsPkgs.http-media
            hsPkgs.resourcet
            hsPkgs.exceptions
            hsPkgs.transformers
            hsPkgs.cookie
            hsPkgs.QuickCheck
          ];
        };
        tests = {
          unit-tests = {
            depends  = [
              hsPkgs.base
              hsPkgs.aeson
              hsPkgs.case-insensitive
              hsPkgs.wai
              hsPkgs.wai-extra
              hsPkgs.warp
              hsPkgs.http-media
              hsPkgs.http-types
              hsPkgs.hspec
              hsPkgs.hspec-wai
              hsPkgs.text
              hsPkgs.bytestring
              hsPkgs.vector
              hsPkgs.time
              hsPkgs.QuickCheck
              hsPkgs.webapi
            ];
          };
        };
      };
    }