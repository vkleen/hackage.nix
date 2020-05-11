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
      specVersion = "1.8";
      identifier = { name = "process-conduit"; version = "1.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2011-2013, Hideyuki Tanaka";
      maintainer = "Michael Snoyman";
      author = "Hideyuki Tanaka";
      homepage = "http://github.com/snoyberg/process-conduit";
      url = "";
      synopsis = "Conduits for processes (deprecated)";
      description = "This package is deprecated. Please use Data.Conduit.Process from wai-extra instead. The original code is maintained in Data.Conduit.ProcessOld for those wishing to use the older API.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."control-monad-loop" or (buildDepError "control-monad-loop"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."shakespeare-text" or (buildDepError "shakespeare-text"))
          (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
          ];
        buildable = true;
        };
      tests = {
        "process-conduit-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."conduit-extra" or (buildDepError "conduit-extra"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."process-conduit" or (buildDepError "process-conduit"))
            ];
          buildable = true;
          };
        };
      };
    }