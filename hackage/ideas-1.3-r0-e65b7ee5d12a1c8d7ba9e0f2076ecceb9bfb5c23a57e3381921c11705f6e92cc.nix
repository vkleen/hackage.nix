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
      specVersion = "1.8.0.2";
      identifier = { name = "ideas"; version = "1.3"; };
      license = "LicenseRef-GPL";
      copyright = "(c) 2015";
      maintainer = "bastiaan.heeren@ou.nl";
      author = "Bastiaan Heeren, Alex Gerdes, Johan Jeuring";
      homepage = "http://ideas.cs.uu.nl/www/";
      url = "";
      synopsis = "Feedback services for intelligent tutoring systems";
      description = "ideas provides feedback services to intelligent tutoring systems such as\nthe digital mathematical environment of the Freudenthal Institute, MathDox,\nand Activemath.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."Diff" or (buildDepError "Diff"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."uniplate" or (buildDepError "uniplate"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."wl-pprint" or (buildDepError "wl-pprint"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."multipart" or (buildDepError "multipart"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."old-time" or (buildDepError "old-time"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."xhtml" or (buildDepError "xhtml"))
          ];
        buildable = true;
        };
      };
    }