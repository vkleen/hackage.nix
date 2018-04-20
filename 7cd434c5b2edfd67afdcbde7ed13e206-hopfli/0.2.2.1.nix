{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "hopfli";
          version = "0.2.2.1";
        };
        license = "Apache-2.0";
        copyright = "";
        maintainer = "Cristian Adrián Ontivero <cristianontivero@gmail.com>";
        author = "Anantha Kumaran <ananthakumaran@gmail.com>";
        homepage = "https://github.com/ananthakumaran/hopfli";
        url = "";
        synopsis = "Bidings to Google's Zopfli compression library";
        description = "Hopfli provides a pure interface to compress data using the Zopfli library\nalgorithm.";
        buildType = "Simple";
      };
      components = {
        hopfli = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.zlib
          ];
        };
        tests = {
          test = {
            depends  = [
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.hspec
              hsPkgs.zlib
              hsPkgs.QuickCheck
              hsPkgs.hopfli
            ];
          };
        };
      };
    }