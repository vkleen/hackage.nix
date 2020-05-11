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
      specVersion = "2.2";
      identifier = { name = "hasktorch-signatures"; version = "0.0.1.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Sam Stites <fnz@fgvgrf.vb>, Austin Huang <nhfgvau@nyhz.zvg.rqh> - cipher:ROT13";
      author = "Hasktorch dev team";
      homepage = "https://github.com/hasktorch/hasktorch#readme";
      url = "";
      synopsis = "Backpack signatures for Tensor operations";
      description = "Backpack signature files to glue FFI backends to Hasktorch";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."hasktorch-types-th" or (buildDepError "hasktorch-types-th"))
          (hsPkgs."hasktorch-types-thc" or (buildDepError "hasktorch-types-thc"))
          (hsPkgs."hasktorch-signatures-types" or (buildDepError "hasktorch-signatures-types"))
          ];
        buildable = true;
        };
      sublibs = {
        "hasktorch-partial-floating" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hasktorch-signatures-partial" or (buildDepError "hasktorch-signatures-partial"))
            (hsPkgs."hasktorch-signatures-support" or (buildDepError "hasktorch-signatures-support"))
            (hsPkgs."hasktorch-signatures" or (buildDepError "hasktorch-signatures"))
            ];
          buildable = true;
          };
        "hasktorch-partial-signed" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hasktorch-signatures-partial" or (buildDepError "hasktorch-signatures-partial"))
            (hsPkgs."hasktorch-signatures-support" or (buildDepError "hasktorch-signatures-support"))
            (hsPkgs."hasktorch-signatures" or (buildDepError "hasktorch-signatures"))
            ];
          buildable = true;
          };
        "hasktorch-partial-unsigned" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hasktorch-signatures-partial" or (buildDepError "hasktorch-signatures-partial"))
            (hsPkgs."hasktorch-signatures-support" or (buildDepError "hasktorch-signatures-support"))
            (hsPkgs."hasktorch-signatures" or (buildDepError "hasktorch-signatures"))
            ];
          buildable = true;
          };
        };
      exes = {
        "isdefinite-unsigned-th" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hasktorch-ffi-th" or (buildDepError "hasktorch-ffi-th"))
            (hsPkgs."hasktorch-types-th" or (buildDepError "hasktorch-types-th"))
            (hsPkgs."hasktorch-partial-unsigned" or (buildDepError "hasktorch-partial-unsigned"))
            ];
          buildable = true;
          };
        "isdefinite-unsigned-thc" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hasktorch-ffi-thc" or (buildDepError "hasktorch-ffi-thc"))
            (hsPkgs."hasktorch-types-thc" or (buildDepError "hasktorch-types-thc"))
            (hsPkgs."hasktorch-partial-unsigned" or (buildDepError "hasktorch-partial-unsigned"))
            ];
          buildable = true;
          };
        "isdefinite-signed-th" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hasktorch-ffi-th" or (buildDepError "hasktorch-ffi-th"))
            (hsPkgs."hasktorch-types-th" or (buildDepError "hasktorch-types-th"))
            (hsPkgs."hasktorch-partial-signed" or (buildDepError "hasktorch-partial-signed"))
            ];
          buildable = true;
          };
        "isdefinite-signed-thc" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hasktorch-ffi-thc" or (buildDepError "hasktorch-ffi-thc"))
            (hsPkgs."hasktorch-types-thc" or (buildDepError "hasktorch-types-thc"))
            (hsPkgs."hasktorch-partial-signed" or (buildDepError "hasktorch-partial-signed"))
            ];
          buildable = true;
          };
        "isdefinite-floating-th" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hasktorch-ffi-th" or (buildDepError "hasktorch-ffi-th"))
            (hsPkgs."hasktorch-types-th" or (buildDepError "hasktorch-types-th"))
            (hsPkgs."hasktorch-partial-floating" or (buildDepError "hasktorch-partial-floating"))
            ];
          buildable = true;
          };
        "isdefinite-floating-thc" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hasktorch-ffi-thc" or (buildDepError "hasktorch-ffi-thc"))
            (hsPkgs."hasktorch-types-thc" or (buildDepError "hasktorch-types-thc"))
            (hsPkgs."hasktorch-partial-floating" or (buildDepError "hasktorch-partial-floating"))
            ];
          buildable = true;
          };
        };
      };
    }