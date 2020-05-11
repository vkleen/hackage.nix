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
    flags = { dev = false; };
    package = {
      specVersion = "2.4";
      identifier = { name = "schedule"; version = "0.1.0.0"; };
      license = "GPL-3.0-or-later";
      copyright = "2016-2019 Ximin Luo";
      maintainer = "infinity0@pwned.gg";
      author = "Ximin Luo";
      homepage = "https://github.com/infinity0/hs-schedule";
      url = "";
      synopsis = "Pure deterministic scheduled computations";
      description = "Schedule computations to run later, in a pure and deterministic way.\n\nThis library is a pure alternative to \"System.Timeout\" suitable for IO-bound\nnon-blocking computations. \"System.Timeout\" has a few issues that are at-odds\nwith a Haskell or purely functional paradigm: (1) it is not deterministic,\n(2) the timeout state is not serialisable, and (3) the timeout functionality\nmust be shared between unrelated components, making it harder to design\ncomponents that are easily decomposable and reusable.\n\nThis library solves these issues by implementing all schedule and timeout\nlogic as a pure deterministic computation, with callbacks represented in\ndefunctionalised serialisable form. The interface with the runtime execution\nenvironment is minimal: a simple source of clock inputs similar to other\ninputs such as network traffic or user commands, which can either be an\nIO-based impure \"real\" runtime, or a pure \"mock\" one e.g. that replays\nprevious inputs to reproduce previous outputs.\n\nThis library does /no pre-emption/ e.g. by sending interrupts or asynchronous\nexceptions, so it is probably /not suitable/ for blocking computations. To be\nclear, things will /work/, but clock inputs will be delivered only after the\nblocking is over. A workaround is to separate the blocking computations from\nyour main computation, arrange to have these run externally (e.g. in worker\nthreads) with the results being sent back to your main computation via some\npure abstract input interface, similar to how we deliver clock inputs.\n\nIf this is not suitable and you absolutely need pre-emption, then you'll need\na richer runtime interface than the one expected by this library; luckily the\nHaskell runtime itself is such an example. In other words, simply use other\nexisting IO-based utilities for setting timeouts, that typically rely on\nconcurrency or asynchronous exceptions. But then, you'll have to figure out\nyour own way of overcoming the issues mentioned in the first paragraph.\n\nThe original motivation for this library comes from implementing secure\ncommunications protocols and decentralised distributed systems. In these\ncontexts one must often set local timeouts for remote events that may or may\nnot happen in the future, or periodically synchronise local views of shared\ndata with remote peers. Most operations are IO-bound and can be written to be\nnon-blocking; the main exception is heavy cryptography which can be delegated\nto worker threads as described above. Of course, this library is not tied to\nthese use-cases and is a general replacement for \"System.Timeout\".\n\nSee \"Control.Monad.Schedule\" for the main monad-based API of this library.\n\nSee \"Control.Arrow.Schedule\" for the main arrow-based API of this library.\n\nSee \"Control.Clock.IO\" for various ways of combining clock inputs with other\ninputs and injecting them into your pure computations.\n\nSee @Control.Schedule.*@ for higher-level utilities that one often wants to\nuse on top of a timeout primitive, such as futures and monitors.\n\nSee unit tests for example usage.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."extra" or (buildDepError "extra"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."system-time-monotonic" or (buildDepError "system-time-monotonic"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ];
        buildable = true;
        };
      tests = {
        "doctests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            (hsPkgs."schedule" or (buildDepError "schedule"))
            ];
          buildable = true;
          };
        "unit" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."checkers" or (buildDepError "checkers"))
            (hsPkgs."primitive" or (buildDepError "primitive"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."schedule" or (buildDepError "schedule"))
            ];
          buildable = true;
          };
        };
      };
    }