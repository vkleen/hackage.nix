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
      identifier = { name = "slave-thread"; version = "0.1.0"; };
      license = "MIT";
      copyright = "(c) 2014, Nikita Volkov";
      maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/nikita-volkov/slave-thread ";
      url = "";
      synopsis = "A solution to ghost threads and silent exceptions";
      description = "Vanilla thread management in Haskell is low level and\nit does not approach the problems related to thread deaths.\nWhen it's used naively the following typical problems arise:\n\n* When a forked thread dies due to an uncaught exception,\nthe exception does not get raised in the main thread,\nwhich is why the program continues to run as if nothing happened,\ni.e., with the presumption that the already dead thread is running normally.\nIt does not need an explanation\nthat this may bring your program to a chaotic state.\n\n* Another issue is that one thread dying does not\naffect any of the threads forked from it.\nThat's why your program may be accumulating ghost threads.\n\n* Ever dealt with your program ignoring the \\<Ctrl-C\\> strikes?\n\nThis library solves all the issues above with a concept of a slave thread.\nA slave thread has the following properties:\n\n1. When it dies for whatever reason (exception or finishing normally)\nit kills all the slave threads that were forked from it.\nThis protects you from ghost threads.\n\n2. It waits for all slaves to die and execute their finalizers\nbefore executing its own finalizer and getting released itself.\nThis gives you hierarchical releasing of resources.\n\n3. When a slave thread dies with an uncaught exception\nit reraises it in the parent thread.\nThis protects you from silent exceptions.\nIf your program is brought to an erroneous state\nyou can be sure of getting informed.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."stm-containers" or (buildDepError "stm-containers"))
          (hsPkgs."partial-handler" or (buildDepError "partial-handler"))
          (hsPkgs."list-t" or (buildDepError "list-t"))
          (hsPkgs."mmorph" or (buildDepError "mmorph"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."base-prelude" or (buildDepError "base-prelude"))
          (hsPkgs."base" or (buildDepError "base"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."slave-thread" or (buildDepError "slave-thread"))
            (hsPkgs."HTF" or (buildDepError "HTF"))
            (hsPkgs."quickcheck-instances" or (buildDepError "quickcheck-instances"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."base-prelude" or (buildDepError "base-prelude"))
            (hsPkgs."base" or (buildDepError "base"))
            ];
          buildable = true;
          };
        };
      };
    }