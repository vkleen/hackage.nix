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
    flags = {
      l1 = false;
      l2 = false;
      l3 = false;
      l4 = false;
      t1 = false;
      t2 = false;
      t3 = false;
      t5 = false;
      };
    package = {
      specVersion = "1.8";
      identifier = { name = "oberon0"; version = "0.0.1"; };
      license = "LicenseRef-LGPL";
      copyright = "";
      maintainer = "Marcos Viera <mviera@fing.edu.uy>";
      author = "Marcos Viera ";
      homepage = "http://www.cs.uu.nl/wiki/Center/CoCoCo";
      url = "";
      synopsis = "Oberon0 Compiler";
      description = "Oberon0 compiler (from LDTA 2011 challenge) implementation using CoCoCo";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."uulib" or (buildDepError "uulib"))
          (hsPkgs."uu-parsinglib" or (buildDepError "uu-parsinglib"))
          (hsPkgs."murder" or (buildDepError "murder"))
          (hsPkgs."AspectAG" or (buildDepError "AspectAG"))
          (hsPkgs."HList" or (buildDepError "HList"))
          ] ++ (pkgs.lib).optional (flags.t5) (hsPkgs."language-c" or (buildDepError "language-c"));
        buildable = true;
        };
      exes = {
        "l1t1" = {
          depends = [
            (hsPkgs."oberon0" or (buildDepError "oberon0"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."AspectAG" or (buildDepError "AspectAG"))
            (hsPkgs."murder" or (buildDepError "murder"))
            (hsPkgs."uulib" or (buildDepError "uulib"))
            (hsPkgs."uu-parsinglib" or (buildDepError "uu-parsinglib"))
            (hsPkgs."HList" or (buildDepError "HList"))
            ];
          buildable = if !(flags.l1 && flags.t1) then false else true;
          };
        "l1t2" = {
          depends = [
            (hsPkgs."oberon0" or (buildDepError "oberon0"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."AspectAG" or (buildDepError "AspectAG"))
            (hsPkgs."murder" or (buildDepError "murder"))
            (hsPkgs."uulib" or (buildDepError "uulib"))
            (hsPkgs."uu-parsinglib" or (buildDepError "uu-parsinglib"))
            (hsPkgs."HList" or (buildDepError "HList"))
            ];
          buildable = if !(flags.l1 && flags.t2) then false else true;
          };
        "l1t3" = {
          depends = [
            (hsPkgs."oberon0" or (buildDepError "oberon0"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."AspectAG" or (buildDepError "AspectAG"))
            (hsPkgs."murder" or (buildDepError "murder"))
            (hsPkgs."uulib" or (buildDepError "uulib"))
            (hsPkgs."uu-parsinglib" or (buildDepError "uu-parsinglib"))
            (hsPkgs."HList" or (buildDepError "HList"))
            ];
          buildable = if !(flags.l1 && flags.t3) then false else true;
          };
        "l1t5" = {
          depends = [
            (hsPkgs."oberon0" or (buildDepError "oberon0"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."AspectAG" or (buildDepError "AspectAG"))
            (hsPkgs."murder" or (buildDepError "murder"))
            (hsPkgs."uulib" or (buildDepError "uulib"))
            (hsPkgs."uu-parsinglib" or (buildDepError "uu-parsinglib"))
            (hsPkgs."HList" or (buildDepError "HList"))
            (hsPkgs."language-c" or (buildDepError "language-c"))
            ];
          buildable = if !(flags.l1 && flags.t5) then false else true;
          };
        "l2t1" = {
          depends = [
            (hsPkgs."oberon0" or (buildDepError "oberon0"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."AspectAG" or (buildDepError "AspectAG"))
            (hsPkgs."murder" or (buildDepError "murder"))
            (hsPkgs."uulib" or (buildDepError "uulib"))
            (hsPkgs."uu-parsinglib" or (buildDepError "uu-parsinglib"))
            (hsPkgs."HList" or (buildDepError "HList"))
            ];
          buildable = if !(flags.l2 && flags.t1) then false else true;
          };
        "l2t2" = {
          depends = [
            (hsPkgs."oberon0" or (buildDepError "oberon0"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."AspectAG" or (buildDepError "AspectAG"))
            (hsPkgs."murder" or (buildDepError "murder"))
            (hsPkgs."uulib" or (buildDepError "uulib"))
            (hsPkgs."uu-parsinglib" or (buildDepError "uu-parsinglib"))
            (hsPkgs."HList" or (buildDepError "HList"))
            ];
          buildable = if !(flags.l2 && flags.t2) then false else true;
          };
        "l2t3" = {
          depends = [
            (hsPkgs."oberon0" or (buildDepError "oberon0"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."AspectAG" or (buildDepError "AspectAG"))
            (hsPkgs."murder" or (buildDepError "murder"))
            (hsPkgs."uulib" or (buildDepError "uulib"))
            (hsPkgs."uu-parsinglib" or (buildDepError "uu-parsinglib"))
            (hsPkgs."HList" or (buildDepError "HList"))
            ];
          buildable = if !(flags.l2 && flags.t3) then false else true;
          };
        "l2t5" = {
          depends = [
            (hsPkgs."oberon0" or (buildDepError "oberon0"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."AspectAG" or (buildDepError "AspectAG"))
            (hsPkgs."murder" or (buildDepError "murder"))
            (hsPkgs."uulib" or (buildDepError "uulib"))
            (hsPkgs."uu-parsinglib" or (buildDepError "uu-parsinglib"))
            (hsPkgs."HList" or (buildDepError "HList"))
            (hsPkgs."language-c" or (buildDepError "language-c"))
            ];
          buildable = if !(flags.l2 && flags.t5) then false else true;
          };
        "l3t1" = {
          depends = [
            (hsPkgs."oberon0" or (buildDepError "oberon0"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."AspectAG" or (buildDepError "AspectAG"))
            (hsPkgs."murder" or (buildDepError "murder"))
            (hsPkgs."uulib" or (buildDepError "uulib"))
            (hsPkgs."uu-parsinglib" or (buildDepError "uu-parsinglib"))
            (hsPkgs."HList" or (buildDepError "HList"))
            ];
          buildable = if !(flags.l3 && flags.t1) then false else true;
          };
        "l3t2" = {
          depends = [
            (hsPkgs."oberon0" or (buildDepError "oberon0"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."AspectAG" or (buildDepError "AspectAG"))
            (hsPkgs."murder" or (buildDepError "murder"))
            (hsPkgs."uulib" or (buildDepError "uulib"))
            (hsPkgs."uu-parsinglib" or (buildDepError "uu-parsinglib"))
            (hsPkgs."HList" or (buildDepError "HList"))
            ];
          buildable = if !(flags.l3 && flags.t2) then false else true;
          };
        "l3t3" = {
          depends = [
            (hsPkgs."oberon0" or (buildDepError "oberon0"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."AspectAG" or (buildDepError "AspectAG"))
            (hsPkgs."murder" or (buildDepError "murder"))
            (hsPkgs."uulib" or (buildDepError "uulib"))
            (hsPkgs."uu-parsinglib" or (buildDepError "uu-parsinglib"))
            (hsPkgs."HList" or (buildDepError "HList"))
            ];
          buildable = if !(flags.l3 && flags.t3) then false else true;
          };
        "l3t5" = {
          depends = [
            (hsPkgs."oberon0" or (buildDepError "oberon0"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."AspectAG" or (buildDepError "AspectAG"))
            (hsPkgs."murder" or (buildDepError "murder"))
            (hsPkgs."uulib" or (buildDepError "uulib"))
            (hsPkgs."uu-parsinglib" or (buildDepError "uu-parsinglib"))
            (hsPkgs."HList" or (buildDepError "HList"))
            (hsPkgs."language-c" or (buildDepError "language-c"))
            ];
          buildable = if !(flags.l3 && flags.t5) then false else true;
          };
        "l4t1" = {
          depends = [
            (hsPkgs."oberon0" or (buildDepError "oberon0"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."AspectAG" or (buildDepError "AspectAG"))
            (hsPkgs."murder" or (buildDepError "murder"))
            (hsPkgs."uulib" or (buildDepError "uulib"))
            (hsPkgs."uu-parsinglib" or (buildDepError "uu-parsinglib"))
            (hsPkgs."HList" or (buildDepError "HList"))
            ];
          buildable = if !(flags.l4 && flags.t1) then false else true;
          };
        "l4t2" = {
          depends = [
            (hsPkgs."oberon0" or (buildDepError "oberon0"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."AspectAG" or (buildDepError "AspectAG"))
            (hsPkgs."murder" or (buildDepError "murder"))
            (hsPkgs."uulib" or (buildDepError "uulib"))
            (hsPkgs."uu-parsinglib" or (buildDepError "uu-parsinglib"))
            (hsPkgs."HList" or (buildDepError "HList"))
            ];
          buildable = if !(flags.l4 && flags.t2) then false else true;
          };
        "l4t3" = {
          depends = [
            (hsPkgs."oberon0" or (buildDepError "oberon0"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."AspectAG" or (buildDepError "AspectAG"))
            (hsPkgs."murder" or (buildDepError "murder"))
            (hsPkgs."uulib" or (buildDepError "uulib"))
            (hsPkgs."uu-parsinglib" or (buildDepError "uu-parsinglib"))
            (hsPkgs."HList" or (buildDepError "HList"))
            ];
          buildable = if !(flags.l4 && flags.t3) then false else true;
          };
        "l4t5" = {
          depends = [
            (hsPkgs."oberon0" or (buildDepError "oberon0"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."AspectAG" or (buildDepError "AspectAG"))
            (hsPkgs."murder" or (buildDepError "murder"))
            (hsPkgs."uulib" or (buildDepError "uulib"))
            (hsPkgs."uu-parsinglib" or (buildDepError "uu-parsinglib"))
            (hsPkgs."HList" or (buildDepError "HList"))
            (hsPkgs."language-c" or (buildDepError "language-c"))
            ];
          buildable = if !(flags.l4 && flags.t5) then false else true;
          };
        };
      };
    }