{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "hmatrix-repa";
          version = "0.1.2.2";
        };
        license = "BSD-3-Clause";
        copyright = "(c) A.V.H. McPhail 2011, 2015";
        maintainer = "haskell.vivian.mcphail <at> gmail <dot> com";
        author = "Vivian McPhail";
        homepage = "http://code.haskell.org/hmatrix-repa";
        url = "";
        synopsis = "Adaptors for interoperability between hmatrix and repa";
        description = "Adaptors for interoperability between hmatrix and repa";
        buildType = "Simple";
      };
      components = {
        hmatrix-repa = {
          depends  = [
            hsPkgs.base
            hsPkgs.vector
            hsPkgs.hmatrix
            hsPkgs.repa
          ];
        };
      };
    }