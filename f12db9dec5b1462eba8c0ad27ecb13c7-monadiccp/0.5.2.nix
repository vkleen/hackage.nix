{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "0";
        identifier = {
          name = "monadiccp";
          version = "0.5.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "tom.schrijvers@cs.kuleuven.be";
        author = "Tom Schrijvers";
        homepage = "http://www.cs.kuleuven.be/~toms/Haskell/";
        url = "";
        synopsis = "Constraint Programming";
        description = "Monadic Constraint Programming framework";
        buildType = "Simple";
      };
      components = {
        monadiccp = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.mtl
            hsPkgs.haskell98
            hsPkgs.random
          ];
        };
      };
    }