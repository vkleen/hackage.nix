{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "0";
        identifier = {
          name = "pretty-class";
          version = "1.0.1.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "David Fox";
        author = "Lennart Augustsson";
        homepage = "";
        url = "";
        synopsis = "Pretty printing class similar to Show.";
        description = "Pretty printing class similar to Show, based on the HughesPJ\npretty printing library.  Provides the pretty printing class\nand instances for the Prelude types.";
        buildType = "Simple";
      };
      components = {
        pretty-class = {
          depends  = [
            hsPkgs.base
            hsPkgs.pretty
          ];
        };
      };
    }