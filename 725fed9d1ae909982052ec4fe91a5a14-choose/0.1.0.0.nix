{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "choose";
          version = "0.1.0.0";
        };
        license = "Apache-2.0";
        copyright = "";
        maintainer = "Chris Martin <ch.martin@gmail.com>";
        author = "Chris Martin <ch.martin@gmail.com>";
        homepage = "";
        url = "";
        synopsis = "Choose random elements from a stream.";
        description = "Provides an efficient mechanism to select /n/ items uniformly at random from an input stream, for some fixed /n/.";
        buildType = "Simple";
      };
      components = {
        choose = {
          depends  = [
            hsPkgs.base
            hsPkgs.MonadRandom
          ];
        };
      };
    }