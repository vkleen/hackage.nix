{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      unsafe = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2.0";
        identifier = {
          name = "judy";
          version = "0.2.2";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2008, Don Stewart <dons@galois.com>";
        maintainer = "Don Stewart <dons@galois.com>";
        author = "Don Stewart";
        homepage = "http://code.haskell.org/~dons/code/judy";
        url = "";
        synopsis = "Fast, scalable, mutable dynamic arrays, maps and hashes";
        description = "Fast, scalable, mutable dynamic arrays, maps and hashes";
        buildType = "Simple";
      };
      components = {
        judy = {
          depends  = [
            hsPkgs.base
            hsPkgs.ghc-prim
            hsPkgs.bytestring
          ];
          libs = [ pkgs.Judy ];
        };
      };
    }