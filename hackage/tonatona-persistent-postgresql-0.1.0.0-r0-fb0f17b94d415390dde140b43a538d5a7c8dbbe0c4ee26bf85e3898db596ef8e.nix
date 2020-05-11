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
        name = "tonatona-persistent-postgresql";
        version = "0.1.0.0";
        };
      license = "MIT";
      copyright = "2018 Kadzuya Okamoto";
      maintainer = "arow.okamoto+github@gmail.com";
      author = "Kadzuya Okamoto, Dennis Gosnell";
      homepage = "https://github.com/tonatona-project/tonatona#readme";
      url = "";
      synopsis = "tonatona plugin for accessing PostgreSQL database.";
      description = "Tonatona plugin for accessing PostgreSQL database. This package provides a tonatona plugin for accessing PostgreSQL database. This plugin uses persistent to actually accessing PostgreSQL.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
          (hsPkgs."persistent" or (buildDepError "persistent"))
          (hsPkgs."persistent-postgresql" or (buildDepError "persistent-postgresql"))
          (hsPkgs."resource-pool" or (buildDepError "resource-pool"))
          (hsPkgs."rio" or (buildDepError "rio"))
          (hsPkgs."tonaparser" or (buildDepError "tonaparser"))
          (hsPkgs."tonatona" or (buildDepError "tonatona"))
          ];
        buildable = true;
        };
      tests = {
        "doctest" = {
          depends = [
            (hsPkgs."Glob" or (buildDepError "Glob"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
            (hsPkgs."persistent" or (buildDepError "persistent"))
            (hsPkgs."persistent-postgresql" or (buildDepError "persistent-postgresql"))
            (hsPkgs."resource-pool" or (buildDepError "resource-pool"))
            (hsPkgs."rio" or (buildDepError "rio"))
            (hsPkgs."tonaparser" or (buildDepError "tonaparser"))
            (hsPkgs."tonatona" or (buildDepError "tonatona"))
            ];
          buildable = true;
          };
        "spec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
            (hsPkgs."persistent" or (buildDepError "persistent"))
            (hsPkgs."persistent-postgresql" or (buildDepError "persistent-postgresql"))
            (hsPkgs."resource-pool" or (buildDepError "resource-pool"))
            (hsPkgs."rio" or (buildDepError "rio"))
            (hsPkgs."tonaparser" or (buildDepError "tonaparser"))
            (hsPkgs."tonatona" or (buildDepError "tonatona"))
            ];
          buildable = true;
          };
        };
      };
    }