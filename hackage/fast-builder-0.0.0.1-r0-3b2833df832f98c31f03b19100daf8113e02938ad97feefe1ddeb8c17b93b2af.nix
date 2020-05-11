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
      identifier = { name = "fast-builder"; version = "0.0.0.1"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "aljee@hyper.cx";
      author = "Takano Akio";
      homepage = "http://github.com/takano-akio/fast-builder";
      url = "";
      synopsis = "Fast ByteString Builder";
      description = "An efficient implementation of ByteString builder. It should be faster than\nthe standard implementation in most cases.\n\nIn many benchmarks, the performance improvement is 2x-10x.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          ];
        buildable = true;
        };
      tests = {
        "prop" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fast-builder" or (buildDepError "fast-builder"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."process" or (buildDepError "process"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "aeson" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fast-builder" or (buildDepError "fast-builder"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."true-name" or (buildDepError "true-name"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            ];
          buildable = true;
          };
        "vector" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fast-builder" or (buildDepError "fast-builder"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            ];
          buildable = true;
          };
        "map" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fast-builder" or (buildDepError "fast-builder"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            ];
          buildable = true;
          };
        };
      };
    }