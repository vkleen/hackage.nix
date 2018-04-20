{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      splitbase = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "HDBC-postgresql";
          version = "1.1.4.0";
        };
        license = "LicenseRef-LGPL";
        copyright = "Copyright (c) 2005-2008 John Goerzen";
        maintainer = "John Goerzen <jgoerzen@complete.org>";
        author = "John Goerzen";
        homepage = "http://software.complete.org/hdbc-postgres";
        url = "";
        synopsis = "PostgreSQL driver for HDBC";
        description = "This package provides a PostgreSQL driver for HDBC";
        buildType = "Custom";
      };
      components = {
        HDBC-postgresql = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
            hsPkgs.HDBC
            hsPkgs.parsec
          ] ++ (if _flags.splitbase
            then [
              hsPkgs.base
              hsPkgs.old-time
            ]
            else [ hsPkgs.base ]);
          libs = [ pkgs.pq ];
        };
      };
    }