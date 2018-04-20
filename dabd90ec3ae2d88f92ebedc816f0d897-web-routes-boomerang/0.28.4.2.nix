{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "web-routes-boomerang";
          version = "0.28.4.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "partners@seereason.com";
        author = "jeremy@seereason.com";
        homepage = "";
        url = "";
        synopsis = "Use boomerang for type-safe URL parsers/printers";
        description = "This module add support for creating url parsers/printers using a single unified grammar specification";
        buildType = "Simple";
      };
      components = {
        web-routes-boomerang = {
          depends  = [
            hsPkgs.base
            hsPkgs.boomerang
            hsPkgs.mtl
            hsPkgs.parsec
            hsPkgs.text
            hsPkgs.web-routes
          ];
        };
      };
    }