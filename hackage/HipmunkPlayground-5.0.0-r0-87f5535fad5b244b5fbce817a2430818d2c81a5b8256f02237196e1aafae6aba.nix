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
    flags = { small_base = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "HipmunkPlayground"; version = "5.0.0"; };
      license = "LicenseRef-OtherLicense";
      copyright = "(c) 2008 Felipe A. Lessa";
      maintainer = "Felipe A. Lessa <felipe.lessa@gmail.com>";
      author = "Felipe A. Lessa <felipe.lessa@gmail.com>";
      homepage = "";
      url = "";
      synopsis = "A playground for testing Hipmunk.";
      description = "This is a simple OpenGL program that allows you to see\nsome of Hipmunk's functions in action.\n\nNew in version 5.0.0:\n\n* Updated for Hipmunk 5.0.0. Yay!\n\n* Add a small car using @SimpleMotor@ (not the best way\nof creating a car, but it works a demo).\n\nLicensed under the MIT license (like Hipmunk itself).";
      buildType = "Simple";
      };
    components = {
      exes = {
        "HipmunkPlayground" = {
          depends = if flags.small_base
            then [
              (hsPkgs."base" or (buildDepError "base"))
              (hsPkgs."containers" or (buildDepError "containers"))
              (hsPkgs."Hipmunk" or (buildDepError "Hipmunk"))
              (hsPkgs."OpenGL" or (buildDepError "OpenGL"))
              (hsPkgs."GLFW" or (buildDepError "GLFW"))
              ]
            else [
              (hsPkgs."base" or (buildDepError "base"))
              (hsPkgs."Hipmunk" or (buildDepError "Hipmunk"))
              (hsPkgs."OpenGL" or (buildDepError "OpenGL"))
              (hsPkgs."GLFW" or (buildDepError "GLFW"))
              ];
          buildable = true;
          };
        };
      };
    }