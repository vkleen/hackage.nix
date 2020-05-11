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
      identifier = { name = "semialign-indexed"; version = "1.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Oleg Grenrus <oleg.grenrus@iki.fi>";
      author = "C. McCann, Oleg Grenrus";
      homepage = "https://github.com/isomorphism/these";
      url = "";
      synopsis = "SemialignWithIndex, i.e. izipWith and ialignWith";
      description = "This package provides @SemialignWithIndex@ with two members\n\n@\nclass (FunctorWithIndex i f, Semialign f) => SemialignWithIndex i f | f -> i where\n\\    ialignWith :: (i -> These a b -> c) -> f a -> f b -> f c\n@\n\n@\nclass (SemialignWithIndex i f, Zip f) => ZipWithIndex i f | f -> i where\n\\    izipWith   :: (i -> a -> b -> c)    -> f a -> f b -> f c\n@\n\nSuperclass @FunctorWithIndex@ is from @lens@ package.\nSee https://hackage.haskell.org/package/semialign-optics for @optics@ variant.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."semialign" or (buildDepError "semialign"))
          (hsPkgs."these" or (buildDepError "these"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ] ++ (pkgs.lib).optionals (!(compiler.isGhc && (compiler.version).ge "8.0")) [
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-compat" or (buildDepError "transformers-compat"))
          ];
        buildable = true;
        };
      };
    }