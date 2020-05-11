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
      identifier = { name = "gameclock"; version = "1.0"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "quuxman@gmail.com";
      author = "Abram Clark <quuxman@gmail.com>";
      homepage = "";
      url = "";
      synopsis = "Game clock that shows two analog clock faces";
      description = "A game clock with optional Fischer time, two clock face styles, and other options";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hsclock" = {
          depends = [
            (hsPkgs."cairo" or (buildDepError "cairo"))
            (hsPkgs."gtk" or (buildDepError "gtk"))
            (hsPkgs."glib" or (buildDepError "glib"))
            ] ++ (if flags.small_base
            then [
              (hsPkgs."base" or (buildDepError "base"))
              (hsPkgs."old-time" or (buildDepError "old-time"))
              ]
            else [ (hsPkgs."base" or (buildDepError "base")) ]);
          buildable = true;
          };
        };
      };
    }