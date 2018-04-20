{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "PlslTools";
          version = "0.0.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "";
        author = "Larry Layland";
        homepage = "LLayland.wordpress.com";
        url = "";
        synopsis = "So far just a lint like program for PL/SQL. Diff and refactoring tools are planned";
        description = "";
        buildType = "Simple";
      };
      components = {
        exes = {
          PlslLint = {
            depends  = [
              hsPkgs.old-locale
              hsPkgs.old-time
              hsPkgs.filepath
              hsPkgs.directory
              hsPkgs.process
              hsPkgs.random
              hsPkgs.array
              hsPkgs.haskell98
              hsPkgs.base
              hsPkgs.parsec
            ];
          };
        };
      };
    }