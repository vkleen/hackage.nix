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
      specVersion = "1.8";
      identifier = { name = "CC-delcont-ref-tf"; version = "0.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "shelarcy <shelarcy@gmail.com>";
      author = "Oleg Kiselyov";
      homepage = "";
      url = "";
      synopsis = "A monad transformers for multi-prompt delimited control using refercence cells";
      description = "This library implements the superset of the interface described in\n*   /A Monadic Framework for Delimited Continuations/,\nR. Kent Dybvig, Simon Peyton Jones, and Amr Sabry\nJFP, v17, N6, pp. 687--730, 2007.\n<http://www.cs.indiana.edu/cgi-bin/techreports/TRNNN.cgi?trnum=TR615>\n\nThis library is closest to the interface of Dybvig, Peyton Jones and Sabry.\n\"Control.Monad.CC.CCRef\" is derived from the definitional interpreter using\nthe implementation techniques described and justified in the FLOPS 2010 paper.\nThe monad transformer 'CC' implemented by \"Control.Monad.CC.CCRef\" requires\nthe base monad to support reference cells. In other words, the base monad\nmust be a member of the type class 'MonadRef': that is, must be 'IO', 'ST',\n'STM' or their transformer. \"Control.Monad.CC.CCRef\" adds to the original\ninterface the frequently used function 'abortP' as a primitive.\n\nSee the original article at <http://okmij.org/ftp/continuations/implementations.html#CC-monads>\nfor more information.\n\nThis package uses <http://hackage.haskell.org/package/ref-tf>'s 'MonadRef' class\ninstead of 'Mutation' class what is used in\n<http://hackage.haskell.org/package/CC-delcont-ref> package.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."ref-tf" or (buildDepError "ref-tf"))
          ];
        buildable = true;
        };
      };
    }