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
      identifier = { name = "fpnla"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Pablo Perdomo <pperdomo@fing.edu.uy>, Mauro Blanco <mblanco@fing.edu.uy>";
      author = "Pablo Perdomo, Mauro Blanco";
      homepage = "";
      url = "";
      synopsis = "A library for NLA operations";
      description = "\nThis package defines a framework for linear algebra operations, allowing:\n\n- Definition of multiple instances of BLAS and LAPACK operations.\n\n- Definition of multiple representations of vectors and matrices.\n\n- Arbitrary combination of strategies and structure representations.\n\n- Type-safe manipulation of context information associated to each strategy.\n\n- Definition of specialized strategies for a given representation.\n\nThe framework is based on BLAS (<http://www.netlib.org/blas/>) and LAPACK (<http://www.netlib.org/lapack/>) linear algebra libraries, as these are well known libraries in the area. For this reason the design of the framework is strongly oriented to these libraries. Anyway it is possible to easily define operations not considered in these libraries and still maintaining the above properties.\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (buildDepError "base")) ];
        buildable = true;
        };
      };
    }