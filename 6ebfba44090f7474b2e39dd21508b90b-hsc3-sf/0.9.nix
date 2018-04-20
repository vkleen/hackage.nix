{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "hsc3-sf";
          version = "0.9";
        };
        license = "LicenseRef-GPL";
        copyright = "(c) Rohan Drape, 2006-2011";
        maintainer = "rd@slavepianos.org";
        author = "Rohan Drape";
        homepage = "http://slavepianos.org/rd/?t=hsc3-sf";
        url = "";
        synopsis = "Haskell SuperCollider SoundFile";
        description = "Trivial NeXT sound file input and output.\nFor almost all use cases please see Stefan\nKersten's hsndfile package.";
        buildType = "Simple";
      };
      components = {
        hsc3-sf = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.hosc
          ];
        };
      };
    }