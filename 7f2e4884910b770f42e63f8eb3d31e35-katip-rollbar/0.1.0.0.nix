{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "katip-rollbar";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "2018 Hardy Jones";
        maintainer = "jones3.hardy@gmail.com";
        author = "Hardy Jones";
        homepage = "https://github.com/joneshf/katip-rollbar#readme";
        url = "";
        synopsis = "Katip scribe that logs to Rollbar";
        description = "";
        buildType = "Simple";
      };
      components = {
        katip-rollbar = {
          depends  = [
            hsPkgs.aeson
            hsPkgs.async
            hsPkgs.base
            hsPkgs.hostname
            hsPkgs.http-client
            hsPkgs.katip
            hsPkgs.rollbar-hs
            hsPkgs.stm-chans
            hsPkgs.text
            hsPkgs.time
          ];
        };
      };
    }