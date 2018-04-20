{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      gtk3 = true;
      jsffi = true;
      webkit = false;
      jmacro = true;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "jsaddle";
          version = "0.1.1.3";
        };
        license = "MIT";
        copyright = "";
        maintainer = "Hamish Mackenzie <Hamish.K.Mackenzie@googlemail.com>";
        author = "Hamish Mackenzie";
        homepage = "";
        url = "";
        synopsis = "High level interface for webkit-javascriptcore";
        description = "This package provides an EDSL for calling JavaScript code using\nthe JavaScriptCore engine and low level Haskell bindings\nin the webkit-javascriptcore library <https://github.com/ghcjs/webkit-javascriptcore>.";
        buildType = "Simple";
      };
      components = {
        jsaddle = {
          depends  = ([
            hsPkgs.template-haskell
            hsPkgs.base
            hsPkgs.lens
            hsPkgs.text
            hsPkgs.transformers
          ] ++ (if compiler.isGhc && _flags.gtk3
            then [
              hsPkgs.webkitgtk3
              hsPkgs.webkitgtk3-javascriptcore
            ]
            else [
              hsPkgs.webkit
              hsPkgs.webkit-javascriptcore
            ])) ++ pkgs.lib.optional _flags.jmacro hsPkgs.jmacro;
        };
        tests = {
          test-tool = {
            depends  = ([
              hsPkgs.template-haskell
              hsPkgs.base
              hsPkgs.lens
              hsPkgs.text
              hsPkgs.transformers
              hsPkgs.hslogger
              hsPkgs.jsaddle
            ] ++ pkgs.lib.optionals compiler.isGhc ([
              hsPkgs.glib
            ] ++ (if _flags.gtk3
              then [
                hsPkgs.gtk3
                hsPkgs.webkitgtk3
                hsPkgs.webkitgtk3-javascriptcore
              ]
              else [
                hsPkgs.gtk
                hsPkgs.webkit
                hsPkgs.webkit-javascriptcore
              ]))) ++ pkgs.lib.optional _flags.jmacro hsPkgs.jmacro;
          };
        };
      };
    }