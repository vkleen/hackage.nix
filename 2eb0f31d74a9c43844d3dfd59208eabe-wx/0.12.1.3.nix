{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "wx";
          version = "0.12.1.3";
        };
        license = "LicenseRef-LGPL";
        copyright = "";
        maintainer = "wxhaskell-devel@lists.sourceforge.net";
        author = "Daan Leijen";
        homepage = "http://haskell.org/haskellwiki/WxHaskell";
        url = "";
        synopsis = "wxHaskell";
        description = "wxHaskell is a portable and native GUI library for Haskell.  It is built on top of wxWidgets - a comprehensive C++ library that is portable across all major GUI platforms; including GTK, Windows, X11, and MacOS X.  This version works with wxWidgets 2.8 only.";
        buildType = "Simple";
      };
      components = {
        wx = {
          depends  = [
            hsPkgs.base
            hsPkgs.wxcore
            hsPkgs.stm
          ];
        };
      };
    }