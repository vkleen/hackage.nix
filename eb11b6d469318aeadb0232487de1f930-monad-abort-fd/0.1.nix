{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6.0";
        identifier = {
          name = "monad-abort-fd";
          version = "0.1";
        };
        license = "BSD-3-Clause";
        copyright = "2011 Mikhail Vorozhtsov <mikhail.vorozhtsov@gmail.com>";
        maintainer = "Mikhail Vorozhtsov <mikhail.vorozhtsov@gmail.com>";
        author = "Mikhail Vorozhtsov <mikhail.vorozhtsov@gmail.com>";
        homepage = "https://github.com/mvv/monad-abort-fd";
        url = "";
        synopsis = "A better error monad transformer";
        description = "This package provides automated lifting of operations via functional\ndependencies for the @transformers-abort@ package.";
        buildType = "Simple";
      };
      components = {
        monad-abort-fd = {
          depends  = [
            hsPkgs.base
            hsPkgs.transformers-abort
            hsPkgs.mtl
          ];
        };
      };
    }