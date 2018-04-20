{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "messagepack-rpc";
          version = "0.5.1";
        };
        license = "MIT";
        copyright = "(c) 2014 Rodrigo Setti";
        maintainer = "rodrigosetti@gmail.com";
        author = "Rodrigo Setti";
        homepage = "http://github.com/rodrigosetti/messagepack-rpc";
        url = "https://github.com/rodrigosetti/messagepack-rpc/archive/master.zip";
        synopsis = "Message Pack RPC over TCP";
        description = "Message Pack RPC over TCP";
        buildType = "Simple";
      };
      components = {
        messagepack-rpc = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.cereal
            hsPkgs.containers
            hsPkgs.messagepack
            hsPkgs.network-simple
          ];
        };
      };
    }