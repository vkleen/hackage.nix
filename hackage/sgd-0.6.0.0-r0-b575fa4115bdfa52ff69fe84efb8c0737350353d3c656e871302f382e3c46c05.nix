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
      specVersion = "1.6";
      identifier = { name = "sgd"; version = "0.6.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2012-2019 Jakub Waszczuk";
      maintainer = "waszczuk.kuba@gmail.com";
      author = "Jakub Waszczuk";
      homepage = "https://github.com/kawu/sgd";
      url = "";
      synopsis = "Stochastic gradient descent";
      description = "Stochastic gradient descent library.\n\nImport \"Numeric.SGD\" to use the library.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."pipes" or (buildDepError "pipes"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."logfloat" or (buildDepError "logfloat"))
          (hsPkgs."monad-par" or (buildDepError "monad-par"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."temporary" or (buildDepError "temporary"))
          (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          ];
        buildable = true;
        };
      };
    }