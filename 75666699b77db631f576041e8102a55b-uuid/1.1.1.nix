{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "uuid";
          version = "1.1.1";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2008 Antoine Latter";
        maintainer = "aslatter@gmail.com";
        author = "Antoine Latter";
        homepage = "http://community.haskell.org/~aslatter/code/uuid/";
        url = "";
        synopsis = "For creating, comparing, parsing and printing Universally Unique Identifiers";
        description = "This library is useful for creating, comparing, parsing and\nprinting Universally Unique Identifiers.\nSee <http://en.wikipedia.org/wiki/UUID> for the general idea.";
        buildType = "Simple";
      };
      components = {
        uuid = {
          depends  = [
            hsPkgs.random
            hsPkgs.binary
            hsPkgs.bytestring
            hsPkgs.Crypto
            hsPkgs.maccatcher
            hsPkgs.time
            hsPkgs.base
            hsPkgs.base
          ];
        };
      };
    }