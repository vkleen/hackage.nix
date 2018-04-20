{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "test-fixture";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "2016 CJ Affiliate by Conversant";
        maintainer = "jvargas@cj.com";
        author = "Joe Vargas";
        homepage = "http://github.com/cjdev/test-fixture#readme";
        url = "";
        synopsis = "Test monadic typeclasses deterministically using hooks.";
        description = "Please see README.md";
        buildType = "Simple";
      };
      components = {
        test-fixture = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
          ];
        };
      };
    }