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
      identifier = { name = "plist-buddy"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2015 Andy Gill";
      maintainer = "andygill@ku.edu";
      author = "Andy Gill";
      homepage = "";
      url = "";
      synopsis = "Remote monad for editing plists";
      description = "Remote monad wrapper around the plistbuddy shell command for editing plists";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base16-bytestring" or (buildDepError "base16-bytestring"))
          (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."cryptohash" or (buildDepError "cryptohash"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."posix-pty" or (buildDepError "posix-pty"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."xml" or (buildDepError "xml"))
          ];
        buildable = true;
        };
      tests = {
        "test-plist-buddy" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."plist-buddy" or (buildDepError "plist-buddy"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."posix-pty" or (buildDepError "posix-pty"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            ];
          buildable = true;
          };
        };
      };
    }