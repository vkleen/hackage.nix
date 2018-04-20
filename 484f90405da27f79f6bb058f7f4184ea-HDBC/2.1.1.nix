{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      splitbase = true;
      buildtests = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2.3";
        identifier = {
          name = "HDBC";
          version = "2.1.1";
        };
        license = "LicenseRef-LGPL";
        copyright = "Copyright (c) 2005-2009 John Goerzen";
        maintainer = "John Goerzen <jgoerzen@complete.org>";
        author = "John Goerzen";
        homepage = "http://software.complete.org/hdbc";
        url = "";
        synopsis = "Haskell Database Connectivity";
        description = "HDBC provides an abstraction layer between Haskell programs and SQL\nrelational databases. This lets you write database code once, in\nHaskell, and have it work with any number of backend SQL databases\n(MySQL, Oracle, PostgreSQL, ODBC-compliant databases, etc.)";
        buildType = "Simple";
      };
      components = {
        HDBC = {
          depends  = ([
            hsPkgs.mtl
            hsPkgs.convertible
            hsPkgs.utf8-string
          ] ++ (if _flags.splitbase
            then [
              hsPkgs.base
              hsPkgs.old-time
              hsPkgs.time
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.old-locale
            ]
            else [
              hsPkgs.base
            ])) ++ pkgs.lib.optional compiler.isGhc hsPkgs.base;
        };
        exes = {
          runtests = {
            depends  = [
              hsPkgs.HUnit
              hsPkgs.QuickCheck
              hsPkgs.testpack
            ];
          };
        };
      };
    }