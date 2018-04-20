{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "Hedi";
          version = "0.1.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "paolo.veronelli@gmail.com";
        author = "Paolo Veronelli";
        homepage = "";
        url = "";
        synopsis = "Line oriented editor";
        description = "Haskell line editor. Cloned from ed manual.";
        buildType = "Simple";
      };
      components = {
        Hedi = {
          depends  = [
            hsPkgs.editline
            hsPkgs.base
            hsPkgs.mtl
            hsPkgs.parsec
            hsPkgs.regex-posix
            hsPkgs.QuickCheck
            hsPkgs.process
            hsPkgs.pretty
          ];
        };
        exes = {
          hedi = {
            depends  = [
              hsPkgs.editline
              hsPkgs.base
              hsPkgs.mtl
              hsPkgs.parsec
              hsPkgs.regex-posix
              hsPkgs.QuickCheck
              hsPkgs.process
              hsPkgs.pretty
            ];
          };
        };
      };
    }