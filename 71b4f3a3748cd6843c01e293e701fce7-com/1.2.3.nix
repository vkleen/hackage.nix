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
          version = "1.2.3";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Sigbjorn Finne <sigbjorn.finne@gmail.com>";
        author = "";
        homepage = "";
        url = "";
        synopsis = "Haskell COM support library";
        description = "Supporting for writing COM\\/Automation clients in Haskell, and for\npackaging up your Haskell code behind a COM-callable veneer.\n\nSome examples of how to use the package can be found at <http://haskell.forkio.com/com-examples>";
        buildType = "Simple";
      };
      components = {
        com = {
          depends  = pkgs.lib.optionals system.isWindows ([
            hsPkgs.old-time
          ] ++ [ hsPkgs.base ]);
          libs = pkgs.lib.optionals system.isWindows [
            pkgs.kernel32
            pkgs.user32
            pkgs.ole32
            pkgs.oleaut32
            pkgs.advapi32
          ];
        };
      };
    }