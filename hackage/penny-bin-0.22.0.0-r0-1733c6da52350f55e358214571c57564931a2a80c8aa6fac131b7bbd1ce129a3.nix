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
    flags = {
      debug = false;
      build-penny = true;
      build-selloff = true;
      build-diff = true;
      build-reprint = true;
      build-reconcile = true;
      };
    package = {
      specVersion = "1.8";
      identifier = { name = "penny-bin"; version = "0.22.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2012-2013 Omari Norman";
      maintainer = "omari@smileystation.com";
      author = "Omari Norman";
      homepage = "http://www.github.com/massysett/penny";
      url = "";
      synopsis = "Deprecated - use penny package instead";
      description = "This package is now deprecated.  Use the penny package instead.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "penny" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."penny-lib" or (buildDepError "penny-lib"))
            ];
          buildable = if !flags.build-penny then false else true;
          };
        "penny-selloff" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."penny-lib" or (buildDepError "penny-lib"))
            (hsPkgs."explicit-exception" or (buildDepError "explicit-exception"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."semigroups" or (buildDepError "semigroups"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."multiarg" or (buildDepError "multiarg"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            ];
          buildable = if !flags.build-selloff then false else true;
          };
        "penny-diff" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."penny-lib" or (buildDepError "penny-lib"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."multiarg" or (buildDepError "multiarg"))
            (hsPkgs."explicit-exception" or (buildDepError "explicit-exception"))
            ];
          buildable = if !flags.build-diff then false else true;
          };
        "penny-reprint" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."multiarg" or (buildDepError "multiarg"))
            (hsPkgs."penny-lib" or (buildDepError "penny-lib"))
            (hsPkgs."pretty-show" or (buildDepError "pretty-show"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = if !flags.build-reprint then false else true;
          };
        "penny-reconcile" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."penny-lib" or (buildDepError "penny-lib"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."multiarg" or (buildDepError "multiarg"))
            (hsPkgs."explicit-exception" or (buildDepError "explicit-exception"))
            ];
          buildable = if !flags.build-reconcile then false else true;
          };
        };
      };
    }