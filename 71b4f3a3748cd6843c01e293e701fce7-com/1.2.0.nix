{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      old-base = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "com";
          version = "1.2.0";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Sigbjorn Finne <sigbjorn.finne@gmail.com>";
        author = "";
        homepage = "";
        url = "";
        synopsis = "Haskell COM support library";
        description = "COM + Automation libraries for Haskell.";
        buildType = "Simple";
      };
      components = {
        com = {
          depends  = [
            hsPkgs.haskell98
            hsPkgs.old-time
          ] ++ [ hsPkgs.base ];
          libs = [
            pkgs.kernel32
            pkgs.user32
            pkgs.ole32
            pkgs.oleaut32
            pkgs.advapi32
          ];
        };
      };
    }