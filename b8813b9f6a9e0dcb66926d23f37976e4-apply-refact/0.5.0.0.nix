{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "apply-refact";
          version = "0.5.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "matthewtpickering@gmail.com";
        author = "Matthew Pickering";
        homepage = "";
        url = "";
        synopsis = "Perform refactorings specified by the refact library.";
        description = "Perform refactorings specified by the refact library. It is primarily used with HLint's --refactor flag.";
        buildType = "Simple";
      };
      components = {
        apply-refact = {
          depends  = [
            hsPkgs.base
            hsPkgs.refact
            hsPkgs.ghc-exactprint
            hsPkgs.ghc
            hsPkgs.containers
            hsPkgs.syb
            hsPkgs.mtl
            hsPkgs.process
            hsPkgs.transformers
            hsPkgs.temporary
            hsPkgs.filemanip
            hsPkgs.unix-compat
            hsPkgs.directory
          ];
        };
        exes = {
          refactor = {
            depends  = [
              hsPkgs.base
              hsPkgs.refact
              hsPkgs.ghc-exactprint
              hsPkgs.ghc
              hsPkgs.containers
              hsPkgs.syb
              hsPkgs.mtl
              hsPkgs.process
              hsPkgs.directory
              hsPkgs.optparse-applicative
              hsPkgs.filemanip
              hsPkgs.unix-compat
              hsPkgs.filepath
              hsPkgs.temporary
              hsPkgs.transformers
            ];
          };
        };
        tests = {
          test = {
            depends  = [
              hsPkgs.tasty
              hsPkgs.tasty-golden
              hsPkgs.tasty-expected-failure
              hsPkgs.base
              hsPkgs.refact
              hsPkgs.ghc-exactprint
              hsPkgs.ghc
              hsPkgs.containers
              hsPkgs.syb
              hsPkgs.mtl
              hsPkgs.process
              hsPkgs.directory
              hsPkgs.optparse-applicative
              hsPkgs.filemanip
              hsPkgs.unix-compat
              hsPkgs.filepath
              hsPkgs.silently
              hsPkgs.temporary
              hsPkgs.transformers
            ];
          };
        };
      };
    }