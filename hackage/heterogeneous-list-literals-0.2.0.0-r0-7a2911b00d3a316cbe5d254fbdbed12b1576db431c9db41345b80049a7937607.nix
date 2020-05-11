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
      identifier = {
        name = "heterogeneous-list-literals";
        version = "0.2.0.0";
        };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "dmillardurrant@gmail.com";
      author = "David Millar-Durrant";
      homepage = "https://github.com/davidm-d/heterogeneous-list-literals";
      url = "";
      synopsis = "Allows the use of tuples as literals for Heterogeneous collections";
      description = "This is an incredibly simple library, which makes writing literals for heterogeneous collections easy\n\nIf you write a function with the signature\n\n> hList :: HLL input output => input -> HList output\nthen\n\n> a :: HList '[]\n> a = hList ()\n>\n> b :: HList '[Bool]\n> b = hList (Only True)\n>\n> c :: HList '[Bool, Int, Double, String]\n> c = hList (True, 24, 10.5, \"Fire\")\n\nThe full code is in test\\/Docs.hs\n\nThis only supports literals of length up to 20, though that can be easily extended using the code generator in src\\/Data\\/HeterogeneousListLiterals";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."Only" or (buildDepError "Only"))
          ];
        buildable = true;
        };
      tests = {
        "HeterogenousListLiterals-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."heterogeneous-list-literals" or (buildDepError "heterogeneous-list-literals"))
            ];
          buildable = true;
          };
        };
      };
    }