{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "0";
        identifier = {
          name = "hmarkup";
          version = "3000.0.0";
        };
        license = "BSD-3-Clause";
        copyright = "Bjorn Bringert 2006";
        maintainer = "bjorn@bringert.net";
        author = "Bjorn Bringert";
        homepage = "";
        url = "";
        synopsis = "Simple wikitext-like markup format implementation.";
        description = "This package implements a simple extensible wikitext-like markup format.\nCurrently the only implemented output format is XHTML.";
        buildType = "Custom";
      };
      components = {
        hmarkup = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
            hsPkgs.parsec
            hsPkgs.network
            hsPkgs.xhtml
          ];
        };
      };
    }