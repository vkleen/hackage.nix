{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "apiary-purescript";
          version = "0.14.0";
        };
        license = "MIT";
        copyright = "(c) 2014 Hirotomo Moriwaki";
        maintainer = "HirotomoMoriwaki<philopon.dependence@gmail.com>";
        author = "HirotomoMoriwaki<philopon.dependence@gmail.com>";
        homepage = "https://github.com/philopon/apiary";
        url = "";
        synopsis = "purescript compiler for apiary web framework.";
        description = "example: <https://github.com/philopon/apiary/blob/master/examples/pureScript.hs>";
        buildType = "Simple";
      };
      components = {
        apiary-purescript = {
          depends  = [
            hsPkgs.base
            hsPkgs.template-haskell
            hsPkgs.apiary
            hsPkgs.purescript
            hsPkgs.filepath
            hsPkgs.utf8-string
            hsPkgs.text
            hsPkgs.bytestring
            hsPkgs.unordered-containers
            hsPkgs.reflection
            hsPkgs.parsec
            hsPkgs.Glob
          ];
        };
      };
    }