{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "either";
          version = "4.4.1";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright (C) 2008-2014 Edward A. Kmett";
        maintainer = "Edward A. Kmett <ekmett@gmail.com>";
        author = "Edward A. Kmett";
        homepage = "http://github.com/ekmett/either/";
        url = "";
        synopsis = "An either monad transformer";
        description = "An either monad transformer";
        buildType = "Simple";
      };
      components = {
        either = {
          depends  = [
            hsPkgs.base
            hsPkgs.bifunctors
            hsPkgs.exceptions
            hsPkgs.free
            hsPkgs.monad-control
            hsPkgs.MonadRandom
            hsPkgs.mtl
            hsPkgs.mmorph
            hsPkgs.profunctors
            hsPkgs.semigroups
            hsPkgs.semigroupoids
            hsPkgs.transformers
            hsPkgs.transformers-base
          ];
        };
      };
    }