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
      identifier = { name = "Prelude"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2017-2018 Herbert Valerio Riedel";
      maintainer = "hvr@gnu.org";
      author = "Herbert Valerio Riedel";
      homepage = "";
      url = "";
      synopsis = "A Prelude module replacement";
      description = "This package provides a \"Prelude\" module drop-in replacement for [base](https://hackage.haskell.org/package/base)'s @Prelude@ module.\n\nGoals of this package include:\n\n* Be reasonably modest and remain close in spirit to the @base@ package's scope\n\n* Depend only on @base@ (via @base-noprelude@) for recent GHC versions\n\n* Avoid partial functions being in scope by default; redefine common partial functions such as @read@ or @head@ to be 'Maybe'-valued\n\n* Provide a uniform \"Prelude\" across multiple GHC releases (currently GHC 7.0 and newer supported) to the extent possible given typeclass restructurings such as AMP or FTP\n\n* Reduce @import@ clutter by reexporting common verbs from modules such as @Control.Monad@ and @Control.Applicative@\n\n=== Versioning and Usage\n\nThis package is intended to be used in combination with [base-noprelude](https://hackage.haskell.org/package/base-noprelude) and\npossibly [base-orphans](https://hackage.haskell.org/package/base-orphans). @Prelude@ strives to be faithful to\nthe [PVP](https://pvp.haskell.org/); however, for technical reasons @Prelude@'s API is not fully determined by its version due to changes in core typeclasses and consequently it's strongly advised to declare a dependency on @Prelude@ always in conjunction with a dependency on @base-noprelude@.\n\nFor instance, all you need to do in order to use this package if you were previously depending on [base](https://hackage.haskell.org/package/base) via\n\n> build-depends:\n>     base ^>= 4.10.0.0 || ^>= 4.11.0.0\n\nis to replace @base@ by @base-noprelude@ and also add a dependency on @Prelude@ like so\n\n> build-depends:\n>     Prelude ^>= 0.1.0.0\n>   , base-noprelude ^>= 4.10.0.0 || ^>= 4.11.0.0\n\nand this will effectively replace the implicit \"Prelude\" module.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base-noprelude" or (buildDepError "base-noprelude"))
          ] ++ (pkgs.lib).optionals (!(compiler.isGhc && (compiler.version).ge "8.0")) [
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."fail" or (buildDepError "fail"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ]) ++ (pkgs.lib).optional (compiler.isGhc && false) (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"));
        buildable = true;
        };
      };
    }