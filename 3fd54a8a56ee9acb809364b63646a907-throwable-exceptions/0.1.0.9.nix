{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "throwable-exceptions";
          version = "0.1.0.9";
        };
        license = "MIT";
        copyright = "aiya000";
        maintainer = "aiya000.develop@gmail.com";
        author = "aiya000";
        homepage = "https://github.com/aiya000/hs-throwable-exceptions#README.md";
        url = "";
        synopsis = "throwable-exceptions gives the easy way to throw exceptions";
        description = "throwable-exceptions gives the easy way to throw exceptions";
        buildType = "Simple";
      };
      components = {
        throwable-exceptions = {
          depends  = [
            hsPkgs.base
            hsPkgs.safe-exceptions
            hsPkgs.template-haskell
          ];
        };
        tests = {
          test = {
            depends  = [
              hsPkgs.base
              hsPkgs.doctest
              hsPkgs.either
              hsPkgs.safe-exceptions
              hsPkgs.silently
              hsPkgs.tasty
              hsPkgs.tasty-discover
              hsPkgs.tasty-hunit
              hsPkgs.text
              hsPkgs.throwable-exceptions
            ];
          };
        };
      };
    }