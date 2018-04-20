{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.5";
        identifier = {
          name = "haskell-src-meta";
          version = "0.0.3";
        };
        license = "BSD-3-Clause";
        copyright = "(c) Matt Morrow";
        maintainer = "Matt Morrow <mjm2002@gmail.com>";
        author = "Matt Morrow";
        homepage = "";
        url = "";
        synopsis = "Parse source to template-haskell abstract syntax.";
        description = "The translation from haskell-src-exts abstract syntax\nto template-haskell abstract syntax isn't 100% complete yet.";
        buildType = "Simple";
      };
      components = {
        haskell-src-meta = {
          depends  = [
            hsPkgs.base
            hsPkgs.containers
            hsPkgs.haskell-src-exts
            hsPkgs.packedstring
            hsPkgs.template-haskell
            hsPkgs.syb
          ];
        };
      };
    }