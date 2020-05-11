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
      identifier = { name = "chan-split"; version = "0.1.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "brandon.m.simmons@gmail.com";
      author = "Brandon Simmons";
      homepage = "http://coder.bsimmons.name/blog/2011/07/module-chan-split-released/";
      url = "";
      synopsis = "Concurrent Chans as read/write pairs. Also provides generic\nChan, Cofunctor classes.";
      description = "A wrapper around Control.Concurrent.Chan that splits a Chan\ninto a pair, one of which allows only read operations, the\nother write operations.\n\nThis makes code easier to reason about, allows us to define\nuseful instances ('Functor' and 'Cofunctor') on the chan\npairs.\n\nIn addition this package provides a module that defines a\npair of classes 'ReadableChan' and 'WritableChan' which\ndefines the basic methods any Chan type should provide.\n\nTo use standard Chans with these polymorphic functions,\nimport as follows:\n\n> import Control.Concurrent.Chan hiding (readChan,writeChan,writeList2Chan)\n> import Control.Concurrent.Chan.Class\n\nWhen used alongside standard Chans, the Split module can be\nimported qualified like:\n\n> import qualified Control.Concurrent.Chan.Split as S\n\nNote, we do not implement the deprecated unGetChan and\nisEmptyChan functions.\n\nThis module is used internally by the simple-actors package.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (buildDepError "base")) ];
        buildable = true;
        };
      };
    }