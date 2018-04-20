{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "hack2-handler-snap-server";
          version = "2011.10.30";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Jinjing Wang <nfjinjing@gmail.com>";
        author = "Jinjing Wang";
        homepage = "https://github.com/nfjinjing/hack2-handler-snap-server";
        url = "";
        synopsis = "Hack2 Snap server handler";
        description = "Hack2 Snap server handler";
        buildType = "Simple";
      };
      components = {
        hack2-handler-snap-server = {
          depends  = [
            hsPkgs.base
            hsPkgs.network
            hsPkgs.bytestring
            hsPkgs.data-default
            hsPkgs.hack2
            hsPkgs.containers
            hsPkgs.mtl
            hsPkgs.enumerator
            hsPkgs.blaze-builder
            hsPkgs.case-insensitive
            hsPkgs.air
            hsPkgs.snap-core
            hsPkgs.snap-server
            hsPkgs.directory
          ];
        };
      };
    }