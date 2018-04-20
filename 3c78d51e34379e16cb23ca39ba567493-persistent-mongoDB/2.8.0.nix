{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      high_precision_date = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "persistent-mongoDB";
          version = "2.8.0";
        };
        license = "MIT";
        copyright = "";
        maintainer = "Greg Weber <greg@gregweber.info>";
        author = "Greg Weber <greg@gregweber.info>";
        homepage = "http://www.yesodweb.com/book/persistent";
        url = "";
        synopsis = "Backend for the persistent library using mongoDB.";
        description = "MongoDB backend for the persistent library.";
        buildType = "Simple";
      };
      components = {
        persistent-mongoDB = {
          depends  = [
            hsPkgs.base
            hsPkgs.persistent
            hsPkgs.text
            hsPkgs.transformers
            hsPkgs.containers
            hsPkgs.bytestring
            hsPkgs.conduit
            hsPkgs.resourcet
            hsPkgs.mongoDB
            hsPkgs.bson
            hsPkgs.network
            hsPkgs.cereal
            hsPkgs.path-pieces
            hsPkgs.http-api-data
            hsPkgs.aeson
            hsPkgs.attoparsec
            hsPkgs.time
            hsPkgs.bytestring
            hsPkgs.resource-pool
            hsPkgs.unliftio-core
          ];
        };
      };
    }