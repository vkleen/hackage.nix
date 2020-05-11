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
      identifier = { name = "ghc-events-parallel"; version = "0.4.2.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Eden group <eden@mathematik.uni-marburg.de>";
      author = "Donnie Jones <donnie@darthik.com>,\nSimon Marlow <marlowsd@gmail.com>,\nPaul Bone <pbone@csse.unimelb.edu.au>,\nMischa Dieterle <dieterle@mathematik.uni-marburg.de>,\nThomas Horstmeyer <horstmey@mathematik.uni-marburg.de>,\nDuncan Coutts <duncan@well-typed.com>,\nNicolas Wu <nick@well-typed.com>,\nJost Berthold <berthold@diku.dk>\nMikolaj Konarski <mikolaj@well-typed.com>";
      homepage = "";
      url = "";
      synopsis = "Library and tool for parsing .eventlog files from parallel GHC";
      description = "Parses .eventlog files emitted by parallel GHC versions\n(6.12.3 and later). This package can replace the original\nghc-events package and defines a superset of functions\nand types.\nIncludes the ghc-events tool permitting, in particular,\nto dump an event log file as text.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."array" or (buildDepError "array"))
          ];
        buildable = true;
        };
      exes = {
        "ghc-events" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."array" or (buildDepError "array"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test-versions" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."array" or (buildDepError "array"))
            ];
          buildable = true;
          };
        };
      };
    }