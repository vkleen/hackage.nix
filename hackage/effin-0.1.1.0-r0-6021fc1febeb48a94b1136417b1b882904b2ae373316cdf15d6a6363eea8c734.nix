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
    flags = { mtl = true; };
    package = {
      specVersion = "1.10";
      identifier = { name = "effin"; version = "0.1.1.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2014 Anthony Vandikas";
      maintainer = "yellpika@gmail.com";
      author = "Anthony Vandikas";
      homepage = "https://github.com/YellPika/effin";
      url = "";
      synopsis = "A Typeable-free implementation of extensible effects";
      description = "This package implements extensible effects, and alternative to monad\ntransformers. The original paper can be found at\n<http://okmij.org/ftp/Haskell/extensible/exteff.pdf>. The main differences\nbetween this library and the one described in the paper are that this library\ndoes not use the Typeable type class, and has a simpler API for handling\neffects.\n\nFor example, the following code implements a handler for exceptions:\n\n> runException :: Effect (Exception e ': es) a -> Effect es (Either e a)\n> runException =\n>     handle (\\x -> return (Right x))\n>     \$ eliminate (\\(Exception e) -> return (Left e))\n>     \$ defaultRelay\n\nCompare this to the corresponding code in extensible-effects\n(<http://hackage.haskell.org/package/extensible-effects>):\n\n> runExc :: Typeable e => Eff (Exc e :> r) a -> Eff r (Either e a)\n> runExc = loop . admin\n>   where\n>     loop (Val x) = return (Right x)\n>     loop (E u)   = handleRelay u loop (\\(Exc e) -> return (Left e))\n\nIn particular:\n\n* Effect implementors are not required to do any recursion.\n\n* The functions for writing effect handlers can be easily composed.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          ] ++ (pkgs.lib).optional (flags.mtl) (hsPkgs."mtl" or (buildDepError "mtl"));
        buildable = true;
        };
      };
    }