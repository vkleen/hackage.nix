{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "g4ip";
          version = "0.1.0.0";
        };
        license = "MIT";
        copyright = "";
        maintainer = "coskuacay@gmail.com";
        author = "Josh Acay";
        homepage = "https://github.com/cacay/G4ip";
        url = "";
        synopsis = "A theorem prover for propositional logic that uses G4ip";
        description = "";
        buildType = "Simple";
      };
      components = {
        g4ip = {
          depends  = [ hsPkgs.base ];
        };
        tests = {
          test-g4ip = {
            depends  = [
              hsPkgs.base
              hsPkgs.g4ip
            ];
          };
        };
      };
    }