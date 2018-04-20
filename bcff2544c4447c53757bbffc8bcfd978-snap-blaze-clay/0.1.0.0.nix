{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "snap-blaze-clay";
          version = "0.1.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Decebal Popa <deck@parfait.ro>";
        author = "Decebal Popa <deck@parfait.ro>";
        homepage = "http://github.com/deckool/snap-blaze-clay";
        url = "";
        synopsis = "blaze-html-clay integration for Snap";
        description = "blaze-html-clay integration for Snap";
        buildType = "Simple";
      };
      components = {
        snap-blaze-clay = {
          depends  = [
            hsPkgs.base
            hsPkgs.blaze-html
            hsPkgs.snap-core
            hsPkgs.clay
          ];
        };
      };
    }