{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "hsc3-unsafe";
          version = "0.5";
        };
        license = "LicenseRef-GPL";
        copyright = "(c) Rohan Drape, 2006-2008";
        maintainer = "rd@slavepianos.org";
        author = "Rohan Drape";
        homepage = "http://slavepianos.org/rd/f/207949/";
        url = "";
        synopsis = "Unsafe Haskell SuperCollider";
        description = "hsc3 provides Sound.SC3.UGen.Unsafe.";
        buildType = "Simple";
      };
      components = {
        hsc3-unsafe = {
          depends  = [
            hsPkgs.base
            hsPkgs.hsc3
          ];
        };
      };
    }