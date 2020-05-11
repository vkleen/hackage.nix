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
      eventlog = false;
      hint = false;
      profiling = false;
      testing = false;
      };
    package = {
      specVersion = "1.10";
      identifier = { name = "yi-core"; version = "0.13"; };
      license = "GPL-2.0-only";
      copyright = "";
      maintainer = "Yi developers <yi-devel@googlegroups.com>";
      author = "";
      homepage = "https://github.com/yi-editor/yi#readme";
      url = "";
      synopsis = "Yi editor core library";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = (([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."dlist" or (buildDepError "dlist"))
          (hsPkgs."dynamic-state" or (buildDepError "dynamic-state"))
          (hsPkgs."dyre" or (buildDepError "dyre"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."Hclip" or (buildDepError "Hclip"))
          (hsPkgs."ListLike" or (buildDepError "ListLike"))
          (hsPkgs."microlens-platform" or (buildDepError "microlens-platform"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."oo-prototypes" or (buildDepError "oo-prototypes"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."pointedlist" or (buildDepError "pointedlist"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."process-extras" or (buildDepError "process-extras"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."text-icu" or (buildDepError "text-icu"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."unix-compat" or (buildDepError "unix-compat"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."word-trie" or (buildDepError "word-trie"))
          (hsPkgs."xdg-basedir" or (buildDepError "xdg-basedir"))
          (hsPkgs."yi-language" or (buildDepError "yi-language"))
          (hsPkgs."yi-rope" or (buildDepError "yi-rope"))
          ] ++ (if system.isWindows
          then [ (hsPkgs."Win32" or (buildDepError "Win32")) ]
          else [
            (hsPkgs."unix" or (buildDepError "unix"))
            ])) ++ (pkgs.lib).optional (flags.hint) (hsPkgs."hint" or (buildDepError "hint"))) ++ (pkgs.lib).optionals (flags.testing) [
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."random" or (buildDepError "random"))
          ];
        buildable = true;
        };
      tests = {
        "tasty" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."dlist" or (buildDepError "dlist"))
            (hsPkgs."dynamic-state" or (buildDepError "dynamic-state"))
            (hsPkgs."dyre" or (buildDepError "dyre"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."Hclip" or (buildDepError "Hclip"))
            (hsPkgs."ListLike" or (buildDepError "ListLike"))
            (hsPkgs."microlens-platform" or (buildDepError "microlens-platform"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."oo-prototypes" or (buildDepError "oo-prototypes"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."pointedlist" or (buildDepError "pointedlist"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."process-extras" or (buildDepError "process-extras"))
            (hsPkgs."safe" or (buildDepError "safe"))
            (hsPkgs."semigroups" or (buildDepError "semigroups"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."text-icu" or (buildDepError "text-icu"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
            (hsPkgs."unix-compat" or (buildDepError "unix-compat"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."word-trie" or (buildDepError "word-trie"))
            (hsPkgs."xdg-basedir" or (buildDepError "xdg-basedir"))
            (hsPkgs."yi-language" or (buildDepError "yi-language"))
            (hsPkgs."yi-rope" or (buildDepError "yi-rope"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."yi-core" or (buildDepError "yi-core"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."containers" or (buildDepError "containers"))
            ] ++ (if system.isWindows
            then [ (hsPkgs."Win32" or (buildDepError "Win32")) ]
            else [ (hsPkgs."unix" or (buildDepError "unix")) ]);
          buildable = true;
          };
        };
      };
    }