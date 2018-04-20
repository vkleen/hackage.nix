{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "gitlib";
          version = "0.1.0";
        };
        license = "MIT";
        copyright = "";
        maintainer = "johnw@newartisans.com";
        author = "John Wiegley";
        homepage = "";
        url = "";
        synopsis = "Higher-level types for working with hlibgit2";
        description = "Higher-level types for working with hlibgit2";
        buildType = "Simple";
      };
      components = {
        gitlib = {
          depends  = [
            hsPkgs.base
            hsPkgs.hlibgit2
            hsPkgs.system-filepath
            hsPkgs.system-fileio
            hsPkgs.time
            hsPkgs.text
            hsPkgs.containers
            hsPkgs.bytestring
            hsPkgs.stringable
            hsPkgs.lens
          ];
        };
        tests = {
          smoke = {
            depends  = [
              hsPkgs.base
              hsPkgs.gitlib
              hsPkgs.process
              hsPkgs.system-filepath
              hsPkgs.system-fileio
              hsPkgs.time
              hsPkgs.text
              hsPkgs.containers
              hsPkgs.bytestring
              hsPkgs.stringable
              hsPkgs.lens
            ];
          };
        };
      };
    }