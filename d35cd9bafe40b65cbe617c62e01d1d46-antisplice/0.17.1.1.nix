{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "antisplice";
          version = "0.17.1.1";
        };
        license = "AGPL-3.0-only";
        copyright = "";
        maintainer = "marvin.cohrs@gmx.net";
        author = "Marvin Cohrs";
        homepage = "http://doomanddarkness.eu/pub/antisplice";
        url = "";
        synopsis = "An engine for text-based dungeons.";
        description = "An engine for text-based dungeons.";
        buildType = "Simple";
      };
      components = {
        antisplice = {
          depends  = [
            hsPkgs.base
            hsPkgs.chatty
            hsPkgs.chatty-utils
            hsPkgs.text
            hsPkgs.template-haskell
            hsPkgs.mtl
            hsPkgs.transformers
            hsPkgs.haskeline
            hsPkgs.time
          ];
        };
      };
    }