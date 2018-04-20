{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      tests = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "language-c-quote";
          version = "0.2.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2006-2010 Harvard University";
        maintainer = "mainland@eecs.harvard.edu";
        author = "Geoffrey Mainland <mainland@eecs.harvard.edu>";
        homepage = "http://www.eecs.harvard.edu/~mainland/";
        url = "";
        synopsis = "C/CUDA quasiquoting library.";
        description = "C/CUDA quasiquoting library.";
        buildType = "Custom";
      };
      components = {
        language-c-quote = {
          depends  = ([
            hsPkgs.array
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.containers
            hsPkgs.exception-mtl
            hsPkgs.filepath
            hsPkgs.srcloc
            hsPkgs.mainland-pretty
            hsPkgs.mtl
            hsPkgs.syb
            hsPkgs.symbol
            hsPkgs.template-haskell
          ] ++ pkgs.lib.optional compiler.isGhc hsPkgs.haskell-src-meta) ++ pkgs.lib.optional compiler.isGhc hsPkgs.haskell-src-meta;
        };
        exes = {
          unit-test = {
            depends  = [
              hsPkgs.HUnit
              hsPkgs.base
              hsPkgs.language-c-quote
            ];
          };
        };
      };
    }