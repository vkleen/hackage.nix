{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "snap-predicates";
          version = "0.1.0";
        };
        license = "MIT";
        copyright = "Copyright (c) 2013 Toralf Wittner, Brendan Hay";
        maintainer = "Toralf Wittner <tw@dtex.org>";
        author = "Toralf Wittner, Brendan Hay";
        homepage = "";
        url = "";
        synopsis = "Predicates for route definitions.";
        description = "Provides a definition of a predicate type-class together\nwith several concrete implementations which are used to\nconstrain the set of possible Snap handlers in a type-safe\nway.";
        buildType = "Simple";
      };
      components = {
        snap-predicates = {
          depends  = [
            hsPkgs.base
            hsPkgs.transformers
            hsPkgs.bytestring
            hsPkgs.containers
            hsPkgs.case-insensitive
            hsPkgs.snap-core
          ];
        };
        tests = {
          snap-predicates-test-suite = {
            depends  = [
              hsPkgs.base
              hsPkgs.transformers
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.case-insensitive
              hsPkgs.snap-core
              hsPkgs.HUnit
              hsPkgs.QuickCheck
              hsPkgs.test-framework
              hsPkgs.test-framework-hunit
              hsPkgs.test-framework-quickcheck2
            ];
          };
        };
      };
    }