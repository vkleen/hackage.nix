{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "eibd-client-simple";
          version = "0.0.2";
        };
        license = "GPL-3.0-only";
        copyright = "Copyright (c) Ole Krüger, 2014";
        maintainer = "ole.krueger@campus.tu-berlin.de";
        author = "Ole Krüger";
        homepage = "";
        url = "";
        synopsis = "EIBd Client";
        description = "Simple EIBd Client";
        buildType = "Simple";
      };
      components = {
        eibd-client-simple = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.containers
            hsPkgs.transformers
            hsPkgs.mtl
          ];
          libs = [ pkgs.eibclient ];
        };
      };
    }