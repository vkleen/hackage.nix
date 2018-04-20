{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.4.0";
        identifier = {
          name = "BiobaseVienna";
          version = "0.0.2.1";
        };
        license = "GPL-3.0-only";
        copyright = "Christian Hoener zu Siederdissen, 2010";
        maintainer = "choener@tbi.univie.ac.at";
        author = "Christian Hoener zu Siederdissen";
        homepage = "";
        url = "";
        synopsis = "ViennaRNA parameter library";
        description = "Import and export of ViennaRNA-style parameters for RNA\nsecondary structure prediction.";
        buildType = "Simple";
      };
      components = {
        BiobaseVienna = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.containers
            hsPkgs.file-embed
            hsPkgs.parsec
            hsPkgs.split
            hsPkgs.tuple
            hsPkgs.vector
            hsPkgs.PrimitiveArray
            hsPkgs.ParsecTools
            hsPkgs.HsTools
            hsPkgs.Biobase
            hsPkgs.BiobaseTurner
            hsPkgs.BiobaseTypes
          ];
        };
      };
    }