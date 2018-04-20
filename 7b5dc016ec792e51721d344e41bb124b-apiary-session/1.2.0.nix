{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "apiary-session";
          version = "1.2.0";
        };
        license = "MIT";
        copyright = "(c) 2014 Hirotomo Moriwaki";
        maintainer = "HirotomoMoriwaki<philopon.dependence@gmail.com>";
        author = "HirotomoMoriwaki<philopon.dependence@gmail.com>";
        homepage = "https://github.com/philopon/apiary";
        url = "";
        synopsis = "session support for apiary web framework.";
        description = "";
        buildType = "Simple";
      };
      components = {
        apiary-session = {
          depends  = [
            hsPkgs.base
            hsPkgs.apiary
            hsPkgs.wai
          ];
        };
      };
    }