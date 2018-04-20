{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      examples = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "concurrent-state";
          version = "0.5.1.3";
        };
        license = "MIT";
        copyright = "";
        maintainer = "me@joelt.io";
        author = "Joel Taylor";
        homepage = "https://github.com/joelteon/concurrent-state";
        url = "";
        synopsis = "MTL-like library using TVars";
        description = "State, RWS backed by TVar.";
        buildType = "Simple";
      };
      components = {
        concurrent-state = {
          depends  = [
            hsPkgs.base
            hsPkgs.exceptions
            hsPkgs.mtl
            hsPkgs.stm
            hsPkgs.transformers
          ];
        };
        exes = {
          chat-server = {
            depends  = pkgs.lib.optionals _flags.examples [
              hsPkgs.base
              hsPkgs.concurrent-state
              hsPkgs.network
              hsPkgs.stm
            ];
          };
        };
      };
    }