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
    flags = { s3 = true; inotify = true; assistant = true; };
    package = {
      specVersion = "1.8";
      identifier = { name = "git-annex"; version = "3.20120721"; };
      license = "LicenseRef-GPL";
      copyright = "2010-2012 Joey Hess";
      maintainer = "Joey Hess <joey@kitenet.net>";
      author = "Joey Hess";
      homepage = "http://git-annex.branchable.com/";
      url = "";
      synopsis = "manage files with git, without checking their contents into git";
      description = "git-annex allows managing files with git, without checking the file\ncontents into git. While that may seem paradoxical, it is useful when\ndealing with files larger than git can currently easily handle, whether due\nto limitations in memory, time, or disk space.\n\nEven without file content tracking, being able to manage files with git,\nmove files around and delete files with versioned directory trees, and use\nbranches and distributed clones, are all very handy reasons to use git. And\nannexed files can co-exist in the same git repository with regularly\nversioned files, which is convenient for maintaining documents, Makefiles,\netc that are associated with annexed files but that benefit from full\nrevision control.";
      buildType = "Custom";
      };
    components = {
      exes = {
        "git-annex" = {
          depends = (([
            (hsPkgs."MissingH" or (buildDepError "MissingH"))
            (hsPkgs."hslogger" or (buildDepError "hslogger"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."pcre-light" or (buildDepError "pcre-light"))
            (hsPkgs."extensible-exceptions" or (buildDepError "extensible-exceptions"))
            (hsPkgs."dataenc" or (buildDepError "dataenc"))
            (hsPkgs."SHA" or (buildDepError "SHA"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."monad-control" or (buildDepError "monad-control"))
            (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
            (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
            (hsPkgs."IfElse" or (buildDepError "IfElse"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."bloomfilter" or (buildDepError "bloomfilter"))
            (hsPkgs."edit-distance" or (buildDepError "edit-distance"))
            ] ++ (pkgs.lib).optional (flags.s3) (hsPkgs."hS3" or (buildDepError "hS3"))) ++ (pkgs.lib).optional (flags.assistant) (hsPkgs."stm" or (buildDepError "stm"))) ++ (pkgs.lib).optional (system.isLinux && flags.inotify) (hsPkgs."hinotify" or (buildDepError "hinotify"));
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."testpack" or (buildDepError "testpack"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."MissingH" or (buildDepError "MissingH"))
            (hsPkgs."hslogger" or (buildDepError "hslogger"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."pcre-light" or (buildDepError "pcre-light"))
            (hsPkgs."extensible-exceptions" or (buildDepError "extensible-exceptions"))
            (hsPkgs."dataenc" or (buildDepError "dataenc"))
            (hsPkgs."SHA" or (buildDepError "SHA"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."monad-control" or (buildDepError "monad-control"))
            (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
            (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
            (hsPkgs."IfElse" or (buildDepError "IfElse"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."bloomfilter" or (buildDepError "bloomfilter"))
            (hsPkgs."edit-distance" or (buildDepError "edit-distance"))
            ];
          buildable = true;
          };
        };
      };
    }