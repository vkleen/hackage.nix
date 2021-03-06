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
      identifier = { name = "hPDB-examples"; version = "0.99"; };
      license = "BSD-3-Clause";
      copyright = "Copyright by Michal J. Gajda '2009-'2012";
      maintainer = "mjgajda@googlemail.com";
      author = "Michal J. Gajda";
      homepage = "https://github.com/mgajda/hpdb";
      url = "http://hackage.haskell.org/package/hPDB";
      synopsis = "Parser, print and manipulate structures in PDB file format.";
      description = "Protein Data Bank file format is a most popular format for holding biomolecule data. This is a very fast parser (below 7s for the largest entry in PDB - 1HTQ which is over 70MB - as compared with 11s of RASMOL 2.7.5, or 2m15s of BioPython with Python 2.6 interpreter.) It is aimed to not only deliver event-based interface, but also a high-level data structure for manipulating data in spirit of BioPython's PDB parser. ";
      buildType = "Simple";
      };
    components = {
      exes = {
        "PDB2Fasta" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."AC-Vector" or (buildDepError "AC-Vector"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."hPDB" or (buildDepError "hPDB"))
            ];
          buildable = true;
          };
        "ShiftToCenter" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."AC-Vector" or (buildDepError "AC-Vector"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."hPDB" or (buildDepError "hPDB"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        "CleanPDB" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."AC-Vector" or (buildDepError "AC-Vector"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."hPDB" or (buildDepError "hPDB"))
            ];
          buildable = true;
          };
        "SplitModels" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."AC-Vector" or (buildDepError "AC-Vector"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."hPDB" or (buildDepError "hPDB"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        "CanonicalAxes" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."AC-Vector" or (buildDepError "AC-Vector"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."hPDB" or (buildDepError "hPDB"))
            ];
          buildable = true;
          };
        "PrintEvents" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."AC-Vector" or (buildDepError "AC-Vector"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."hPDB" or (buildDepError "hPDB"))
            ];
          buildable = true;
          };
        "PrintStructureObject" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."AC-Vector" or (buildDepError "AC-Vector"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."hPDB" or (buildDepError "hPDB"))
            ];
          buildable = true;
          };
        "Rg" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."AC-Vector" or (buildDepError "AC-Vector"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."hPDB" or (buildDepError "hPDB"))
            ];
          buildable = true;
          };
        "StericClashCheck" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."AC-Vector" or (buildDepError "AC-Vector"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."Octree" or (buildDepError "Octree"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."text-format" or (buildDepError "text-format"))
            (hsPkgs."hPDB" or (buildDepError "hPDB"))
            ];
          buildable = true;
          };
        "Viewer" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."AC-Vector" or (buildDepError "AC-Vector"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."OpenGL" or (buildDepError "OpenGL"))
            (hsPkgs."GLUT" or (buildDepError "GLUT"))
            (hsPkgs."hPDB" or (buildDepError "hPDB"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        };
      };
    }