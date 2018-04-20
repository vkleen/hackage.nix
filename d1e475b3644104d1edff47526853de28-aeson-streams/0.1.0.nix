{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "aeson-streams";
          version = "0.1.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "thu@hypered.io";
        author = "Vo Minh Thu";
        homepage = "https://github.com/noteed/aeson-streams";
        url = "";
        synopsis = "An HTTP client library for JSON-based APIs";
        description = "An HTTP client library for JSON-based APIs using aeson and http-streams.";
        buildType = "Simple";
      };
      components = {
        aeson-streams = {
          depends  = [
            hsPkgs.aeson
            hsPkgs.attoparsec
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.HsOpenSSL
            hsPkgs.http-streams
            hsPkgs.io-streams
          ];
        };
      };
    }