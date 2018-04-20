{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "gtk-toggle-button-list";
          version = "0.0.0";
        };
        license = "GPL-3.0-only";
        copyright = "";
        maintainer = "Timothy Hobbs <timothyhobbs@seznam.cz>";
        author = "Timothy Hobbs";
        homepage = "http://github.com/timthelion/gtk-toggle-button-list";
        url = "";
        synopsis = "A simple custom form widget for gtk which allows single LOC creation/updating of toggle button lists.";
        description = "A simple custom form widget for gtk which allows single LOC creation/updating of toggle button lists.";
        buildType = "Simple";
      };
      components = {
        gtk-toggle-button-list = {
          depends  = [
            hsPkgs.gtk
            hsPkgs.base
          ];
        };
      };
    }