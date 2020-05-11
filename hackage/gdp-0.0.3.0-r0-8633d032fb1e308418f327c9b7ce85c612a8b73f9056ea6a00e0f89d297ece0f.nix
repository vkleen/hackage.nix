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
      identifier = { name = "gdp"; version = "0.0.3.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2018 Matt Noonan";
      maintainer = "matt.noonan@gmail.com";
      author = "Matt Noonan";
      homepage = "https://github.com/matt-noonan/gdp#readme";
      url = "";
      synopsis = "Reason about invariants and preconditions with ghosts of departed proofs.";
      description = "Reason about invariants and preconditions with ghosts of departed proofs.\nThe GDP library implements building blocks for creating and working with\nAPIs that may carry intricate preconditions for proper use. As a library\nauthor, you can use `gdp` to encode your API's preconditions and invariants,\nso that they will be statically checked at compile-time.\nAs a library user, you can use the `gdp` deduction rules to codify your\nproofs that you are using the library correctly.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."lawful" or (buildDepError "lawful"))
          ];
        buildable = true;
        };
      exes = {
        "gdp" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."gdp" or (buildDepError "gdp"))
            ];
          buildable = true;
          };
        };
      };
    }