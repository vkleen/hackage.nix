{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "pusher-haskell";
          version = "0.1.0.0";
        };
        license = "MIT";
        copyright = "";
        maintainer = "sidsraval@gmail.com";
        author = "Sid Raval";
        homepage = "http://www.github.com/sidraval/pusher-haskell";
        url = "";
        synopsis = "A Pusher.com client written in Haskell";
        description = "A server-side client for interacting with Pusher.com";
        buildType = "Simple";
      };
      components = {
        pusher-haskell = {
          depends  = [
            hsPkgs.base
            hsPkgs.aeson
            hsPkgs.HTTP
            hsPkgs.SHA
            hsPkgs.MissingH
            hsPkgs.mtl
            hsPkgs.bytestring
            hsPkgs.time
          ];
        };
        tests = {
          spec = {
            depends  = [
              hsPkgs.base
              hsPkgs.hspec
              hsPkgs.pusher-haskell
            ];
          };
        };
      };
    }