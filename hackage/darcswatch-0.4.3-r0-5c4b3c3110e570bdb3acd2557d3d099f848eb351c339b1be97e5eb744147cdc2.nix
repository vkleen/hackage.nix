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
    flags = { static = false; };
    package = {
      specVersion = "1.6";
      identifier = { name = "darcswatch"; version = "0.4.3"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Joachim Breitner <mail@joachim-breitner.de>";
      author = "Joachim Breitner";
      homepage = "http://darcswatch.nomeata.de/";
      url = "";
      synopsis = "Track application of Darcs patches";
      description = "DarcsWatch is a tool to track the state of darcs patches\nthat have been submitted to some project, usually by\nusing the \"darcs send\" command. It allows both submitters\nand project maintainers to get an overview of patches that\nhave been submitted but not yet applied. Some notable features are:\n\n* Reads both darcs1 and darcs2.0 (hashed) format repositories.\n\n* Displays patch summaries per user and per repository.\n\n* Patch diff can be reviewed directly.\n\n* Download link for each patch, to apply without searching for the email.\n\n* Knows about inverse and amend-recorded patches and uses them to consider\n\n* Integrates into http://bugs.darcs.net/\n\n* Optionally sends out mails to mailing lists when a patch is applied to a repository\npatches obsolete.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "darcswatch-generate" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."Crypto" or (buildDepError "Crypto"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."xhtml" or (buildDepError "xhtml"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."nano-md5" or (buildDepError "nano-md5"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."concurrentoutput" or (buildDepError "concurrentoutput"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."mime-string" or (buildDepError "mime-string"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."cgi" or (buildDepError "cgi"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          buildable = true;
          };
        "darcswatch-import-mail" = { buildable = true; };
        "darcswatch-import-bundle" = { buildable = true; };
        "darcswatch-convert-data" = { buildable = true; };
        "darcswatch-pull-repos" = { buildable = true; };
        "darcswatch-update-data" = { buildable = true; };
        "darcswatch-cgi" = { buildable = true; };
        };
      };
    }