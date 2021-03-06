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
      identifier = { name = "type-level-tf"; version = "0.2.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2010 Corey O'Connor\nCopyright (c) 2008 Alfonso Acosta, Oleg Kiselyov, Wolfgang Jeltsch\nand KTH's SAM group\n2008 Benedikt Huber (Rewrite using type families)";
      maintainer = "coreyoconnor@gmail.com";
      author = "Corey O'Connor, Alfonso Acosta";
      homepage = "https://github.com/coreyoconnor/type-level-tf";
      url = "";
      synopsis = "Type-level programming library (type families)";
      description = "This library permits performing computations on the type-level. Type-level\nfunctions are implemented using functional dependencies of multi\nparameter type classes.\nTo date, Booleans and Numerals (Naturals and Positives) are\nsupported. With regard to Numerals, there is support for common\narithmetic operations (addition, substraction, multiplication,\ndivision, exponientation, logarithm, maximum, comparison, GCD)\nover natural numbers (using a decimal representation to make\ncompile-time errors friendlier).\nAlthough making use of type-level computations might seem devious and\nobfuscated at first sight, it is indeed useful in practice to implement\nlightweight dependent types such us number-parameterized types (e.g. an array\ntype parameterized by the array's size or a modular group type Zn\nparameterized by the modulus).";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."syb" or (buildDepError "syb"))
          ];
        buildable = true;
        };
      };
    }