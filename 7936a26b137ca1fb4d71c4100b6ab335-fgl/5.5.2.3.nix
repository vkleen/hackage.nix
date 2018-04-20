{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      containers042 = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "fgl";
          version = "5.5.2.3";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Ivan.Miljenovic@gmail.com";
        author = "Martin Erwig, Ivan Lazar Miljenovic";
        homepage = "";
        url = "";
        synopsis = "Martin Erwig's Functional Graph Library";
        description = "An inductive representation of manipulating graph data structures.\n\nOriginal website can be found at <http://web.engr.oregonstate.edu/~erwig/fgl/haskell>.";
        buildType = "Simple";
      };
      components = {
        fgl = {
          depends  = ([
            hsPkgs.base
            hsPkgs.transformers
            hsPkgs.array
          ] ++ (if _flags.containers042
            then [
              hsPkgs.containers
              hsPkgs.deepseq
            ]
            else [
              hsPkgs.containers
            ])) ++ pkgs.lib.optional (compiler.isGhc && compiler.isGhc) hsPkgs.ghc-prim;
        };
        tests = {
          fgl-tests = {
            depends  = [
              hsPkgs.fgl
              hsPkgs.base
              hsPkgs.QuickCheck
              hsPkgs.hspec
              hsPkgs.containers
            ];
          };
        };
      };
    }