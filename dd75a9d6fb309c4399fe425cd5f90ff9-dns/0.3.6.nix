{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "dns";
          version = "0.3.6";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Kazu Yamamoto <kazu@iij.ad.jp>";
        author = "Kazu Yamamoto <kazu@iij.ad.jp>";
        homepage = "";
        url = "";
        synopsis = "DNS library in Haskell";
        description = "DNS library for clients and servers.";
        buildType = "Simple";
      };
      components = {
        dns = {
          depends  = if compiler.isGhc
            then [
              hsPkgs.base
              hsPkgs.attoparsec
              hsPkgs.attoparsec-conduit
              hsPkgs.binary
              hsPkgs.blaze-builder
              hsPkgs.bytestring
              hsPkgs.conduit
              hsPkgs.containers
              hsPkgs.iproute
              hsPkgs.mtl
              hsPkgs.network
              hsPkgs.network-conduit
              hsPkgs.random
            ]
            else [
              hsPkgs.base
              hsPkgs.attoparsec
              hsPkgs.attoparsec-conduit
              hsPkgs.binary
              hsPkgs.blaze-builder
              hsPkgs.bytestring
              hsPkgs.conduit
              hsPkgs.containers
              hsPkgs.iproute
              hsPkgs.mtl
              hsPkgs.network
              hsPkgs.network-bytestring
              hsPkgs.network-conduit
              hsPkgs.random
            ];
        };
      };
    }