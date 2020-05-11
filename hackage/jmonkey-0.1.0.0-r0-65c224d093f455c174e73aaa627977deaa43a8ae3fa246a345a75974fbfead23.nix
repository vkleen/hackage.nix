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
      identifier = { name = "jmonkey"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "2018 peus";
      maintainer = "opyapeus@gmail.com";
      author = "peus";
      homepage = "https://github.com/opyapeus/jmonkey#readme";
      url = "";
      synopsis = "";
      description = "Please see the README on GitHub at <https://github.com/opyapeus/jmonkey#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."casing" or (buildDepError "casing"))
          (hsPkgs."free" or (buildDepError "free"))
          (hsPkgs."jmacro" or (buildDepError "jmacro"))
          ];
        buildable = true;
        };
      exes = {
        "jmonkey-example-exe" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."casing" or (buildDepError "casing"))
            (hsPkgs."clay" or (buildDepError "clay"))
            (hsPkgs."free" or (buildDepError "free"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."jmacro" or (buildDepError "jmacro"))
            (hsPkgs."jmonkey" or (buildDepError "jmonkey"))
            (hsPkgs."lucid" or (buildDepError "lucid"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."warp" or (buildDepError "warp"))
            ];
          buildable = true;
          };
        };
      tests = {
        "jmonkey-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."casing" or (buildDepError "casing"))
            (hsPkgs."free" or (buildDepError "free"))
            (hsPkgs."jmacro" or (buildDepError "jmacro"))
            (hsPkgs."jmonkey" or (buildDepError "jmonkey"))
            ];
          buildable = true;
          };
        };
      };
    }