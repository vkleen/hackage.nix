{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "pipes-conduit";
          version = "0.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "p.capriotti@gmail.com";
        author = "Paolo Capriotti";
        homepage = "https://github.com/pcapriotti/pipes-extra";
        url = "";
        synopsis = "Conduit adapters";
        description = "Conduit adapters";
        buildType = "Simple";
      };
      components = {
        pipes-conduit = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
            hsPkgs.pipes-core
            hsPkgs.conduit
          ];
        };
      };
    }