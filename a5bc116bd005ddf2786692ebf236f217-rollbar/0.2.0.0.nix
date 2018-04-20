{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "rollbar";
          version = "0.2.0.0";
        };
        license = "MIT";
        copyright = "";
        maintainer = "greg@gregweber.info";
        author = "Greg Weber";
        homepage = "https://github.com/gregwebs/rollbar-haskell";
        url = "";
        synopsis = "error notification to rollbar.com";
        description = "";
        buildType = "Simple";
      };
      components = {
        rollbar = {
          depends  = [
            hsPkgs.base
            hsPkgs.text
            hsPkgs.aeson
            hsPkgs.vector
            hsPkgs.network
            hsPkgs.basic-prelude
            hsPkgs.monad-control
            hsPkgs.http-conduit
          ];
        };
      };
    }