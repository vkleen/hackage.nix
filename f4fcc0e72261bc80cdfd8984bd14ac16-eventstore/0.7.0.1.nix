{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "eventstore";
          version = "0.7.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "yo.eight@gmail.com";
        author = "Yorick Laupa";
        homepage = "http://github.com/YoEight/eventstore";
        url = "";
        synopsis = "EventStore TCP Client";
        description = "EventStore TCP Client <http://geteventstore.com>";
        buildType = "Simple";
      };
      components = {
        eventstore = {
          depends  = [
            hsPkgs.base
            hsPkgs.aeson
            hsPkgs.async
            hsPkgs.bytestring
            hsPkgs.cereal
            hsPkgs.containers
            hsPkgs.network
            hsPkgs.protobuf
            hsPkgs.random
            hsPkgs.sodium
            hsPkgs.text
            hsPkgs.time
            hsPkgs.uuid
          ];
        };
      };
    }