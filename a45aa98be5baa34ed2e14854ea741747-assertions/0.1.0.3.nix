{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "assertions";
          version = "0.1.0.3";
        };
        license = "MIT";
        copyright = "";
        maintainer = "me@vikramverma.com";
        author = "vi";
        homepage = "";
        url = "";
        synopsis = "A simple testing framework.";
        description = "";
        buildType = "Simple";
      };
      components = {
        assertions = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.ansi-terminal
          ];
        };
        tests = {
          assert-tests = {
            depends  = [
              hsPkgs.base
              hsPkgs.assertions
              hsPkgs.interpolate
              hsPkgs.process
            ];
          };
        };
      };
    }