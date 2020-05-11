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
      specVersion = "2.2";
      identifier = { name = "supervisors"; version = "0.1.0.0"; };
      license = "MIT";
      copyright = "2018 Ian Denhardt";
      maintainer = "ian@zenhack.net";
      author = "Ian Denhardt";
      homepage = "https://github.com/zenhack/haskell-supervisors";
      url = "";
      synopsis = "Monitor groups of threads with non-hierarchical lifetimes.";
      description = "The @supervisors@ package provides a useful abstraction for managing the\ngroups of Haskell threads, which may not have a strictly hierarchical\nstructure to their lifetimes.\n\nConcretely, the library provides a `Supervisor` construct, which can be\nused to safely spawn threads while guaranteeing that:\n\n* When the supervisor is killed, all of the threads it supervises will be\nkilled.\n* Child threads can terminate in any order, and memory usage will always\nbe proportional to the number of *live* supervised threads.\n\nOne way to think of it is that @supervisors@ is to @async@ as\n@resourcet@ is to @bracket@.\n\nNote that this package is EXPERIMENTAL; it needs more careful testing before\nI can earnestly recommend relying on it.\n\nSee the README and module documentation for more information.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."unliftio" or (buildDepError "unliftio"))
          (hsPkgs."async" or (buildDepError "async"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."supervisors" or (buildDepError "supervisors"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            ];
          buildable = true;
          };
        };
      };
    }