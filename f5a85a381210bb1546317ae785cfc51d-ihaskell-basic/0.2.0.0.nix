{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.16";
        identifier = {
          name = "ihaskell-basic";
          version = "0.2.0.0";
        };
        license = "MIT";
        copyright = "";
        maintainer = "andrew.gibiansky@gmail.com";
        author = "Andrew Gibiansky";
        homepage = "http://www.github.com/gibiansky/IHaskell";
        url = "";
        synopsis = "IHaskell display instances for basic types";
        description = "";
        buildType = "Simple";
      };
      components = {
        ihaskell-basic = {
          depends  = [
            hsPkgs.base
            hsPkgs.classy-prelude
            hsPkgs.ihaskell
          ];
        };
      };
    }