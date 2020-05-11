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
      identifier = { name = "thread-local-storage"; version = "0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "rrnewton@gmail.com";
      author = "Ryan Newton";
      homepage = "https://github.com/rrnewton/thread-local-storage";
      url = "";
      synopsis = "Several options for thread-local-storage (TLS) in Haskell.";
      description = "\nThread-local storage, or TLS, is an important ingredient in many\nalgorithms and data structures.\n\nThe GHC compiler does not provide a built-in notion of TLS either\nat the IO-thread or OS thread level.  This package provides a few\ndifferent implementations of a simple TLS API.\n\nAll exported public modules provide exactly the same interface with\ndifferent implementations.  Run the included criterion benchmark\nsuite to ascertain which performs the best on your platform.\n\nExample criterion benchmark data can be found here (from an Intel Ivy-Bridge i7-3770 desktop):\n<http://www.cs.indiana.edu/~rrnewton/datasets/xmen_tls_report.html>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          ];
        libs = [ (pkgs."pthread" or (sysDepError "pthread")) ];
        buildable = true;
        };
      tests = {
        "test-tls" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."atomic-primops" or (buildDepError "atomic-primops"))
            (hsPkgs."thread-local-storage" or (buildDepError "thread-local-storage"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "bench-haskell-tls" = {
          depends = [
            (hsPkgs."thread-local-storage" or (buildDepError "thread-local-storage"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."atomic-primops" or (buildDepError "atomic-primops"))
            ];
          buildable = true;
          };
        };
      };
    }