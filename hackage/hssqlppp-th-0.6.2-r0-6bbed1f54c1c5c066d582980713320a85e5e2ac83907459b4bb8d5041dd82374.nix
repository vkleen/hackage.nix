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
      specVersion = "1.10";
      identifier = { name = "hssqlppp-th"; version = "0.6.2"; };
      license = "BSD-3-Clause";
      copyright = "Copyright 2009-2014 Jake Wheat";
      maintainer = "jakewheatmail@gmail.com";
      author = "Jake Wheat";
      homepage = "http://jakewheat.github.com/hssqlppp/";
      url = "";
      synopsis = "hssqlppp extras which need template-haskell";
      description = "hssqlppp extras which need template-haskell\n\nDocumentation, examples on the homepage:\n<http://jakewheat.github.com/hssqlppp/>.\n\nChanges here: <https://github.com/JakeWheat/hssqlppp/blob/master/CHANGES>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."hssqlppp" or (buildDepError "hssqlppp"))
          (hsPkgs."syb" or (buildDepError "syb"))
          (hsPkgs."text" or (buildDepError "text"))
          ];
        buildable = true;
        };
      tests = {
        "TestsTh" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."syb" or (buildDepError "syb"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."hssqlppp" or (buildDepError "hssqlppp"))
            ];
          buildable = true;
          };
        };
      };
    }