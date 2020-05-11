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
      identifier = { name = "duplo"; version = "1.6.18"; };
      license = "MIT";
      copyright = "";
      maintainer = "ken@pixbi.com";
      author = "Kenneth Kan";
      homepage = "";
      url = "";
      synopsis = "Frontend development build tool";
      description = "Intuitive, simple building blocks for building composable, completely self-managed web applications";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."aeson-pretty" or (buildDepError "aeson-pretty"))
          (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."executable-path" or (buildDepError "executable-path"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."filepather" or (buildDepError "filepather"))
          (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."language-javascript" or (buildDepError "language-javascript"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
          (hsPkgs."scotty" or (buildDepError "scotty"))
          (hsPkgs."shake" or (buildDepError "shake"))
          (hsPkgs."system-fileio" or (buildDepError "system-fileio"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."text-format" or (buildDepError "text-format"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."warp" or (buildDepError "warp"))
          (hsPkgs."MissingH" or (buildDepError "MissingH"))
          ];
        buildable = true;
        };
      exes = {
        "duplo" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."aeson-pretty" or (buildDepError "aeson-pretty"))
            (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
            (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."duplo" or (buildDepError "duplo"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."filepather" or (buildDepError "filepather"))
            (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."language-javascript" or (buildDepError "language-javascript"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."scotty" or (buildDepError "scotty"))
            (hsPkgs."shake" or (buildDepError "shake"))
            (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."text-format" or (buildDepError "text-format"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."MissingH" or (buildDepError "MissingH"))
            ];
          buildable = true;
          };
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."duplo" or (buildDepError "duplo"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."MissingH" or (buildDepError "MissingH"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        };
      };
    }