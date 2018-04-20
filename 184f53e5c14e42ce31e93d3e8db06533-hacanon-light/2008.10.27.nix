{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "0";
        identifier = {
          name = "hacanon-light";
          version = "2008.10.27";
        };
        license = "BSD-3-Clause";
        copyright = "2004-2008, Lemmih";
        maintainer = "Lemmih (lemmih@gmail.com)";
        author = "Lemmih (lemmih@gmail.com)";
        homepage = "";
        url = "";
        synopsis = "Template Haskell framework for automatic FFI code generation.";
        description = "Combinatorial library for generating foreign bindings using TH.";
        buildType = "Simple";
      };
      components = {
        hacanon-light = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
            hsPkgs.template-haskell
          ];
        };
      };
    }