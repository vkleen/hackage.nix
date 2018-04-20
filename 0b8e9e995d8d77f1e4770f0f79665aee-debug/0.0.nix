{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.18";
        identifier = {
          name = "debug";
          version = "0.0";
        };
        license = "BSD-3-Clause";
        copyright = "Neil Mitchell 2017";
        maintainer = "Neil Mitchell <ndmitchell@gmail.com>";
        author = "Neil Mitchell <ndmitchell@gmail.com>";
        homepage = "https://github.com/ndmitchell/debug";
        url = "";
        synopsis = "Simple trace-based debugger";
        description = "An easy to use debugger for viewing function calls and intermediate variables.\nTo use, annotate the function under test, run the code, and view the generated web page.\nFull usage instructions are at \"Debug\".";
        buildType = "Simple";
      };
      components = {
        debug = {
          depends  = [
            hsPkgs.base
            hsPkgs.ghc-prim
            hsPkgs.extra
            hsPkgs.containers
            hsPkgs.directory
            hsPkgs.template-haskell
            hsPkgs.uniplate
            hsPkgs.js-jquery
          ];
        };
        tests = {
          debug-test = {
            depends  = [
              hsPkgs.base
              hsPkgs.debug
            ];
          };
        };
      };
    }