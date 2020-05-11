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
      identifier = { name = "resource-simple"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "anarchomorphism@seomraspraoi.org";
      author = "Robin Banks";
      homepage = "";
      url = "";
      synopsis = "Allocate resources which are guaranteed to be released.";
      description = "This is a simplified, standalone version of the @ResourceT@ transformer that\nwas originally developed as part of the @conduit@ package. That version of\n@ResourceT@ was supported by a complicated hierarchy of type classes, the\nmain purpose of which was to enable the usage of @ResourceT@ on top of the\n@ST@ monad. However, this doesn't really make much sense conceptually, and\nthe reason it was done is because conduits are very closely tied to\n@ResourceT@, and an instance for @ST@ would enable the usage of @ResourceT@\nin pure code.\n\nThis package completely does away with the supporting type class hierarchy,\nand as such, this version of @ResourceT@ can only be used with @IO@ or\n@IO@-like monads.\n\nThis package is motivated by a belief that the iteratee problem and the\nresource finalization problem are orthogonal. This package is ideal for\nusage with the @pipes@ library.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."monad-fork" or (buildDepError "monad-fork"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          ];
        buildable = true;
        };
      };
    }