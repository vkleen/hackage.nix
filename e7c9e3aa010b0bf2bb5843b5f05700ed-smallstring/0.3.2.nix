{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "smallstring";
          version = "0.3.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "aslatter@gmail.com";
        author = "Antoine Latter";
        homepage = "http://community.haskell.org/~aslatter/code/smallstring/";
        url = "";
        synopsis = "A Unicode text type, optimized for low memory overhead";
        description = "A Unicode text type, optimized for low memory overhead.\nNo string manipulation functions are offered.\n\nEquality and ordinal comparison aim to be competitive with\nthe Text type.";
        buildType = "Simple";
      };
      components = {
        smallstring = {
          depends  = [
            hsPkgs.base
            hsPkgs.utf8-string
            hsPkgs.smallarray
            hsPkgs.deepseq
            hsPkgs.bytestring
            hsPkgs.text
            hsPkgs.hashable
          ];
        };
      };
    }