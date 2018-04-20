{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      builtin-sqlite3 = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "sqlite";
          version = "0.4.2";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (c) 2007-8, Galois Inc";
        maintainer = "Don Stewart";
        author = "Galois Inc";
        homepage = "";
        url = "";
        synopsis = "Haskell binding to sqlite3";
        description = "Haskell binding to sqlite3 <http://sqlite.org/>.\n";
        buildType = "Configure";
      };
      components = {
        sqlite = {
          depends  = [
            hsPkgs.base
            hsPkgs.pretty
            hsPkgs.utf8-string
            hsPkgs.bytestring
            hsPkgs.time
            hsPkgs.directory
          ];
          libs = pkgs.lib.optional (!_flags.builtin-sqlite3) pkgs.sqlite3;
        };
      };
    }