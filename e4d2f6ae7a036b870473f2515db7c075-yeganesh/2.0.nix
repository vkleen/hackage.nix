{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "yeganesh";
          version = "2.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "daniel@wagner-home.com";
        author = "Daniel Wagner";
        homepage = "http://www.dmwit.com/yeganesh";
        url = "";
        synopsis = "small dmenu wrapper";
        description = "I get so annoyed when I go to use dmenu, and the three\nprograms I use every day aren't at the beginning of the\nlist.  Let's make it so, and automatically!";
        buildType = "Simple";
      };
      components = {
        exes = {
          yeganesh = {
            depends  = [
              hsPkgs.base
              hsPkgs.containers
              hsPkgs.directory
              hsPkgs.filepath
              hsPkgs.process
              hsPkgs.strict
              hsPkgs.time
            ];
          };
        };
      };
    }