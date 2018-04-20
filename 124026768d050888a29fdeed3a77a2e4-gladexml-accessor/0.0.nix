{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "0";
        identifier = {
          name = "gladexml-accessor";
          version = "0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "yakov@yakov.cc";
        author = "Yakov Zaytsev";
        homepage = "";
        url = "";
        synopsis = "Automagically declares getters for widget handles in specified interface file.";
        description = "";
        buildType = "Simple";
      };
      components = {
        gladexml-accessor = {
          depends  = [
            hsPkgs.base
            hsPkgs.template-haskell
            hsPkgs.HaXml
            hsPkgs.glade
          ];
        };
      };
    }