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
      specVersion = "1.18";
      identifier = { name = "weeder"; version = "0.1.7"; };
      license = "BSD-3-Clause";
      copyright = "Neil Mitchell 2017";
      maintainer = "Neil Mitchell <ndmitchell@gmail.com>";
      author = "Neil Mitchell <ndmitchell@gmail.com>";
      homepage = "https://github.com/ndmitchell/weeder#readme";
      url = "";
      synopsis = "Detect dead code";
      description = "Find redundant package dependencies or redundant module exports.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "weeder" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."foundation" or (buildDepError "foundation"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."extra" or (buildDepError "extra"))
            ];
          buildable = true;
          };
        };
      };
    }