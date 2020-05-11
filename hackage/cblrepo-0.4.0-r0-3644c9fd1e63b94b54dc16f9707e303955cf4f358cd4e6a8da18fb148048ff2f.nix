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
    flags = { buildtests = false; };
    package = {
      specVersion = "1.6";
      identifier = { name = "cblrepo"; version = "0.4.0"; };
      license = "LicenseRef-OtherLicense";
      copyright = "Copyright (c) 2011 Magnus Therning";
      maintainer = "Magnus Therning <magnus@therning.org>";
      author = "Magnus Therning";
      homepage = "";
      url = "";
      synopsis = "Tool to maintain a database of CABAL packages and their dependencies";
      description = "Helper tool for people maintaining a set of CABAL packages for their\ndistribution.  It maintains a database of packages and verifies\ndependencies of the entire set as packages are added or updated.  It also\nmakes it trivial to track packages as new versions are released on Hackage.\nIt can also be used to build source packages for the ArchLinux distribution.";
      buildType = "Custom";
      };
    components = {
      exes = {
        "cblrepo" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."tar" or (buildDepError "tar"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."Unixutils" or (buildDepError "Unixutils"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."ansi-wl-pprint" or (buildDepError "ansi-wl-pprint"))
            ];
          buildable = true;
          };
        "tests" = {
          depends = (pkgs.lib).optionals (flags.buildtests) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."test-framework-th" or (buildDepError "test-framework-th"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            ];
          buildable = if flags.buildtests then true else false;
          };
        };
      };
    }