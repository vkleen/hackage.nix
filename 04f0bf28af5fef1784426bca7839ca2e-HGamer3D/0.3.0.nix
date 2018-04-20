{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.4";
        identifier = {
          name = "HGamer3D";
          version = "0.3.0";
        };
        license = "LicenseRef-OtherLicense";
        copyright = "";
        maintainer = "althainz@gmail.com";
        author = "Peter Althainz";
        homepage = "http://www.hgamer3d.org";
        url = "";
        synopsis = "A Game Engine for the Haskell Programmer";
        description = "HGamer3D is a game engine for developing 3D games in the programming\nlanguage Haskell. The game engine uses available libraries for 3D graphics,\nsound, input device handling, gui programming and other areas and make\nthose functions available for the Haskell programmer by providing\na Haskell API on top of that. HGamer3D is available on Windows and Linux.\nThis package is a wrapper for the main modules and does not contain additional\nfunctionality.";
        buildType = "Simple";
      };
      components = {
        HGamer3D = {
          depends  = [
            hsPkgs.base
            hsPkgs.HGamer3D-Data
            hsPkgs.HGamer3D-Audio
            hsPkgs.HGamer3D-Network
            hsPkgs.HGamer3D-InputSystem
            hsPkgs.HGamer3D-Graphics3D
            hsPkgs.HGamer3D-WinEvent
            hsPkgs.HGamer3D-GUI
          ];
        };
      };
    }