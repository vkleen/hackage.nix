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
      identifier = { name = "levmar"; version = "1.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2009 - 2011 Roel van Dijk & Bas van Dijk";
      maintainer = "Roel van Dijk <vandijk.roel@gmail.com>\nBas van Dijk <v.dijk.bas@gmail.com>";
      author = "Roel van Dijk <vandijk.roel@gmail.com>\nBas van Dijk <v.dijk.bas@gmail.com>";
      homepage = "https://github.com/basvandijk/levmar/";
      url = "";
      synopsis = "An implementation of the Levenberg-Marquardt algorithm";
      description = "The Levenberg-Marquardt algorithm is an iterative technique that\nfinds a local minimum of a function that is expressed as the sum of\nsquares of nonlinear functions. It has become a standard technique\nfor nonlinear least-squares problems and can be thought of as a\ncombination of steepest descent and the Gauss-Newton method. When\nthe current solution is far from the correct one, the algorithm\nbehaves like a steepest descent method: slow, but guaranteed to\nconverge. When the current solution is close to the correct\nsolution, it becomes a Gauss-Newton method.\n\nOptional box- and linear constraints can be given. Both single and\ndouble precision floating point types are supported.\n\nThe actual algorithm is implemented in a C library which is bundled\nwith @bindings-levmar@ which this package depends on. See:\n<http://www.ics.forth.gr/~lourakis/levmar/>.\n\nA note regarding the license:\n\nThis library depends on @bindings-levmar@ which is bundled together\nwith a C library which falls under the GPL. Please be aware of this\nwhen distributing programs linked with this library. For details see\nthe description and license of @bindings-levmar@.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base-unicode-symbols" or (buildDepError "base-unicode-symbols"))
          (hsPkgs."bindings-levmar" or (buildDepError "bindings-levmar"))
          (hsPkgs."hmatrix" or (buildDepError "hmatrix"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ];
        buildable = true;
        };
      };
    }