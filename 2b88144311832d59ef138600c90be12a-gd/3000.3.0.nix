{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "0";
        identifier = {
          name = "gd";
          version = "3000.3.0";
        };
        license = "BSD-3-Clause";
        copyright = "Bjorn Bringert";
        maintainer = "bjorn@bringert.net";
        author = "Bjorn Bringert";
        homepage = "";
        url = "";
        synopsis = "A Haskell binding to a subset of the GD graphics library";
        description = "This is a binding to a (currently very small) subset of\nthe GD graphics library.";
        buildType = "Custom";
      };
      components = {
        gd = {
          depends  = [ hsPkgs.base ];
          libs = [
            pkgs.gd
            pkgs.png
            pkgs.z
            pkgs.jpeg
            pkgs.m
            pkgs.fontconfig
            pkgs.freetype
            pkgs.pthread
            pkgs.expat
          ];
        };
      };
    }