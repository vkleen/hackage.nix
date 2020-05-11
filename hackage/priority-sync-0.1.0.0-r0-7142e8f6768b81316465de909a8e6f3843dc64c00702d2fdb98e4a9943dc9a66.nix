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
      specVersion = "1.2";
      identifier = { name = "priority-sync"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Christopher Lane Hinson <lane@downstairspeople.org>";
      author = "Christopher Lane Hinson";
      homepage = "";
      url = "";
      synopsis = "Task prioritization.";
      description = "Implements cooperative task prioritization with room synchronization.\n\nIn the simplest usage, for an unprioritized FILO queue, only three operations are needed: 'simpleTaskPool', 'claim', and 'startQueue'.\n\n@\n(pool :: TaskPool () ()) <- simpleTaskPool\nforkIO \$ claim Acquire pool \$ putStrLn \"Hello world!\"\nforkIO \$ claim Acquire pool \$ putStrLn \"Goodbye world!\"\nstartQueue pool\n@\n\nFor a simple prioritized queue, the 'schedule' operation introduces the priority.  Prioritization is always least-first.\n\n@\nprio_pool <- simpleTaskPool\nforkIO \$ claim Acquire (schedule prio_pool 1) \$ putStrLn \"Hello world!\"\nforkIO \$ claim Acquire (schedule prio_pool 2) \$ putStrLn \"Goodbye world!\"\nstartQueue prio_pool\n@\n\nNote that if you run these programs with @+RTS -N2@ or greater, the 'claim' operations may be processed in any order, since 'simpleTaskQueue' detects\nthe number of capabilities and schedules tasks on each.\n\n'TaskPool's are not thread pools.  The concept is similar to IO Completion Ports.  There are no worker threads.  If a number of threads are waiting,\nthe thread that is most likely to be processed next is woken and temporarily serves as a working thread.  'TaskPool's are backed by carefully\nwritten STM (software transactional memory) transactions.\n\nA salient feature is that, because any thread can participate, a 'TaskPool' supports both bound threads and threads created with 'forkOnIO'.\n\nFor applications that have complex resource constraints, it is possible to create a 'Room' to model each constraint.  'Room's are fully reentrant,\nand an arbitrary number of threads can 'claim' a 'Room' according to arbitrary rules, or 'RoomConstraint's.  In the simple usage above,\na single room represents the number of capabilities available to the GHC runtime.\n\nWhenever a thread attempts to acquire a 'Room', a 'Claim' is generated that represents that attempt.  The 'Claim' can be approved immediately,\nor it can be approved at the whim of another thread that has access to that 'Claim'.  This means that 'Room's can be constructed in such\na way that 'Claim's are approved only when a third party thread sees that the resource constraint modeled by that 'Room' has been satisfied.\n\nThe rules for generating and approving 'Claim's are described by a 'RoomContext'.  By default, 'Claim's are approved immediately if their\nassociated 'RoomConstraint's have been satisfied, but when a 'TaskPool' is introduced approval is deferred for prioritization.\n\n'Room' constraints are completely advisory: any task may claim any 'Room' without restriction at any time by using the 'UnconstrainedRoomContext'.\n\n'Queue's are used to prioritize tasks.  Even if you have no need for prioritization, a 'Queue' ensures that only one thread is woken up\nwhen a 'Room' becomes available.  A 'Queue' systematically examines to a configurable depth all waiting threads with their priorities\nand constraints and wakes the most eagerly prioritized thread whose constraints can be satisfied.\n\nA 'TaskPool' combines 'Room's and 'Queue's in an efficient, easy-to-use interface.\n\nThe git repository is available at <http://www.downstairspeople.org/git/priority-sync.git>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."heap" or (buildDepError "heap"))
          (hsPkgs."parallel" or (buildDepError "parallel"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."random" or (buildDepError "random"))
          ];
        buildable = true;
        };
      exes = {
        "_Control_Concurrent_Priority_Tests" = {
          depends = [ (hsPkgs."base" or (buildDepError "base")) ];
          buildable = true;
          };
        };
      };
    }