{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "0";
        identifier = {
          name = "HDBC-mysql";
          version = "0.6.2";
        };
        license = "LicenseRef-LGPL";
        copyright = "Copyright (c) 2009-2010 Chris Waterson";
        maintainer = "Chris Waterson <waterson@maubi.net>";
        author = "Chris Waterson";
        homepage = "http://www.maubi.net/~waterson/hacks/hdbc-mysql.html";
        url = "";
        synopsis = "MySQL driver for HDBC";
        description = "This package provides a MySQL driver for HDBC.";
        buildType = "Custom";
      };
      components = {
        HDBC-mysql = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.time
            hsPkgs.utf8-string
            hsPkgs.HDBC
          ];
        };
      };
    }