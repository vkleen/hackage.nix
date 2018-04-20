{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.16";
        identifier = {
          name = "ihaskell-aeson";
          version = "0.3.0.0";
        };
        license = "MIT";
        copyright = "";
        maintainer = "andrew.gibiansky@gmail.com";
        author = "Andrew Gibiansky";
        homepage = "http://www.github.com/gibiansky/ihaskell";
        url = "";
        synopsis = "IHaskell display instances for Aeson";
        description = "";
        buildType = "Simple";
      };
      components = {
        ihaskell-aeson = {
          depends  = [
            hsPkgs.base
            hsPkgs.here
            hsPkgs.text
            hsPkgs.bytestring
            hsPkgs.aeson
            hsPkgs.aeson-pretty
            hsPkgs.ihaskell
          ];
        };
      };
    }