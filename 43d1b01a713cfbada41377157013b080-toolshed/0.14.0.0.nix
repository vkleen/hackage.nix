{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      havedeepseq = true;
      llvm = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "toolshed";
          version = "0.14.0.0";
        };
        license = "LicenseRef-GPL";
        copyright = "(C) 2010 Dr. Alistair Ward";
        maintainer = "toolshed <at> functionalley <dot> eu";
        author = "Dr. Alistair Ward";
        homepage = "http://functionalley.eu";
        url = "";
        synopsis = "Utilities used by other packages.";
        description = "An ill-defined collection of simple unrelated utilities used by other packages from <http://functionalley.eu>";
        buildType = "Simple";
      };
      components = {
        toolshed = {
          depends  = [
            hsPkgs.array
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.directory
            hsPkgs.filepath
            hsPkgs.QuickCheck
            hsPkgs.random
          ] ++ pkgs.lib.optional _flags.havedeepseq hsPkgs.deepseq;
        };
        exes = {
          toolshed = {
            depends  = [ hsPkgs.Cabal ];
          };
        };
      };
    }