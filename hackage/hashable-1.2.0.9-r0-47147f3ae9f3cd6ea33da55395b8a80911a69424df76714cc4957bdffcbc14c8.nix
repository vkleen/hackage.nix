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
    flags = {
      integer-gmp = true;
      fixed-salt = false;
      sse2 = true;
      sse41 = false;
      };
    package = {
      specVersion = "1.8";
      identifier = { name = "hashable"; version = "1.2.0.9"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "johan.tibell@gmail.com";
      author = "Milan Straka <fox@ucw.cz>\nJohan Tibell <johan.tibell@gmail.com>";
      homepage = "http://github.com/tibbe/hashable";
      url = "";
      synopsis = "A class for types that can be converted to a hash value";
      description = "This package defines a class, 'Hashable', for types that\ncan be converted to a hash value.  This class\nexists for the benefit of hashing-based data\nstructures.  The package provides instances for\nbasic types and a way to combine hash values.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          ] ++ (pkgs.lib).optionals (compiler.isGhc && true) [
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          (hsPkgs."text" or (buildDepError "text"))
          ]) ++ (pkgs.lib).optional (compiler.isGhc && true && flags.integer-gmp) (hsPkgs."integer-gmp" or (buildDepError "integer-gmp"));
        libs = (pkgs.lib).optionals (!flags.fixed-salt) ((pkgs.lib).optional (system.isWindows) (pkgs."advapi32" or (sysDepError "advapi32")));
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."text" or (buildDepError "text"))
            ] ++ (pkgs.lib).optional (!system.isWindows) (hsPkgs."unix" or (buildDepError "unix"));
          buildable = true;
          };
        };
      benchmarks = {
        "benchmarks" = {
          depends = ([
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."siphash" or (buildDepError "siphash"))
            (hsPkgs."text" or (buildDepError "text"))
            ] ++ (pkgs.lib).optionals (compiler.isGhc && true) [
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."text" or (buildDepError "text"))
            ]) ++ (pkgs.lib).optional (compiler.isGhc && true && flags.integer-gmp) (hsPkgs."integer-gmp" or (buildDepError "integer-gmp"));
          libs = (pkgs.lib).optionals (!flags.fixed-salt) ((pkgs.lib).optional (system.isWindows) (pkgs."advapi32" or (sysDepError "advapi32")));
          buildable = true;
          };
        };
      };
    }