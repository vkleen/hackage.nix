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
      identifier = { name = "sgd"; version = "0.8.0.3"; };
      license = "BSD-3-Clause";
      copyright = "2012-2019 Jakub Waszczuk";
      maintainer = "waszczuk.kuba@gmail.com";
      author = "Jakub Waszczuk";
      homepage = "https://github.com/kawu/sgd#readme";
      url = "";
      synopsis = "Stochastic gradient descent library";
      description = "Import \"Numeric.SGD\" to use the library.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
          (hsPkgs."logfloat" or (buildDepError "logfloat"))
          (hsPkgs."monad-par" or (buildDepError "monad-par"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."parallel" or (buildDepError "parallel"))
          (hsPkgs."pipes" or (buildDepError "pipes"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."random-shuffle" or (buildDepError "random-shuffle"))
          (hsPkgs."temporary" or (buildDepError "temporary"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ];
        buildable = true;
        };
      tests = {
        "vine-test" = {
          depends = [
            (hsPkgs."ad" or (buildDepError "ad"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
            (hsPkgs."logfloat" or (buildDepError "logfloat"))
            (hsPkgs."monad-par" or (buildDepError "monad-par"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."parallel" or (buildDepError "parallel"))
            (hsPkgs."pipes" or (buildDepError "pipes"))
            (hsPkgs."primitive" or (buildDepError "primitive"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."random-shuffle" or (buildDepError "random-shuffle"))
            (hsPkgs."sgd" or (buildDepError "sgd"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      };
    }