{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "dhall-check";
          version = "1.0.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "BSD3";
        maintainer = "anfelor@posteo.de";
        author = "Anton Felix Lorenzen";
        homepage = "https://github.com/anfelor/dhall-check#readme";
        url = "";
        synopsis = "Check all dhall files in a project";
        description = "";
        buildType = "Simple";
      };
      components = {
        exes = {
          dhall-check = {
            depends  = [
              hsPkgs.base
              hsPkgs.containers
              hsPkgs.directory
              hsPkgs.dhall
              hsPkgs.filepath
              hsPkgs.fsnotify
              hsPkgs.trifecta
              hsPkgs.text
            ];
          };
        };
      };
    }