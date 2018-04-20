{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "bindings-monetdb-mapi";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "muesli4@gmail.com";
        author = "Moritz Bruder";
        homepage = "";
        url = "";
        synopsis = "Low-level bindings for the MonetDB API (mapi)";
        description = "";
        buildType = "Simple";
      };
      components = {
        bindings-monetdb-mapi = {
          depends  = [ hsPkgs.base ];
          pkgconfig = [
            pkgconfPkgs.monetdb-mapi
          ];
        };
      };
    }