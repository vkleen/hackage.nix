{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "regexp-tries";
          version = "0.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Andreas Baldeau <andreas@baldeau.net>";
        author = "Andreas Baldeau";
        homepage = "http://github.com/baldo/regexp-tries";
        url = "";
        synopsis = "Regular Expressions on Tries.";
        description = "Regular Expressions on Tries.";
        buildType = "Simple";
      };
      components = {
        regexp-tries = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.derive-trie
            hsPkgs.template-haskell
            hsPkgs.weighted-regexp
          ];
        };
      };
    }