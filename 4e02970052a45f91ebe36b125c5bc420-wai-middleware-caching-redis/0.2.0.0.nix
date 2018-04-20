{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "wai-middleware-caching-redis";
          version = "0.2.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "Yann Esposito © 2015";
        maintainer = "yann.esposito@gmail.com";
        author = "Yann Esposito";
        homepage = "http://github.com/yogsototh/wai-middleware-caching/tree/master/wai-middleware-caching-redis#readme";
        url = "";
        synopsis = "Cache Wai Middleware using Redis backend";
        description = "Please see README.md";
        buildType = "Simple";
      };
      components = {
        wai-middleware-caching-redis = {
          depends  = [
            hsPkgs.base
            hsPkgs.wai-middleware-caching
            hsPkgs.hedis
            hsPkgs.blaze-builder
            hsPkgs.bytestring
            hsPkgs.text
            hsPkgs.http-types
            hsPkgs.wai
          ];
        };
        tests = {
          wai-middleware-caching-redis-test = {
            depends  = [
              hsPkgs.base
              hsPkgs.wai-middleware-caching-redis
            ];
          };
        };
      };
    }