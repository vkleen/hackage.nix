{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "0";
        identifier = {
          name = "tuple";
          version = "0.2.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Lennart Augustsson";
        author = "Lennart Augustsson";
        homepage = "";
        url = "";
        synopsis = "Various functions on tuples";
        description = "Various useful functions on tuples, overloaded on tuple size.";
        buildType = "Simple";
      };
      components = {
        tuple = {
          depends  = [
            hsPkgs.base
            hsPkgs.OneTuple
          ];
        };
      };
    }