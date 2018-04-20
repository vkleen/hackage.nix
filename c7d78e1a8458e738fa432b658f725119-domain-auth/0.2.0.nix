{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "domain-auth";
          version = "0.2.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Kazu Yamamoto <kazu@iij.ad.jp>";
        author = "Kazu Yamamoto <kazu@iij.ad.jp>";
        homepage = "";
        url = "";
        synopsis = "Domain authentication library";
        description = "Library for Sender Policy Framework, SenderID,\nDomainKeys and DKIM.";
        buildType = "Simple";
      };
      components = {
        domain-auth = {
          depends  = [
            hsPkgs.base
            hsPkgs.appar
            hsPkgs.dns
            hsPkgs.iproute
            hsPkgs.network
            hsPkgs.bytestring
            hsPkgs.RSA
            hsPkgs.binary
            hsPkgs.containers
            hsPkgs.SHA
            hsPkgs.blaze-builder
          ];
        };
      };
    }