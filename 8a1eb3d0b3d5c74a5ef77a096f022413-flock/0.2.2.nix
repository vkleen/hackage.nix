{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "flock";
          version = "0.2.2";
        };
        license = "LicenseRef-OtherLicense";
        copyright = "Ian Lynagh, 2007";
        maintainer = "igloo@earth.li";
        author = "Ian Lynagh";
        homepage = "";
        url = "";
        synopsis = "Wrapper for flock(2)";
        description = "Simple wrapper around flock(2).";
        buildType = "Simple";
      };
      components = {
        flock = {
          depends  = [
            hsPkgs.base
            hsPkgs.unix
            hsPkgs.mtl
          ];
        };
      };
    }