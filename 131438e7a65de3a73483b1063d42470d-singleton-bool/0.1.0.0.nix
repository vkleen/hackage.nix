{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "singleton-bool";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Oleg Grenrus <oleg.grenrus@iki.fi>";
        author = "Oleg Grenrus <oleg.grenrus@iki.fi>";
        homepage = "https://github.com/phadej/singleton-bool#readme";
        url = "";
        synopsis = "Type level booleans";
        description = "Type level booleans.\n\n@singletons@ package provides similar functionality,\nbut it has tight dependency constraints.";
        buildType = "Simple";
      };
      components = {
        singleton-bool = {
          depends  = [ hsPkgs.base ];
        };
      };
    }