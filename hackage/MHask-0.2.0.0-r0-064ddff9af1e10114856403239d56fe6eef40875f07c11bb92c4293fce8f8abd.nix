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
      identifier = { name = "MHask"; version = "0.2.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "danburton.email@gmail.com";
      author = "Dan Burton";
      homepage = "https://github.com/DanBurton/MHask#readme";
      url = "";
      synopsis = "The category of monads";
      description = "MHask is the category where\n\n* The objects are Haskell types of kind @(* → *)@ that have an instance of `Prelude.Monad'\n\n* An arrow from object m to object n is a Haskell function of the form @(forall x. m x → n x)@\n\n* Arrow composition is merely a specialization of Haskell function composition\n\n* The identity arrow for the object m is the `Prelude.id' function in Haskell,\nspecialized to @(forall x. m x → m x)@\n\nIt is assumed that any instances of the classes provided here also have an instance\nfor Monad of the form @instance (Monad m) ⇒ Monad (t m)@, thus guaranteeing that @(t m)@\n(or @(t i j m)@ for the indexed types) is always a Monad. If it were valid Haskell, I'd write:\n\n> class (forall m. Monad m ⇒ Monad (t m)) ⇒ Functor t\n\n'MHask.Functor.Functor' should actually be called Endofunctor, because if m is an object in MHask,\nthen an instance t of `Functor' can map object m to object (t m), and arrows from\nm to n get mapped to arrows from (t m) to (t n).";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ];
        buildable = true;
        };
      };
    }