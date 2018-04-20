{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.22.5";
        identifier = {
          name = "hylolib";
          version = "1.5.3";
        };
        license = "LicenseRef-GPL";
        copyright = "";
        maintainer = "guillaumh@gmail.com";
        author = "Daniel Gorin";
        homepage = "";
        url = "";
        synopsis = "Tools for hybrid logics related programs";
        description = "";
        buildType = "Simple";
      };
      components = {
        hylolib = {
          depends  = [
            hsPkgs.base
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.array
            hsPkgs.mtl
            hsPkgs.mtl
            hsPkgs.pretty
            hsPkgs.pretty
            hsPkgs.random
            hsPkgs.random
            hsPkgs.uniplate
            hsPkgs.uniplate
          ];
        };
      };
    }