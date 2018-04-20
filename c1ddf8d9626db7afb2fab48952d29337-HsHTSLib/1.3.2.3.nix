{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "HsHTSLib";
          version = "1.3.2.3";
        };
        license = "MIT";
        copyright = "(c) 2016-2018 Kai Zhang";
        maintainer = "kai@kzhang.org";
        author = "Kai Zhang";
        homepage = "";
        url = "";
        synopsis = "High level bindings to htslib.";
        description = "This package provides high level bindings to htslib, a library\nfor processing high throughput DNA sequencing data.";
        buildType = "Simple";
      };
      components = {
        HsHTSLib = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.bytestring-lexing
            hsPkgs.containers
            hsPkgs.conduit
            hsPkgs.inline-c
            hsPkgs.mtl
            hsPkgs.template-haskell
          ];
          libs = [ pkgs.pthread ];
        };
      };
    }