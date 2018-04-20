{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "fizzbuzz";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "paperlefthand";
        author = "paperlefthand";
        homepage = "";
        url = "";
        synopsis = "test";
        description = "fizzbuzz game.";
        buildType = "Simple";
      };
      components = {
        fizzbuzz = {
          depends  = [ hsPkgs.base ];
        };
      };
    }