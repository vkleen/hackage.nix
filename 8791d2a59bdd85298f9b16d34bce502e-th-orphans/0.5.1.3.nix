{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "th-orphans";
          version = "0.5.1.3";
        };
        license = "BSD-3-Clause";
        copyright = "(c) Matt Morrow";
        maintainer = "Michael Sloan <mgsloan at gmail>";
        author = "Matt Morrow";
        homepage = "";
        url = "";
        synopsis = "Orphan instances for TH datatypes";
        description = "In particular, instances for Ord and Lift.";
        buildType = "Simple";
      };
      components = {
        th-orphans = {
          depends  = [
            hsPkgs.base
            hsPkgs.th-lift
          ] ++ [
            hsPkgs.template-haskell
          ];
        };
      };
    }