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
    flags = { build-test-suite = false; };
    package = {
      specVersion = "1.6";
      identifier = { name = "time-w3c"; version = "0.1"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "PHO <pho AT cielonegro DOT org>";
      author = "PHO <pho AT cielonegro DOT org>";
      homepage = "http://cielonegro.org/W3CDateTime.html";
      url = "";
      synopsis = "Parse, format and convert W3C Date and Time";
      description = "This package provides functionalities to parse and format W3C\nDate and Time. The package can also be used to convert it\nfrom/to 'Data.Time.Calendar.Day' and\n'Data.Time.LocalTime.ZonedTime'.\nSee: <http://www.w3.org/TR/NOTE-datetime>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."convertible" or (buildDepError "convertible"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."time" or (buildDepError "time"))
          ];
        buildable = true;
        };
      exes = {
        "W3CDateTimeUnitTest" = {
          depends = (pkgs.lib).optional (flags.build-test-suite) (hsPkgs."HUnit" or (buildDepError "HUnit"));
          buildable = if flags.build-test-suite then true else false;
          };
        };
      };
    }