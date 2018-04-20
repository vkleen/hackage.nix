{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "bench";
          version = "1.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "2016 Gabriel Gonzalez";
        maintainer = "Gabriel439@gmail.com";
        author = "Gabriel Gonzalez";
        homepage = "http://github.com/Gabriel439/bench";
        url = "";
        synopsis = "Command-line benchmark tool";
        description = "Think of this as a more powerful alternative to the @time@\ncommand.  Use this command-line tool to benchmark a command\nusing Haskell's @criterion@ library.";
        buildType = "Simple";
      };
      components = {
        exes = {
          bench = {
            depends  = [
              hsPkgs.base
              hsPkgs.criterion
              hsPkgs.text
              hsPkgs.silently
              hsPkgs.turtle
            ];
          };
        };
      };
    }