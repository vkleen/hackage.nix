{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "chain-codes";
          version = "0.3.0.0";
        };
        license = "GPL-3.0-only";
        copyright = "";
        maintainer = "fuuzetsu@fuuzetsu.co.uk";
        author = "Mateusz Kowalczyk";
        homepage = "http://github.com/Fuuzetsu/chain-codes";
        url = "";
        synopsis = "Library decoding chain codes from images";
        description = "Library decoding chain codes from images";
        buildType = "Simple";
      };
      components = {
        chain-codes = {
          depends  = [
            hsPkgs.base
            hsPkgs.JuicyPixels
            hsPkgs.containers
          ];
        };
        tests = {
          spec = {
            depends  = [
              hsPkgs.base
              hsPkgs.hspec
              hsPkgs.JuicyPixels
              hsPkgs.containers
              hsPkgs.chain-codes
            ];
          };
        };
      };
    }