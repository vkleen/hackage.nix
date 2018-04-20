{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "moe";
          version = "2015.5.4";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Jinjing Wang <nfjinjing@gmail.com>";
        author = "Jinjing Wang";
        homepage = "https://github.com/nfjinjing/moe";
        url = "";
        synopsis = "html with style";
        description = "a purely functional html combinator with a clean syntax";
        buildType = "Simple";
      };
      components = {
        moe = {
          depends  = [
            hsPkgs.base
            hsPkgs.mtl
            hsPkgs.air
            hsPkgs.data-default
            hsPkgs.bytestring
            hsPkgs.dlist
            hsPkgs.text
          ];
        };
      };
    }