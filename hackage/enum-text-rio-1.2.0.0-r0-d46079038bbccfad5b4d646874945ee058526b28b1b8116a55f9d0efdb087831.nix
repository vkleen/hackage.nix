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
      identifier = { name = "enum-text-rio"; version = "1.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2019 Chris Dornan";
      maintainer = "chris@chrisdornan.com";
      author = "Chris Dornan";
      homepage = "https://github.com/cdornan/enum-text-rio#readme";
      url = "";
      synopsis = "Making fmt available with rio";
      description = "Please see the README on GitHub at <https://github.com/cdornan/enum-text-rio#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."enum-text" or (buildDepError "enum-text"))
          (hsPkgs."fmt" or (buildDepError "fmt"))
          (hsPkgs."rio" or (buildDepError "rio"))
          (hsPkgs."text" or (buildDepError "text"))
          ];
        buildable = true;
        };
      exes = {
        "demo-enum-text-rio" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."enum-text" or (buildDepError "enum-text"))
            (hsPkgs."enum-text-rio" or (buildDepError "enum-text-rio"))
            (hsPkgs."fmt" or (buildDepError "fmt"))
            (hsPkgs."rio" or (buildDepError "rio"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }