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
      identifier = { name = "type-level-sets"; version = "0.8.5.0"; };
      license = "BSD-3-Clause";
      copyright = "2013-16 University of Cambridge";
      maintainer = "Dominic Orchard";
      author = "Dominic Orchard";
      homepage = "";
      url = "";
      synopsis = "Type-level sets and finite maps (with value-level counterparts)";
      description = "This package provides type-level sets (no duplicates, sorted to provide a normal form) via 'Set' and type-level\nfinite maps via 'Map', with value-level counterparts.\n\nDescribed in the paper \\\"Embedding effect systems in Haskell\\\" by Dominic Orchard\nand Tomas Petricek <http://www.cl.cam.ac.uk/~dao29/publ/haskell14-effects.pdf> (Haskell Symposium, 2014). This version now uses Quicksort to normalise the representation.\n\nHere is a brief example for finite maps:\n\n>\n> import Data.Type.Map\n>\n> -- Specify how to combine duplicate key-value pairs for Int values\n> type instance Combine Int Int = Int\n> instance Combinable Int Int where\n>     combine x y = x + y\n>\n> foo :: Map '[\"x\" :-> Int, \"z\" :-> Bool, \"w\" :-> Int]\n> foo = Ext (Var :: (Var \"x\")) 2\n>     \$ Ext (Var :: (Var \"z\")) True\n>     \$ Ext (Var :: (Var \"w\")) 5\n>     \$ Empty\n>\n> bar :: Map '[\"y\" :-> Int, \"w\" :-> Int]\n> bar = Ext (Var :: (Var \"y\")) 3\n>     \$ Ext (Var :: (Var \"w\")) 1\n>     \$ Empty\n>\n> -- foobar :: Map '[\"w\" :-> Int, \"x\" :-> Int, \"y\" :-> Int, \"z\" :-> Bool]\n> foobar = foo `union` bar\n\nThe 'Map' type for 'foobar' here shows the normalised form (sorted with no duplicates).\nThe type signatures is commented out as it can be infered. Running the example we get:\n\n> >>> foobar\n> {w :-> 6, x :-> 2, y :-> 3, z :-> True}\n\nThus, we see that the values for \\\"w\\\" are added together.\nFor sets, here is an example:\n\n> import GHC.TypeLits\n> import Data.Type.Set\n> type instance Cmp (Natural n) (Natural m) = CmpNat n m\n>\n> data Natural (a :: Nat) where\n>   Z :: Natural 0\n>   S :: Natural n -> Natural (n + 1)\n>\n> -- foo :: Set '[Natural 0, Natural 1, Natural 3]\n> foo = asSet \$ Ext (S Z) (Ext (S (S (S Z))) (Ext Z Empty))\n>\n> -- bar :: Set '[Natural 1, Natural 2]\n> bar = asSet \$ Ext (S (S Z)) (Ext (S Z) (Ext (S Z) Empty))\n>\n> -- foobar :: Set '[Natural 0, Natural 1, Natural 2, Natural 3]\n> foobar = foo `union` bar\n\nNote the types here are all inferred.\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          ];
        buildable = true;
        };
      };
    }