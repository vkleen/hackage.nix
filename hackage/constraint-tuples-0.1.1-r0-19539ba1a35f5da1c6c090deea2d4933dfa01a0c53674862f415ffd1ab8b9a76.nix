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
      specVersion = "1.10";
      identifier = { name = "constraint-tuples"; version = "0.1.1"; };
      license = "BSD-3-Clause";
      copyright = "(C) 2018-2019 Ryan Scott";
      maintainer = "ryan.gl.scott@gmail.com";
      author = "Ryan Scott";
      homepage = "https://github.com/RyanGlScott/constraint-tuples";
      url = "";
      synopsis = "Partially applicable constraint tuples";
      description = "This library provides classes that emulate the behavior of\nGHC's constraint tuple syntax. Unlike GHC's built-in\nconstraint tuples, the classes in this library can be\npartially applied.\n\nThis library exposes two different modules that are\nsemantically identical, but compile to slightly different\nCore:\n\n* \"Data.Tuple.Constraint\": A @CTupleN@ class compiles to\na dictionary data type with @N@ fields.\n\n* \"Data.Tuple.Constraint.ClassNewtype\": A @CTupleN@ class\ncompiles to a newtype around the corresponding built-in\nconstraint tuple type with @N@ arguments.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (buildDepError "base")) ];
        buildable = true;
        };
      };
    }