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
      identifier = { name = "simple-logging"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "2017 Luka Horvat";
      maintainer = "luka.horvat9@gmail.com";
      author = "Luka Horvat";
      homepage = "https://gitlab.com/haskell-hr/logging";
      url = "";
      synopsis = "Logging effect to plug into the simple-effects framework";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."wreq" or (buildDepError "wreq"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."uuid" or (buildDepError "uuid"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."iso8601-time" or (buildDepError "iso8601-time"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."simple-effects" or (buildDepError "simple-effects"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."string-conv" or (buildDepError "string-conv"))
          (hsPkgs."MonadRandom" or (buildDepError "MonadRandom"))
          (hsPkgs."lens" or (buildDepError "lens"))
          ];
        buildable = true;
        };
      tests = {
        "logging-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."logging" or (buildDepError "logging"))
            (hsPkgs."simple-effects" or (buildDepError "simple-effects"))
            ];
          buildable = true;
          };
        };
      };
    }