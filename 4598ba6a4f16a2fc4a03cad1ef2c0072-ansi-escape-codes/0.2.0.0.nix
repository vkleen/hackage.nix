{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "ansi-escape-codes";
          version = "0.2.0.0";
        };
        license = "MIT";
        copyright = "";
        maintainer = "joegesualdo@gmail.com";
        author = "Joe Gesualdo";
        homepage = "https://github.com/joegesualdo/ansi-escape-codes";
        url = "";
        synopsis = "Haskell package to generate ANSI escape codes for styling strings in the terminal.";
        description = "";
        buildType = "Simple";
      };
      components = {
        ansi-escape-codes = {
          depends  = [ hsPkgs.base ];
        };
      };
    }