{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "mwc-random-monad";
          version = "0.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Alexey Khudyakov <alexey.skladnoy@gmail.com>";
        author = "Alexey Khudyakov <alexey.skladnoy@gmail.com>";
        homepage = "";
        url = "";
        synopsis = "Monadic interface for mwc-random";
        description = "Simple monadit interface for mwc-random.";
        buildType = "Simple";
      };
      components = {
        mwc-random-monad = {
          depends  = [
            hsPkgs.base
            hsPkgs.primitive
            hsPkgs.vector
            hsPkgs.mwc-random
          ];
        };
      };
    }