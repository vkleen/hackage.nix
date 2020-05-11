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
      identifier = { name = "tokyocabinet-haskell"; version = "0.0.6"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Stephen Paul Weber <singpolyma@singpolyma.net>";
      author = "Tom Tsuruhara";
      homepage = "https://git.singpolyma.net/tokyocabinet-haskell";
      url = "";
      synopsis = "Haskell binding of Tokyo Cabinet";
      description = "Bindings to Tokyo Cabinet library.\nTokyo Cabinet is a modern implementation of DBM.\nFor more about Tokyo Cabinet, see <http://tokyocabinet.sourceforge.net/index.html>.\nThis package provides `tokyocabinet.idl compliant' naive interfaces.\nSee, <http://tokyocabinet.sourceforge.net/tokyocabinet.idl>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          ];
        libs = [ (pkgs."tokyocabinet" or (sysDepError "tokyocabinet")) ];
        buildable = true;
        };
      tests = {
        "ListTest" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            ];
          libs = [ (pkgs."tokyocabinet" or (sysDepError "tokyocabinet")) ];
          buildable = true;
          };
        "MapTest" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            ];
          libs = [ (pkgs."tokyocabinet" or (sysDepError "tokyocabinet")) ];
          buildable = true;
          };
        "HDBTest" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          libs = [ (pkgs."tokyocabinet" or (sysDepError "tokyocabinet")) ];
          buildable = true;
          };
        "BDBTest" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          libs = [ (pkgs."tokyocabinet" or (sysDepError "tokyocabinet")) ];
          buildable = true;
          };
        "FDBTest" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          libs = [ (pkgs."tokyocabinet" or (sysDepError "tokyocabinet")) ];
          buildable = true;
          };
        "TDBTest" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          libs = [ (pkgs."tokyocabinet" or (sysDepError "tokyocabinet")) ];
          buildable = true;
          };
        "TDBQRYTest" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          libs = [ (pkgs."tokyocabinet" or (sysDepError "tokyocabinet")) ];
          buildable = true;
          };
        "ADBTest" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          libs = [ (pkgs."tokyocabinet" or (sysDepError "tokyocabinet")) ];
          buildable = true;
          };
        "TCDBTest" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          libs = [ (pkgs."tokyocabinet" or (sysDepError "tokyocabinet")) ];
          buildable = true;
          };
        "StorableTest" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          libs = [ (pkgs."tokyocabinet" or (sysDepError "tokyocabinet")) ];
          buildable = true;
          };
        };
      };
    }