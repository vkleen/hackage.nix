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
      specVersion = "1.6";
      identifier = { name = "effect-monad"; version = "0.8.1.0"; };
      license = "BSD-3-Clause";
      copyright = "2013-18 University of Kent";
      maintainer = "Dominic Orchard";
      author = "Dominic Orchard";
      homepage = "";
      url = "";
      synopsis = "Embeds effect systems and program logics into Haskell using graded monads and parameterised monads";
      description = "Provides the graded monad structure to Haskell via Control.Effect\nwith a number of analogs of familiar monads and some new things:\nReader, Writer, State, Maybe, Counter, Update\nand a wrapper over normal monads (Control.Effect.Monad). This provides a way\nto embed effect systems into Haskell. For more information see the paper\n\\\"Embedding effect systems in Haskell\\\" by Orchard and Petricek\n<http://dorchard.co.uk/publ/haskell14-effects.pdf> (Haskell, 2014)\nAlso provides the parameterised monad structure due to Atkey in\nControl.Effect.Parameterised along with some instances:\nAtomicState, SafeFiles, ExtensibleState\nand the examples in <https://github.com/dorchard/effect-monad/tree/master/examples>.\n(note, this package was previously called 'ixmonad' until September 2014).";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."type-level-sets" or (buildDepError "type-level-sets"))
          ];
        buildable = true;
        };
      };
    }