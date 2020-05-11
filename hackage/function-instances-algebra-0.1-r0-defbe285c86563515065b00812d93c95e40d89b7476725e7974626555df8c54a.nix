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
      identifier = { name = "function-instances-algebra"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "tob.brandt@gmail.com";
      author = "Tobias Brandt";
      homepage = "github.com/kreuzschlitzschraubenzieher/function-instances-algebra";
      url = "";
      synopsis = "Instances of the Algebra.* classes for functions";
      description = "This package provides instances for functions @(k -> a)@ of the classes\nAbsolute, Algebraic, Differential, Field, Lattice, Monoid, Ring and Transcendental\nfrom the numeric-prelude package. An instance for Additive already comes with the\noriginal package.\n\nIf @a@ has an instance for one of the classes, then @(k -> a)@ has too.\nThe instances do what you would expect. Values become constant functions:\n\n@\nzero = const zero\n@\n\nUnary functions are composed:\n\n@\nsin f = sin . f\n@\n\nBinary functions fan out the input and combine both results:\n\n@\nf + g = \\\\x -> f x + g x\n@\n\nYou can either import them separately or import @Data.Function.Instances.Algebra@ to\nget them all at once.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."numeric-prelude" or (buildDepError "numeric-prelude"))
          ];
        buildable = true;
        };
      };
    }