{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "HFuse";
          version = "0.2.2";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Taru Karttunen <taruti@taruti.net>";
        author = "Jeremy Bobbio";
        homepage = "http://code.haskell.org/hfuse";
        url = "";
        synopsis = "HFuse is a binding for the Linux FUSE library.";
        description = "";
        buildType = "Simple";
      };
      components = {
        HFuse = {
          depends  = [
            hsPkgs.base
            hsPkgs.unix
            hsPkgs.bytestring
          ];
          libs = [ pkgs.fuse ];
        };
      };
    }