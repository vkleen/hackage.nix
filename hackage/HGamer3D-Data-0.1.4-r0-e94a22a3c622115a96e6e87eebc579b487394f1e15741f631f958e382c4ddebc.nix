let
  buildDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (build dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  sysDepError = pkg:
    builtins.throw ''
      The Nixpkgs package set does not contain the package: ${pkg} (system dependency).
      
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      '';
  pkgConfDepError = pkg:
    builtins.throw ''
      The pkg-conf packages does not contain the package: ${pkg} (pkg-conf dependency).
      
      You may need to augment the pkg-conf package mapping in haskell.nix so that it can be found.
      '';
  exeDepError = pkg:
    builtins.throw ''
      The local executable components do not include the component: ${pkg} (executable dependency).
      '';
  legacyExeDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (executable dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  buildToolDepError = pkg:
    builtins.throw ''
      Neither the Haskell package set or the Nixpkgs package set contain the package: ${pkg} (build tool dependency).
      
      If this is a system dependency:
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      
      If this is a Haskell dependency:
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
in { system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, config, ... }:
  {
    flags = {};
    package = {
      specVersion = "1.2";
      identifier = { name = "HGamer3D-Data"; version = "0.1.4"; };
      license = "LicenseRef-OtherLicense";
      copyright = "";
      maintainer = "althainz@googlemail.com";
      author = "Dr. Peter Althainz";
      homepage = "http://www.althainz.de/HGamer3D.html";
      url = "";
      synopsis = "Library to enable 3D game development for Haskell - Data";
      description = "Library, to enable 3D game development for Haskell,\nbased on bindings to 3D Graphics, pyhsics engine and additional libraries.\nCurrent implementation contains the following features:\nOGRE Binding, OIS Binding (limited functionality)\nPlatform: Windows only\nInstall following packages in sequence: HGamer3D-Data, HGamer3D-Ogre-Binding, HGamer3D-OIS-Binding, HGamer3D-API\nLicense: Apache License, Version 2.0\nThis part contains different Data types of the HGamer3D API";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."Vec" or (buildDepError "Vec"))
          (hsPkgs."Vec-Transform" or (buildDepError "Vec-Transform"))
          (hsPkgs."haskell98" or (buildDepError "haskell98"))
          ];
        libs = [ (pkgs."stdc++.dll" or (sysDepError "stdc++.dll")) ];
        buildable = true;
        };
      };
    }