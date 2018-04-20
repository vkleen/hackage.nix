{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "parameterized";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "2017 Louis Pan";
        maintainer = "louis@pan.me";
        author = "Louis Pan";
        homepage = "https://github.com/louispan/parameterized#readme";
        url = "";
        synopsis = "Extensible records and polymorphic variants.";
        description = "Parameterized/indexed monoids and monads using only a single parameter type variable.";
        buildType = "Simple";
      };
      components = {
        parameterized = {
          depends  = [
            hsPkgs.base
            hsPkgs.data-diverse
            hsPkgs.transformers
          ];
        };
      };
    }