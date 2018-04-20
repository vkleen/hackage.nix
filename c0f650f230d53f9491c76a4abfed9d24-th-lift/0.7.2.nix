{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.8";
        identifier = {
          name = "th-lift";
          version = "0.7.2";
        };
        license = "BSD-3-Clause";
        copyright = "© 2006 Ian Lynagh, © 2010-2014 Mathieu Boespflug";
        maintainer = "Mathieu Boespflug <mboes@tweag.net>";
        author = "Ian Lynagh";
        homepage = "http://github.com/mboes/th-lift";
        url = "";
        synopsis = "Derive Template Haskell's Lift class for datatypes.";
        description = "Derive Template Haskell's Lift class for datatypes.";
        buildType = "Simple";
      };
      components = {
        th-lift = {
          depends  = [
            hsPkgs.base
          ] ++ (if compiler.isGhc
            then [
              hsPkgs.packedstring
              hsPkgs.template-haskell
            ]
            else [
              hsPkgs.template-haskell
            ]);
        };
        tests = {
          test = {
            depends  = [
              hsPkgs.base
              hsPkgs.th-lift
            ] ++ (if compiler.isGhc
              then [
                hsPkgs.packedstring
                hsPkgs.template-haskell
              ]
              else [
                hsPkgs.template-haskell
              ]);
          };
        };
      };
    }