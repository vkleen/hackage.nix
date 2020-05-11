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
      identifier = { name = "plur"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2018-2019 Joel Burget";
      maintainer = "joelburget@gmail.com";
      author = "Joel Burget";
      homepage = "";
      url = "";
      synopsis = "Plurality monad: Zero, one, or at least two.";
      description = "Often when counting you don't need an exact count, but only whether there are\ntwo things. Two examples:\n\nWhen searching for inhabitants of a type (implementations of a program), you\nwant to be able to tell whether there are (a) no possible inhabitants, (b) a\nunique inhabitant, or (c) multiple inhabitants.\n\nWhen displaying the name of a variable, if there's exactly one variable of a\ngiven name (\"a\") you can just use that name, but if there are multiples you\nmight use a unique id to disambiguate them (\"a1\" vs \"a2\").";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          ];
        buildable = true;
        };
      tests = {
        "Properties" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."plur" or (buildDepError "plur"))
            (hsPkgs."hedgehog" or (buildDepError "hedgehog"))
            (hsPkgs."hedgehog-classes" or (buildDepError "hedgehog-classes"))
            ];
          buildable = true;
          };
        };
      };
    }