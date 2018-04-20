{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "copilot-core";
          version = "0.2.3";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "leepike@gmail.com";
        author = "Lee Pike, Robin Morisset, Alwyn Goodloe,\nSebastian Niller, Nis Nordby Wegmann";
        homepage = "";
        url = "";
        synopsis = "An intermediate representation for Copilot.";
        description = "Intermediate representation for Copilot.\nStrictly follows Haskell 2010 except for universal\nand existential quantification.";
        buildType = "Simple";
      };
      components = {
        copilot-core = {
          depends  = [
            hsPkgs.containers
            hsPkgs.base
            hsPkgs.pretty
            hsPkgs.random
            hsPkgs.pretty-ncols
            hsPkgs.mtl
            hsPkgs.dlist
          ];
        };
      };
    }