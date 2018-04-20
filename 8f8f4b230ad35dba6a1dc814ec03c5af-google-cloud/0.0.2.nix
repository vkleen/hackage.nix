{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "google-cloud";
          version = "0.0.2";
        };
        license = "MIT";
        copyright = "";
        maintainer = "tomas.carnecky@gmail.com";
        author = "Tomas Carnecky";
        homepage = "";
        url = "";
        synopsis = "Client for the Google Cloud APIs";
        description = "Storage, Compute, ...";
        buildType = "Simple";
      };
      components = {
        google-cloud = {
          depends  = [
            hsPkgs.base
            hsPkgs.time
            hsPkgs.bytestring
            hsPkgs.text
            hsPkgs.mtl
            hsPkgs.stm
            hsPkgs.http-types
            hsPkgs.http-client
            hsPkgs.http-client-tls
            hsPkgs.scientific
            hsPkgs.aeson
            hsPkgs.unordered-containers
          ];
        };
      };
    }