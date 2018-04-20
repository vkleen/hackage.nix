{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "unfoldable-restricted";
          version = "0.0.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Athan Clark <athan.clark@gmail.com>";
        author = "Athan Clark <athan.clark@gmail.com>";
        homepage = "";
        url = "";
        synopsis = "An alternative to the Unfoldable typeclass";
        description = "";
        buildType = "Simple";
      };
      components = {
        unfoldable-restricted = {
          depends  = [
            hsPkgs.base
            hsPkgs.constraints
            hsPkgs.containers
            hsPkgs.hashable
            hsPkgs.transformers
            hsPkgs.unfoldable
            hsPkgs.unit-constraint
            hsPkgs.unordered-containers
          ];
        };
      };
    }