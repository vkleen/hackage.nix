{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      split-syb = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "curry-base";
          version = "0.2.9";
        };
        license = "LicenseRef-OtherLicense";
        copyright = "";
        maintainer = "Björn Peemöller <bjp@informatik.uni-kiel.de>";
        author = "Wolfgang Lux, Martin Engelke, Bernd Brassel, Holger Siegel,\nBjörn Peemöller";
        homepage = "http://www.curry-language.org";
        url = "";
        synopsis = "Functions for manipulating Curry programs";
        description = "This package serves as a foundation for Curry compilers.\nIt defines the intermediate language formats FlatCurry and\nExtendedFlat. Additionally, it provides functionality\nfor the smooth integration of compiler frontends and backends.";
        buildType = "Simple";
      };
      components = {
        curry-base = {
          depends  = [
            hsPkgs.mtl
            hsPkgs.containers
            hsPkgs.filepath
            hsPkgs.pretty
            hsPkgs.old-time
            hsPkgs.directory
          ] ++ (if _flags.split-syb
            then [ hsPkgs.base hsPkgs.syb ]
            else [ hsPkgs.base ]);
        };
      };
    }