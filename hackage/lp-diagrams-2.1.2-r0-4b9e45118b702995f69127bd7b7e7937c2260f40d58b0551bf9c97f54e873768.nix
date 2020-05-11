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
    flags = { graphviz = true; };
    package = {
      specVersion = "1.18";
      identifier = { name = "lp-diagrams"; version = "2.1.2"; };
      license = "AGPL-3.0-only";
      copyright = "Jean-Philippe Bernardy";
      maintainer = "jeanphilippe.bernardy@gmail.com";
      author = "Jean-Philippe Bernardy";
      homepage = "";
      url = "";
      synopsis = "An EDSL for diagrams based based on linear constraints";
      description = "A library to describe diagrams. The defining\nfeature of the package is the ability to use linear constraints to\nspecify layout, which are resolved using z3 (latest z3 must be installed).\nBackends are provided either of the following packages lp-diagrams-svg (svg) or marxup (tikz).";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."typography-geometry" or (buildDepError "typography-geometry"))
          (hsPkgs."gasp" or (buildDepError "gasp"))
          (hsPkgs."reflection" or (buildDepError "reflection"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."polynomials-bernstein" or (buildDepError "polynomials-bernstein"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."labeled-tree" or (buildDepError "labeled-tree"))
          (hsPkgs."parsek" or (buildDepError "parsek"))
          (hsPkgs."process" or (buildDepError "process"))
          ] ++ (pkgs.lib).optional (flags.graphviz) (hsPkgs."graphviz" or (buildDepError "graphviz"));
        buildable = true;
        };
      };
    }