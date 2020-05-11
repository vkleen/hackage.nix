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
      identifier = { name = "lambdabot"; version = "4.3.0.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "James Cook <mokus@deepbondi.net>";
      author = "Don Stewart";
      homepage = "http://haskell.org/haskellwiki/Lambdabot";
      url = "";
      synopsis = "Lambdabot is a development tool and advanced IRC bot";
      description = "Lambdabot is an IRC bot written over several years by\nthose on the #haskell IRC channel.\n\nIt operates as a command line tool, embedded in an editor,\nembedded in GHCi, via internet relay chat and on the web.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."dependent-map" or (buildDepError "dependent-map"))
          (hsPkgs."dependent-sum" or (buildDepError "dependent-sum"))
          (hsPkgs."dependent-sum-template" or (buildDepError "dependent-sum-template"))
          (hsPkgs."dice" or (buildDepError "dice"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."edit-distance" or (buildDepError "edit-distance"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."haskeline" or (buildDepError "haskeline"))
          (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
          (hsPkgs."hstatsd" or (buildDepError "hstatsd"))
          (hsPkgs."hslogger" or (buildDepError "hslogger"))
          (hsPkgs."HTTP" or (buildDepError "HTTP"))
          (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
          (hsPkgs."misfortune" or (buildDepError "misfortune"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."oeis" or (buildDepError "oeis"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."pretty" or (buildDepError "pretty"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."random-fu" or (buildDepError "random-fu"))
          (hsPkgs."random-source" or (buildDepError "random-source"))
          (hsPkgs."regex-tdfa" or (buildDepError "regex-tdfa"))
          (hsPkgs."SafeSemaphore" or (buildDepError "SafeSemaphore"))
          (hsPkgs."show" or (buildDepError "show"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."syb" or (buildDepError "syb"))
          (hsPkgs."tagsoup" or (buildDepError "tagsoup"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."zlib" or (buildDepError "zlib"))
          (hsPkgs."arrows" or (buildDepError "arrows"))
          (hsPkgs."brainfuck" or (buildDepError "brainfuck"))
          (hsPkgs."data-memocombinators" or (buildDepError "data-memocombinators"))
          (hsPkgs."hoogle" or (buildDepError "hoogle"))
          (hsPkgs."IOSpec" or (buildDepError "IOSpec"))
          (hsPkgs."logict" or (buildDepError "logict"))
          (hsPkgs."MonadRandom" or (buildDepError "MonadRandom"))
          (hsPkgs."mueval" or (buildDepError "mueval"))
          (hsPkgs."numbers" or (buildDepError "numbers"))
          (hsPkgs."unlambda" or (buildDepError "unlambda"))
          (hsPkgs."vector-space" or (buildDepError "vector-space"))
          ];
        buildable = true;
        };
      exes = {
        "lambdabot" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."lambdabot" or (buildDepError "lambdabot"))
            ];
          buildable = true;
          };
        };
      };
    }