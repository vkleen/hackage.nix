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
      identifier = { name = "representable-functors"; version = "2.0.0.5"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2011 Edward A. Kmett";
      maintainer = "Edward A. Kmett <ekmett@gmail.com>";
      author = "Edward A. Kmett";
      homepage = "http://github.com/ekmett/representable-functors/";
      url = "";
      synopsis = "Representable functors";
      description = "Representable functors";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."comonad" or (buildDepError "comonad"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."contravariant" or (buildDepError "contravariant"))
          (hsPkgs."distributive" or (buildDepError "distributive"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."semigroupoids" or (buildDepError "semigroupoids"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."keys" or (buildDepError "keys"))
          (hsPkgs."free" or (buildDepError "free"))
          (hsPkgs."comonad-transformers" or (buildDepError "comonad-transformers"))
          (hsPkgs."comonads-fd" or (buildDepError "comonads-fd"))
          (hsPkgs."data-lens" or (buildDepError "data-lens"))
          ];
        buildable = true;
        };
      };
    }