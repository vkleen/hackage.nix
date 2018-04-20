{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "pointed";
          version = "4.2";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (C) 2008-2013 Edward A. Kmett";
        maintainer = "Edward A. Kmett <ekmett@gmail.com>";
        author = "Edward A. Kmett";
        homepage = "http://github.com/ekmett/pointed/";
        url = "";
        synopsis = "Pointed and copointed data";
        description = "Pointed and copointed data";
        buildType = "Simple";
      };
      components = {
        pointed = {
          depends  = [
            hsPkgs.base
            hsPkgs.transformers
            hsPkgs.transformers-compat
            hsPkgs.containers
            hsPkgs.comonad
            hsPkgs.data-default-class
            hsPkgs.kan-extensions
            hsPkgs.semigroups
            hsPkgs.semigroupoids
            hsPkgs.stm
            hsPkgs.tagged
          ];
        };
      };
    }