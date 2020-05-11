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
    flags = { pure = false; };
    package = {
      specVersion = "1.6";
      identifier = { name = "flite"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Jason Reich <jason@cs.york.ac.uk>, Matthew Naylor <mfn@cs.york.ac.uk>";
      author = "Matthew Naylor";
      homepage = "http://www.cs.york.ac.uk/fp/reduceron/";
      url = "";
      synopsis = "f-lite compiler, interpreter and libraries";
      description = "The f-lite language is a subset of Haskell 98 and Clean consisting of function\ndefinitions, pattern matching, limited let expressions, function applications and\nconstructor applications expressed in the explicit 'braces' layout-insensitive format.\nSee README for more information.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."haskell98" or (buildDepError "haskell98"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          ];
        buildable = true;
        };
      exes = {
        "flite-pure" = {
          depends = (pkgs.lib).optionals (flags.pure) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."haskell98" or (buildDepError "haskell98"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."containers" or (buildDepError "containers"))
            ];
          buildable = if flags.pure then true else false;
          };
        "flite" = {
          depends = (pkgs.lib).optionals (!flags.pure) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."haskell98" or (buildDepError "haskell98"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            ];
          buildable = if flags.pure then false else true;
          };
        };
      };
    }