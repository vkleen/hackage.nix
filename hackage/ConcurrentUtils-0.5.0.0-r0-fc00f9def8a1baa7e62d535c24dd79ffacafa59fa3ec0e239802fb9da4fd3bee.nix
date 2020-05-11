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
      specVersion = "1.18";
      identifier = { name = "ConcurrentUtils"; version = "0.5.0.0"; };
      license = "GPL-2.0-only";
      copyright = "";
      maintainer = "jacinablackbox@yahoo.com";
      author = "James Candy";
      homepage = "";
      url = "";
      synopsis = "Concurrent utilities";
      description = "Release notes for version 0.5.0.0:\n\n* Deprecated and removed the 'DataParallel' module, after it performed disappointingly on my own benchmarks, and failed to achieve sufficient parallelism to justify it; deprecated and removed \"deadlock\" and Data.BellmanFord modules.\n\n* Refactored the Conc module and renamed as CPUMultiThreading; improved the implementation of thread pools. By breaking tasks into smaller chunks when putting them on the thread pools, it avoids occupying the thread pools with long running tasks, hopefully making performance predictable when different tasks contend for the same thread pool.\n\n* Added a handrolled(?TODO) semaphore implementation (semaphore) which uses CAS instructions in the common case to reduce latency";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."monads-tf" or (buildDepError "monads-tf"))
          (hsPkgs."atl" or (buildDepError "atl"))
          (hsPkgs."list-extras" or (buildDepError "list-extras"))
          (hsPkgs."extra" or (buildDepError "extra"))
          (hsPkgs."strict" or (buildDepError "strict"))
          (hsPkgs."monad-loops" or (buildDepError "monad-loops"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."assert" or (buildDepError "assert"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."parallel" or (buildDepError "parallel"))
          (hsPkgs."profunctors" or (buildDepError "profunctors"))
          ];
        buildable = true;
        };
      };
    }