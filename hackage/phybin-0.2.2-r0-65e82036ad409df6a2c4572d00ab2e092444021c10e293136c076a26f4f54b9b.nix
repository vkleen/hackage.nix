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
      identifier = { name = "phybin"; version = "0.2.2"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2010 Ryan Newton";
      maintainer = "Ryan Newton <rrnewton@gmail.com>";
      author = "Ryan Newton <rrnewton@gmail.com>";
      homepage = "http://people.csail.mit.edu/newton/phybin/";
      url = "";
      synopsis = "Utility for clustering phylogenetic trees in Newick format based on Robinson-Foulds distance.";
      description = "This package provides a libary and executable for dealing with Newick tree files.\n\nIt can do simple binning of identical trees or more complex clustering based on\nan all-to-all Robinson-Foulds distance matrix.\n\nOutput files that characterize the size and contents of each bin or cluster (including\ngenerating GraphViz-based visual representations of the tree topologies).";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."graphviz" or (buildDepError "graphviz"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."prettyclass" or (buildDepError "prettyclass"))
          (hsPkgs."fgl" or (buildDepError "fgl"))
          (hsPkgs."HSH" or (buildDepError "HSH"))
          (hsPkgs."HUnit" or (buildDepError "HUnit"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."bitvec" or (buildDepError "bitvec"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."hierarchical-clustering" or (buildDepError "hierarchical-clustering"))
          ];
        buildable = true;
        };
      exes = {
        "phybin" = {
          depends = [
            (hsPkgs."phybin" or (buildDepError "phybin"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."graphviz" or (buildDepError "graphviz"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."prettyclass" or (buildDepError "prettyclass"))
            (hsPkgs."fgl" or (buildDepError "fgl"))
            (hsPkgs."HSH" or (buildDepError "HSH"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."bitvec" or (buildDepError "bitvec"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."hierarchical-clustering" or (buildDepError "hierarchical-clustering"))
            ];
          buildable = true;
          };
        };
      };
    }