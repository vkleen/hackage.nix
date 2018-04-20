{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "hmeap";
          version = "0.6";
        };
        license = "LicenseRef-GPL";
        copyright = "Rohan Drape, 2007-2008";
        maintainer = "rd@slavepianos.org";
        author = "Rohan Drape";
        homepage = "http://slavepianos.org/rd/f/896678/";
        url = "";
        synopsis = "Haskell Meapsoft Parser";
        description = "Parser for the anaylsis files produced by the Meapsoft\nfeature extractor.";
        buildType = "Simple";
      };
      components = {
        hmeap = {
          depends  = [ hsPkgs.base ];
        };
      };
    }