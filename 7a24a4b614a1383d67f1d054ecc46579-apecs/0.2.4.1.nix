{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "apecs";
          version = "0.2.4.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "jonascarpay@gmail.com";
        author = "Jonas Carpay";
        homepage = "https://github.com/jonascarpay/apecs#readme";
        url = "";
        synopsis = "A fast ECS for game engine programming";
        description = "A fast ECS for game engine programming";
        buildType = "Simple";
      };
      components = {
        apecs = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.mtl
            hsPkgs.template-haskell
            hsPkgs.async
            hsPkgs.vector
          ];
        };
        tests = {
          apecs-test = {
            depends  = [
              hsPkgs.base
              hsPkgs.apecs
              hsPkgs.QuickCheck
              hsPkgs.containers
              hsPkgs.vector
            ];
          };
        };
        benchmarks = {
          apecs-bench = {
            depends  = [
              hsPkgs.base
              hsPkgs.apecs
              hsPkgs.criterion
              hsPkgs.linear
            ];
          };
        };
      };
    }