{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "hwhile";
          version = "0.1.1.1";
        };
        license = "GPL-3.0-only";
        copyright = "";
        maintainer = "apjeffery136@gmail.com";
        author = "Alex Jeffery";
        homepage = "";
        url = "";
        synopsis = "An implementation of Neil D. Jones' While language";
        description = "An implementation of Neil D. Jones' While language. Developed in collaboration\nwith Dr. Bernhard Reus (University of Sussex, UK) for use in the Limits of\nComputing module.";
        buildType = "Simple";
      };
      components = {
        hwhile = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.array
            hsPkgs.filepath
            hsPkgs.haskeline
            hsPkgs.repline
            hsPkgs.mtl
          ];
        };
        exes = {
          hwhile = {
            depends  = [
              hsPkgs.base
              hsPkgs.containers
              hsPkgs.array
              hsPkgs.filepath
              hsPkgs.mtl
              hsPkgs.hwhile
            ];
          };
        };
        tests = {
          hwhile-testsuite = {
            depends  = [
              hsPkgs.base
              hsPkgs.containers
              hsPkgs.array
              hsPkgs.Cabal
              hsPkgs.mtl
              hsPkgs.hwhile
            ];
          };
        };
      };
    }