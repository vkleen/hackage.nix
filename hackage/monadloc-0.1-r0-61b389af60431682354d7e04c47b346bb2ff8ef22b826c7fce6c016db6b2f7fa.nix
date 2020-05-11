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
    flags = { syb-in-base = false; };
    package = {
      specVersion = "1.2.3";
      identifier = { name = "monadloc"; version = "0.1"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "pepeiborra@gmail.com";
      author = "Pepe Iborra";
      homepage = "http://github.com/pepeiborra/monadloc";
      url = "";
      synopsis = "A class for monads which can keep a stack trace";
      description = "This package defines a class for monads which can keep a monadic call trace.\n\n. See http://pepeiborra.posterous.com/monadic-stack-traces-that-make-a-lot-of-sense for more information.\n\nA preprocessor is provided which can insert calls\nto withLoc before every monadic statement in a module.\n\nTo invoke the preprocessor, add the following pragma at the top of a source file:\n\n> {-# OPTIONS_GHC -F -pgmF MonadLoc #-}\n\ntogether with an import for the @Control.Monad.Loc@ module\n\nThis package provides no implementation of the MonadLoc interface.\nCurrently the only package that does so is \"control-monad-exception\",\nbut any other package can implement it and provide monadic call traces.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."pretty" or (buildDepError "pretty"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          ] ++ (if flags.syb-in-base
          then [ (hsPkgs."base" or (buildDepError "base")) ]
          else [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."syb" or (buildDepError "syb"))
            ]);
        buildable = true;
        };
      exes = {
        "MonadLoc" = {
          depends = [
            (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
            ];
          buildable = true;
          };
        };
      };
    }