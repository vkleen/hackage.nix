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
      identifier = { name = "elerea"; version = "2.7.0.2"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2009-2012, Patai Gergely";
      maintainer = "Patai Gergely (patai.gergely@gmail.com)";
      author = "Patai Gergely";
      homepage = "";
      url = "";
      synopsis = "A minimalistic FRP library";
      description = "Elerea (Eventless reactivity) is a tiny discrete time FRP\nimplementation without the notion of event-based switching and\nsampling, with first-class signals (time-varying values).  Reactivity\nis provided through various higher-order constructs that also allow\nthe user to work with arbitrary time-varying structures containing\nlive signals.  Signals have precise and simple denotational\nsemantics.\n\nStateful signals can be safely generated at any time through a\nmonadic interface, while stateless combinators can be used in a\npurely applicative style.  Elerea signals can be defined recursively,\nand external input is trivial to attach.  The library comes in three\nmajor variants:\n\n* Simple: signals are plain discrete streams isomorphic to functions\nover natural numbers;\n\n* Param: adds a globally accessible input signal for convenience;\n\n* Clocked: adds the ability to freeze whole subnetworks at will.\n\nThis is a minimal library that defines only some basic primitives,\nand you are advised to install @elerea-examples@ as well to get an\nidea how to build non-trivial systems with it.  The examples are\nseparated in order to minimise the dependencies of the core library.\nThe @dow@ package contains a full game built on top of the simple\nvariant.\n\nThe basic idea of the implementation is described in the WFLP 2010\npaper /Efficient and Compositional Higher-Order Streams/\n(<http://sgate.emt.bme.hu/documents/patai/publications/PataiWFLP2010.pdf>).\n\nAdditional contributions: Takano Akio";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          ];
        buildable = true;
        };
      };
    }