{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      llvm = false;
      threaded = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "squeeze";
          version = "1.0.4.8";
        };
        license = "LicenseRef-GPL";
        copyright = "(C) 2010-2015 Dr. Alistair Ward";
        maintainer = "mailto <colon> squeeze <at> functionalley <dot> eu";
        author = "Dr. Alistair Ward";
        homepage = "http://functionalley.eu/Squeeze/squeeze.html";
        url = "";
        synopsis = "A file-packing application.";
        description = "Returns progressively better subsets of the specified files, selected to fit into a limited space, without wasting more than the specific ratio.";
        buildType = "Simple";
      };
      components = {
        squeeze = {
          depends  = [
            hsPkgs.base
            hsPkgs.Cabal
            hsPkgs.directory
            hsPkgs.factory
            hsPkgs.filepath
            hsPkgs.mtl
            hsPkgs.toolshed
          ];
        };
        exes = {
          squeeze = {
            depends  = [
              hsPkgs.base
              hsPkgs.Cabal
              hsPkgs.factory
              hsPkgs.filepath
              hsPkgs.mtl
              hsPkgs.random
              hsPkgs.squeeze
              hsPkgs.toolshed
            ];
          };
        };
        tests = {
          quickCheck = {
            depends  = [
              hsPkgs.base
              hsPkgs.factory
              hsPkgs.QuickCheck
              hsPkgs.squeeze
              hsPkgs.toolshed
            ];
          };
        };
      };
    }