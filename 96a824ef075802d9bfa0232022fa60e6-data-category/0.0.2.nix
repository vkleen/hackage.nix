{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "data-category";
          version = "0.0.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "sjoerd@w3future.com";
        author = "Sjoerd Visscher";
        homepage = "http://github.com/sjoerdvisscher/data-category";
        url = "";
        synopsis = "Restricted categories";
        description = "Data-category is a collection of categories, and some categorical constructions on them.";
        buildType = "Simple";
      };
      components = {
        data-category = {
          depends  = [ hsPkgs.base ];
        };
      };
    }