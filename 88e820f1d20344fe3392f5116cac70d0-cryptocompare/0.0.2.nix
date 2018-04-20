{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "cryptocompare";
          version = "0.0.2";
        };
        license = "MIT";
        copyright = "2017 Avi Press";
        maintainer = "avipress@gmail.com";
        author = "Avi Press";
        homepage = "https://github.com/aviaviavi/cryptocompare";
        url = "";
        synopsis = "Haskell wrapper for the cryptocompare API";
        description = "";
        buildType = "Simple";
      };
      components = {
        cryptocompare = {
          depends  = [
            hsPkgs.base
            hsPkgs.base
            hsPkgs.directory
            hsPkgs.text
            hsPkgs.MissingH
            hsPkgs.time
            hsPkgs.aeson
            hsPkgs.unordered-containers
            hsPkgs.http-conduit
            hsPkgs.bytestring
            hsPkgs.containers
            hsPkgs.transformers
            hsPkgs.exceptions
          ];
        };
        exes = {
          cryptocompare-exe = {
            depends  = [
              hsPkgs.base
              hsPkgs.cryptocompare
              hsPkgs.base
              hsPkgs.directory
              hsPkgs.text
              hsPkgs.MissingH
              hsPkgs.time
              hsPkgs.aeson
              hsPkgs.unordered-containers
              hsPkgs.http-conduit
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.transformers
              hsPkgs.exceptions
            ];
          };
        };
        tests = {
          cryptocompare-test = {
            depends  = [
              hsPkgs.base
              hsPkgs.cryptocompare
            ];
          };
        };
      };
    }