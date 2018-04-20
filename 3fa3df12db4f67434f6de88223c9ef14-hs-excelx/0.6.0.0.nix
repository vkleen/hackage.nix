{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "hs-excelx";
          version = "0.6.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "mebaran@gmail.com";
        author = "Mark Baran";
        homepage = "";
        url = "";
        synopsis = "HS-Excelx provides basic read-only access to Excel 2007 and 2010 documents in XLSX format.";
        description = "";
        buildType = "Simple";
      };
      components = {
        hs-excelx = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.time
            hsPkgs.mtl
            hsPkgs.text
            hsPkgs.bytestring
            hsPkgs.zip-archive
            hsPkgs.xml-conduit
          ];
        };
      };
    }