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
    flags = { old-locale = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "hslogger-reader"; version = "1.0.3"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "ard.bates@gmail.com";
      author = "Alex Bates";
      homepage = "http://github.com/prophet-on-that/hslogger-reader";
      url = "";
      synopsis = "Parsing hslogger-produced logs.";
      description = "hslogger-reader provides a function to generate a parser for\n<http://hackage.haskell.org/package/hslogger hslogger>-produced logs\nfrom a hslogger format string (see \"System.Log.Formatter\"). The\naccompanying executable demonstrates parsing and computing with a\nlog file in constant memory.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."hslogger" or (buildDepError "hslogger"))
          ] ++ (if flags.old-locale
          then [
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            ]
          else [ (hsPkgs."time" or (buildDepError "time")) ]);
        buildable = true;
        };
      exes = {
        "profiling" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hslogger-reader" or (buildDepError "hslogger-reader"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            ];
          buildable = true;
          };
        "filter-logs" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hslogger-reader" or (buildDepError "hslogger-reader"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."hslogger" or (buildDepError "hslogger"))
            (hsPkgs."text-icu" or (buildDepError "text-icu"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            ] ++ (if flags.old-locale
            then [
              (hsPkgs."time" or (buildDepError "time"))
              (hsPkgs."old-locale" or (buildDepError "old-locale"))
              ]
            else [ (hsPkgs."time" or (buildDepError "time")) ]);
          buildable = true;
          };
        };
      };
    }