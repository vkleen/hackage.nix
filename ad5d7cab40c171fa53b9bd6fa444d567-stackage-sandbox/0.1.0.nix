{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "stackage-sandbox";
          version = "0.1.0";
        };
        license = "MIT";
        copyright = "2015 FP Complete Corporation";
        maintainer = "danburton@fpcomplete.com";
        author = "Dan Burton";
        homepage = "https://www.stackage.org/package/stackage-sandbox";
        url = "";
        synopsis = "Work with shared stackage sandboxes";
        description = "Work with shared stackage sandboxes";
        buildType = "Simple";
      };
      components = {
        exes = {
          stackage-sandbox = {
            depends  = [
              hsPkgs.base
              hsPkgs.text
              hsPkgs.stackage-cli
              hsPkgs.system-fileio
              hsPkgs.system-filepath
              hsPkgs.optparse-applicative
              hsPkgs.process
              hsPkgs.filepath
            ];
          };
        };
      };
    }