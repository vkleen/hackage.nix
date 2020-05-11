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
      identifier = { name = "logging-effect-extra-file"; version = "2.0.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "Jason Shipman";
      author = "Jason Shipman";
      homepage = "https://github.com/jship/logging-effect-extra#readme";
      url = "";
      synopsis = "TH splices to augment log messages with file info";
      description = "TH splices to augment log messages with file info.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."logging-effect" or (buildDepError "logging-effect"))
          (hsPkgs."prettyprinter" or (buildDepError "prettyprinter"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          ];
        buildable = true;
        };
      exes = {
        "log-file" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."logging-effect" or (buildDepError "logging-effect"))
            (hsPkgs."logging-effect-extra-file" or (buildDepError "logging-effect-extra-file"))
            (hsPkgs."prettyprinter" or (buildDepError "prettyprinter"))
            ];
          buildable = true;
          };
        "log-file-and-severity" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."logging-effect" or (buildDepError "logging-effect"))
            (hsPkgs."logging-effect-extra-file" or (buildDepError "logging-effect-extra-file"))
            (hsPkgs."prettyprinter" or (buildDepError "prettyprinter"))
            ];
          buildable = true;
          };
        };
      };
    }