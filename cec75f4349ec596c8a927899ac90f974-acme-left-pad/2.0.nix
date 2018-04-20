{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "acme-left-pad";
          version = "2.0";
        };
        license = "AGPL-3.0-only";
        copyright = "";
        maintainer = "headprogrammingczar@gmail.com";
        author = "JoeQuinn";
        homepage = "";
        url = "";
        synopsis = "free your haskell from the tyranny of npm!";
        description = "free your haskell from the tyranny of npm!";
        buildType = "Simple";
      };
      components = {
        acme-left-pad = {
          depends  = [
            hsPkgs.base
            hsPkgs.text
          ];
        };
      };
    }