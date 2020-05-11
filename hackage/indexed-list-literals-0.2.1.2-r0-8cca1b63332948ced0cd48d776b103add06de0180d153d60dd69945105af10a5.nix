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
      identifier = { name = "indexed-list-literals"; version = "0.2.1.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "dmillardurrant@gmail.com";
      author = "David Millar-Durrant";
      homepage = "https://github.com/davidm-d/indexed-list-literals";
      url = "";
      synopsis = "Type safe indexed list literals";
      description = "This is an incredibly simple library, which makes writing lists where the length is known at compile time a little bit nicer.\n\nIf you write a function with the signature\n\n> vector :: ILL input length output => input -> Vector length output\nthen\n\n> v :: Vector 3 Int\n> v = vector (1,2,3)\n>\n> x :: Vector 0 Double\n> x = vector \$ ZeroTuple @Double\n>\n> y :: Vector 1 Double\n> y = vector (Only 1)\n>\n> z :: Vector 2 String\n> z = vector (\"Hello\", \"World\")\n\nIf want matrix literals you can write a function\n\n> matrix :: (ILL row width ty, ILL matrix height row) => matrix -> Matrix width height ty\nthen\n\n> a :: Matrix 0 0 Bool\n> a = matrix \$ ZeroTuple @(ZeroTuple Bool)\n>\n> b :: Matrix 1 2 String\n> b = matrix \$ Only (\"Hello\",\"World\")\n>\n> c :: Matrix 4 5 Double\n> c = matrix ((1,2,3,0,0)\n>            ,(4,5,6,0,0)\n>            ,(7,8,9,0,0)\n>            ,(0,0,0,0,0))\nThe full code is in test\\/Docs.hs\n\nThis only supports literals of length up to 20, though that can be easily extended using the code generator in src\\/Data\\/IndexedListLiterals.hs";
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
        "IndexedListLiterals-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."indexed-list-literals" or (buildDepError "indexed-list-literals"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            ];
          buildable = true;
          };
        };
      };
    }