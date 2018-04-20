{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "attoparsec-trans";
          version = "0.1.0.1";
        };
        license = "MIT";
        copyright = "";
        maintainer = "srijs@airpost.net";
        author = "Sam Rijs";
        homepage = "https://github.com/srijs/haskell-attoparsec-trans";
        url = "";
        synopsis = "Interleaved effects for attoparsec parsers";
        description = "";
        buildType = "Simple";
      };
      components = {
        attoparsec-trans = {
          depends  = [
            hsPkgs.base
            hsPkgs.transformers
            hsPkgs.attoparsec
          ];
        };
      };
    }