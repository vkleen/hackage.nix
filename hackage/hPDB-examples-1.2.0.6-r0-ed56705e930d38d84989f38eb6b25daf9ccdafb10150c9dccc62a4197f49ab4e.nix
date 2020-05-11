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
      identifier = { name = "hPDB-examples"; version = "1.2.0.6"; };
      license = "BSD-3-Clause";
      copyright = "Copyright by Michal J. Gajda '2009-'2013";
      maintainer = "mjgajda@googlemail.com";
      author = "Michal J. Gajda";
      homepage = "https://github.com/BioHaskell/hPDB-examples";
      url = "http://hackage.haskell.org/package/hPDB";
      synopsis = "Examples for hPDB library";
      description = "Examples for handling Protein Data Bank file format.";
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
            (hsPkgs."iterable" or (buildDepError "iterable"))
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
            (hsPkgs."iterable" or (buildDepError "iterable"))
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
            (hsPkgs."iterable" or (buildDepError "iterable"))
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
            (hsPkgs."iterable" or (buildDepError "iterable"))
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
            (hsPkgs."iterable" or (buildDepError "iterable"))
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
            (hsPkgs."iterable" or (buildDepError "iterable"))
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
            (hsPkgs."iterable" or (buildDepError "iterable"))
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
            (hsPkgs."iterable" or (buildDepError "iterable"))
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
            (hsPkgs."iterable" or (buildDepError "iterable"))
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
            (hsPkgs."iterable" or (buildDepError "iterable"))
            ];
          buildable = true;
          };
        };
      tests = {
        "ParserPerformance" = {
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
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."hPDB" or (buildDepError "hPDB"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."iterable" or (buildDepError "iterable"))
            (hsPkgs."IfElse" or (buildDepError "IfElse"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."time" or (buildDepError "time"))
            ];
          buildable = true;
          };
        };
      };
    }