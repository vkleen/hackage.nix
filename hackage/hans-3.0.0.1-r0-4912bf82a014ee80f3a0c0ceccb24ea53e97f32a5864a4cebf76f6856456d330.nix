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
    flags = { examples = false; };
    package = {
      specVersion = "1.18";
      identifier = { name = "hans"; version = "3.0.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "halvm-devel@community.galois.com";
      author = "Galois Inc.";
      homepage = "";
      url = "";
      synopsis = "Network Stack";
      description = "HaNS is a lightweight, pure Haskell network stack that can be used for Haskell\nnetworking in the context of the HaLVM, or with a Linux tap device.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."heaps" or (buildDepError "heaps"))
          (hsPkgs."psqueues" or (buildDepError "psqueues"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."BoundedChan" or (buildDepError "BoundedChan"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."monadLib" or (buildDepError "monadLib"))
          (hsPkgs."cryptonite" or (buildDepError "cryptonite"))
          (hsPkgs."memory" or (buildDepError "memory"))
          ] ++ (pkgs.lib).optionals (system.isHalvm) [
          (hsPkgs."XenDevice" or (buildDepError "XenDevice"))
          (hsPkgs."HALVMCore" or (buildDepError "HALVMCore"))
          ]) ++ (pkgs.lib).optional (system.isOsx || system.isLinux) (hsPkgs."unix" or (buildDepError "unix"));
        buildable = true;
        };
      exes = {
        "echo-server" = {
          depends = (pkgs.lib).optionals (flags.examples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."hans" or (buildDepError "hans"))
            ];
          buildable = if flags.examples then true else false;
          };
        };
      tests = {
        "hans-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-ant-xml" or (buildDepError "tasty-ant-xml"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."cereal" or (buildDepError "cereal"))
            (hsPkgs."hans" or (buildDepError "hans"))
            ];
          buildable = true;
          };
        };
      };
    }