{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "hs-snowtify";
          version = "0.1.0.0";
        };
        license = "MIT";
        copyright = "aiya000";
        maintainer = "aiya000.develop@gmail.com";
        author = "aiya000";
        homepage = "https://github.com/aiya000/hs-snowtify#README.md";
        url = "";
        synopsis = "snowtify send your result of `stack build` (`stack test`) to notify-daemon :dog2:";
        description = "snowtify send your result of `stack build` (`stack test`) to notify-daemon :dog2:";
        buildType = "Simple";
      };
      components = {
        exes = {
          snowtify = {
            depends  = [
              hsPkgs.base
              hsPkgs.either
              hsPkgs.safe
              hsPkgs.safe-exceptions
              hsPkgs.text
              hsPkgs.turtle
            ];
          };
        };
      };
    }