{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "jsaddle";
          version = "0.6.0.0";
        };
        license = "MIT";
        copyright = "";
        maintainer = "Hamish Mackenzie <Hamish.K.Mackenzie@googlemail.com>";
        author = "Hamish Mackenzie";
        homepage = "";
        url = "";
        synopsis = "Interface for JavaScript that works with GHCJS and GHC";
        description = "This package provides an EDSL for calling JavaScript that\ncan be used both from GHCJS and GHC.  When using GHC\nthe application is run using Warp and WebSockets to\ndrive a small JavaScipt helper.";
        buildType = "Simple";
      };
      components = {
        jsaddle = {
          depends  = [
            hsPkgs.base
            hsPkgs.lens
            hsPkgs.primitive
            hsPkgs.template-haskell
            hsPkgs.text
            hsPkgs.transformers
          ] ++ (if compiler.isGhcjs
            then [
              hsPkgs.ghcjs-base
              hsPkgs.ghcjs-prim
            ]
            else [
              hsPkgs.aeson
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.filepath
              hsPkgs.http-types
              hsPkgs.process
              hsPkgs.ref-tf
              hsPkgs.stm
              hsPkgs.time
            ]);
        };
      };
    }