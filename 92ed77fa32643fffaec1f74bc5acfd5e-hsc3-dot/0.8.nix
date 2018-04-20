{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "hsc3-dot";
          version = "0.8";
        };
        license = "LicenseRef-GPL";
        copyright = "(c) Rohan Drape, 2006-2010";
        maintainer = "rd@slavepianos.org";
        author = "Rohan Drape";
        homepage = "http://slavepianos.org/rd/?t=hsc3-dot";
        url = "";
        synopsis = "haskell supercollider graph drawing";
        description = "dot format graph generator for SuperCollider\nunit generator graphs constructed using hsc3.";
        buildType = "Simple";
      };
      components = {
        hsc3-dot = {
          depends  = [
            hsPkgs.base
            hsPkgs.directory
            hsPkgs.filepath
            hsPkgs.hsc3
            hsPkgs.process
          ];
        };
      };
    }