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
      identifier = { name = "stack-run-auto"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "Copyright (c) 2015 Pedro Tacla Yamada";
      maintainer = "tacla.yamada@gmail.com";
      author = "Pedro Tacla Yamada";
      homepage = "http://github.com/yamadapc/stack-run-auto#readme";
      url = "";
      synopsis = "Initial project template from stack";
      description = "Please see README.md";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."lens-aeson" or (buildDepError "lens-aeson"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."wreq" or (buildDepError "wreq"))
          (hsPkgs."MissingH" or (buildDepError "MissingH"))
          (hsPkgs."stm-containers" or (buildDepError "stm-containers"))
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."extract-dependencies" or (buildDepError "extract-dependencies"))
          (hsPkgs."file-modules" or (buildDepError "file-modules"))
          ];
        buildable = true;
        };
      exes = {
        "module-package" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."lens-aeson" or (buildDepError "lens-aeson"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."wreq" or (buildDepError "wreq"))
            (hsPkgs."MissingH" or (buildDepError "MissingH"))
            (hsPkgs."stm-containers" or (buildDepError "stm-containers"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."extract-dependencies" or (buildDepError "extract-dependencies"))
            (hsPkgs."file-modules" or (buildDepError "file-modules"))
            (hsPkgs."stack-run-auto" or (buildDepError "stack-run-auto"))
            ];
          buildable = true;
          };
        "stack-run-auto" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."lens-aeson" or (buildDepError "lens-aeson"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."wreq" or (buildDepError "wreq"))
            (hsPkgs."MissingH" or (buildDepError "MissingH"))
            (hsPkgs."stm-containers" or (buildDepError "stm-containers"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."extract-dependencies" or (buildDepError "extract-dependencies"))
            (hsPkgs."file-modules" or (buildDepError "file-modules"))
            (hsPkgs."stack-run-auto" or (buildDepError "stack-run-auto"))
            ];
          buildable = true;
          };
        };
      tests = {
        "stack-run-auto-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."lens-aeson" or (buildDepError "lens-aeson"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."wreq" or (buildDepError "wreq"))
            (hsPkgs."MissingH" or (buildDepError "MissingH"))
            (hsPkgs."stm-containers" or (buildDepError "stm-containers"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."extract-dependencies" or (buildDepError "extract-dependencies"))
            (hsPkgs."file-modules" or (buildDepError "file-modules"))
            (hsPkgs."stack-run-auto" or (buildDepError "stack-run-auto"))
            ];
          buildable = true;
          };
        };
      };
    }