{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "linkcore";
          version = "0.4.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "chevalier@alum.wellesley.edu";
        author = "Tim Chevalier";
        homepage = "";
        url = "";
        synopsis = "Combines multiple GHC Core modules into a single module";
        description = "Combines multiple GHC Core modules into a single module";
        buildType = "Simple";
      };
      components = {
        exes = {
          linkcore = {
            depends  = [
              hsPkgs.containers
              hsPkgs.extcore
              hsPkgs.filepath
              hsPkgs.base
              hsPkgs.process
            ];
          };
        };
      };
    }