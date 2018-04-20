{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.2";
        identifier = {
          name = "lambdacube-examples";
          version = "0.2.2";
        };
        license = "BSD-3-Clause";
        copyright = "(c) 2009-2011, Csaba Hruska";
        maintainer = "csaba (dot) hruska (at) gmail (dot) com";
        author = "Csaba Hruska, Gergely Patai";
        homepage = "http://www.haskell.org/haskellwiki/LambdaCubeEngine";
        url = "";
        synopsis = "Examples for LambdaCube";
        description = "Examples for LambdaCube";
        buildType = "Simple";
      };
      components = {
        exes = {
          lambdacube-basic = {
            depends  = [
              hsPkgs.base
              hsPkgs.mtl
              hsPkgs.lambdacube-engine
              hsPkgs.elerea
              hsPkgs.GLFW-b
            ];
          };
          lambdacube-cameratrack = {
            depends  = [
              hsPkgs.base
              hsPkgs.lambdacube-engine
              hsPkgs.elerea
              hsPkgs.GLFW-b
            ];
          };
        };
      };
    }