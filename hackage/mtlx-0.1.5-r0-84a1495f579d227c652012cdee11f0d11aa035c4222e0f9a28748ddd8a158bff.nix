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
      specVersion = "0";
      identifier = { name = "mtlx"; version = "0.1.5"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "marks@ittc.ku.edu";
      author = "Mark Snyder";
      homepage = "";
      url = "";
      synopsis = "Monad transformer library with type indexes,\nproviding 'free' copies.";
      description = "A monad transformer library with type indexes, which allows the\nprogrammer to get a distinct copy of one of the monads without\nreproducing definitions and instances.  It currently\nsupports IdentityX, ReaderX, StateX, WriterX, RWSX, and ErrorX\nmonads (and their transformer versions).  All these copies can be\ncombined into a transformer stack, including any of the original\nmtl monads. Inspired by the original mtl.  That library was\ninspired by the paper /Functional Programming with Overloading and\nHigher-Order Polymorphism/, by Mark P Jones\n(<http://web.cecs.pdx.edu/~mpj/pubs/springschool.html>), Advanced\nSchool of Functional Programming, 1995.  See the Examples.hs file\nfor usage.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          ];
        buildable = true;
        };
      };
    }