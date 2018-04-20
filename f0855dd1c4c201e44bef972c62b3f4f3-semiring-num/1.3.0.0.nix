{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "semiring-num";
          version = "1.3.0.0";
        };
        license = "MIT";
        copyright = "2016 Donnacha Oisín Kidney";
        maintainer = "mail@doisinkidney.com";
        author = "Donnacha Oisín Kidney";
        homepage = "https://github.com/oisdk/semiring-num";
        url = "";
        synopsis = "Basic semiring class and instances";
        description = "Adds a basic semiring class";
        buildType = "Simple";
      };
      components = {
        semiring-num = {
          depends  = [
            hsPkgs.base
            hsPkgs.template-haskell
            hsPkgs.containers
            hsPkgs.log-domain
          ];
        };
        tests = {
          semiring-test = {
            depends  = [
              hsPkgs.base
              hsPkgs.semiring-num
              hsPkgs.smallcheck
              hsPkgs.doctest
              hsPkgs.containers
              hsPkgs.QuickCheck
              hsPkgs.nat-sized-numbers
              hsPkgs.tasty
              hsPkgs.tasty-smallcheck
              hsPkgs.tasty-quickcheck
              hsPkgs.log-domain
            ];
          };
        };
        benchmarks = {
          bench = {
            depends  = [
              hsPkgs.base
              hsPkgs.semiring-num
              hsPkgs.criterion
              hsPkgs.random
              hsPkgs.containers
            ];
          };
        };
      };
    }