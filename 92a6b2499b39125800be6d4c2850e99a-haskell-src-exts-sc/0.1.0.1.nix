{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      build-example = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "haskell-src-exts-sc";
          version = "0.1.0.1";
        };
        license = "BSD-3-Clause";
        copyright = "Copyright: (c) 2017 Artem Chirkin";
        maintainer = "chirkin@arch.ethz.ch";
        author = "Artem Chirkin";
        homepage = "https://github.com/achirkin/haskell-src-exts-sc#readme";
        url = "";
        synopsis = "Pretty print haskell code with comments";
        description = "Generate code from haskell-src-exts AST.\nTo do it, I pretty print and parse AST, then adjust it to insert comments.";
        buildType = "Simple";
      };
      components = {
        haskell-src-exts-sc = {
          depends  = [
            hsPkgs.base
            hsPkgs.haskell-src-exts
          ];
        };
        exes = {
          sc-example = {
            depends  = [
              hsPkgs.base
              hsPkgs.haskell-src-exts
              hsPkgs.haskell-src-exts-sc
            ];
          };
        };
      };
    }