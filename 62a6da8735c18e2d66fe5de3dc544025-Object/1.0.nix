{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.4";
        identifier = {
          name = "Object";
          version = "1.0";
        };
        license = "Apache-2.0";
        copyright = "";
        maintainer = "yokto.reports@gmail.com";
        author = "Silvio Frischknecht";
        homepage = "https://github.com/yokto/object";
        url = "";
        synopsis = "Object oriented programming for haskell using multiparameter typeclasses.";
        description = "Read the homepage or Object.Example for more information.";
        buildType = "Simple";
      };
      components = {
        Object = {
          depends  = [
            hsPkgs.base
            hsPkgs.ghc
            hsPkgs.template-haskell
            hsPkgs.containers
          ];
        };
      };
    }