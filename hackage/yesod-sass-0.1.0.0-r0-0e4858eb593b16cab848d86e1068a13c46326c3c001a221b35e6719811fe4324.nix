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
      identifier = { name = "yesod-sass"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Felipe Garay";
      maintainer = "felipe.garay@usach.cl";
      author = "Felipe Garay";
      homepage = "";
      url = "";
      synopsis = "A simple quasiquoter to include sass code in yesod";
      description = "This is a simple quasiquoter to include sass code in yesod.\nYou can use wsass to create a widget in the same way as\nlucius.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."hsass" or (buildDepError "hsass"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
          (hsPkgs."yesod-core" or (buildDepError "yesod-core"))
          ];
        buildable = true;
        };
      };
    }