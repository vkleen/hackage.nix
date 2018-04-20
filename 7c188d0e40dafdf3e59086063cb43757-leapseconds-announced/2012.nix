{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "0";
        identifier = {
          name = "leapseconds-announced";
          version = "2012";
        };
        license = "BSD-3-Clause";
        copyright = "Bjorn Buckwalter 2009-2012";
        maintainer = "bjorn.buckwalter@gmail.com";
        author = "Bjorn Buckwalter";
        homepage = "";
        url = "";
        synopsis = "Leap seconds announced at library release time.";
        description = "Provides an easy to use static 'Data.Time.Clock.TAI.LeapSecondTable'\nwith the leap seconds announced at library release time.";
        buildType = "Simple";
      };
      components = {
        leapseconds-announced = {
          depends  = [
            hsPkgs.base
            hsPkgs.time
          ];
        };
      };
    }