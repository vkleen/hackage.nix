{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "language-openscad";
          version = "0.1.5";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2014 Ben Gamari";
        maintainer = "bgamari@gmail.com>";
        author = "Ben Gamari";
        homepage = "http://www.github.com/bgamari/language-openscad";
        url = "";
        synopsis = "A simple parser for OpenSCAD";
        description = "A simple parser for OpenSCAD";
        buildType = "Simple";
      };
      components = {
        language-openscad = {
          depends  = [
            hsPkgs.base
            hsPkgs.attoparsec
            hsPkgs.bytestring
          ];
        };
        exes = {
          Test = {
            depends  = [
              hsPkgs.base
              hsPkgs.attoparsec
              hsPkgs.bytestring
              hsPkgs.language-openscad
            ];
          };
        };
      };
    }