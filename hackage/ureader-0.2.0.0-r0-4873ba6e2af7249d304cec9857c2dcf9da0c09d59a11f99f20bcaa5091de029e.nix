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
      identifier = { name = "ureader"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2013, Sam Truzjan";
      maintainer = "Sam Truzjan <pxqr.sta@gmail.com>";
      author = "Sam Truzjan";
      homepage = "https://github.com/pxqr/ureader";
      url = "";
      synopsis = "Minimalistic CLI RSS reader.";
      description = "`ureader` is minimalistic command line RSS reader with unicode\nand color support. Everything it does is fetch RSS documents,\nmerge them according to specified options, format and flush\nresulting feed to stdout. So `ureader` could be used with\npagers like more(1) or in linux terminal.\n\n[/Release Notes/]\n\n* /0.1.0.0:/ Initial version.\n\n* /0.2.0.0:/ Use OPML for subscription list.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "ureader" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."implicit-params" or (buildDepError "implicit-params"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."parallel-io" or (buildDepError "parallel-io"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."curl" or (buildDepError "curl"))
            (hsPkgs."download-curl" or (buildDepError "download-curl"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."ansi-wl-pprint" or (buildDepError "ansi-wl-pprint"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."terminal-size" or (buildDepError "terminal-size"))
            (hsPkgs."opml" or (buildDepError "opml"))
            (hsPkgs."xml" or (buildDepError "xml"))
            (hsPkgs."feed" or (buildDepError "feed"))
            (hsPkgs."tagsoup" or (buildDepError "tagsoup"))
            ];
          buildable = true;
          };
        };
      };
    }