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
      specVersion = "1.12";
      identifier = { name = "getopt-generics"; version = "0.13.0.4"; };
      license = "BSD-3-Clause";
      copyright = "Zalora South East Asia Pte Ltd";
      maintainer = "linh.nguyen@zalora.com, soenkehahn@gmail.com";
      author = "Linh Nguyen, Sönke Hahn";
      homepage = "https://github.com/soenkehahn/getopt-generics#readme";
      url = "";
      synopsis = "Create command line interfaces with ease";
      description = "Create command line interfaces with ease";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base-compat" or (buildDepError "base-compat"))
          (hsPkgs."base-orphans" or (buildDepError "base-orphans"))
          (hsPkgs."generics-sop" or (buildDepError "generics-sop"))
          (hsPkgs."tagged" or (buildDepError "tagged"))
          ];
        buildable = true;
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base-compat" or (buildDepError "base-compat"))
            (hsPkgs."base-orphans" or (buildDepError "base-orphans"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."generics-sop" or (buildDepError "generics-sop"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."safe" or (buildDepError "safe"))
            (hsPkgs."silently" or (buildDepError "silently"))
            (hsPkgs."tagged" or (buildDepError "tagged"))
            ];
          buildable = true;
          };
        };
      };
    }