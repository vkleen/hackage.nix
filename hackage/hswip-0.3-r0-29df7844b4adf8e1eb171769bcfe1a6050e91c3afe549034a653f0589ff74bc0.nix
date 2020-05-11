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
      identifier = { name = "hswip"; version = "0.3"; };
      license = "LicenseRef-GPL";
      copyright = "(c) Evgeny Tarasov";
      maintainer = "etarasov.ekb@gmail.com";
      author = "";
      homepage = "";
      url = "";
      synopsis = "embedding prolog in haskell";
      description = "Library for embedding swi-prolog in haskell inspired by pyswip.\nYou should install swi-prolog in order to use the library.\nIt is recommended to use swi-prolog-5.10 or newer.\nIf you encounter troubles related to libswipl linking, you need to fix extra-lib-dirs parameter in hswipr.cabal to find libswipl.a in your system.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."haskell98" or (buildDepError "haskell98"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          ];
        libs = [
          (pkgs."swipl" or (sysDepError "swipl"))
          (pkgs."readline" or (sysDepError "readline"))
          (pkgs."ncurses" or (sysDepError "ncurses"))
          ];
        buildable = true;
        };
      };
    }