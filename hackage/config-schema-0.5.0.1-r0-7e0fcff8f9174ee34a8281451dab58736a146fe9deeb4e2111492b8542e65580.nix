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
    flags = { use-semigroups = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "config-schema"; version = "0.5.0.1"; };
      license = "ISC";
      copyright = "Eric Mertens 2017";
      maintainer = "emertens@gmail.com";
      author = "Eric Mertens";
      homepage = "https://github.com/glguy/config-schema";
      url = "";
      synopsis = "Schema definitions for the config-value package";
      description = "This package makes it possible to defined schemas for use when\nloading configuration files using the config-value format.\nThese schemas can be used to be process a configuration file into\na Haskell value, or to automatically generate documentation for\nthe file format.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."config-value" or (buildDepError "config-value"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."free" or (buildDepError "free"))
          (hsPkgs."kan-extensions" or (buildDepError "kan-extensions"))
          (hsPkgs."pretty" or (buildDepError "pretty"))
          (hsPkgs."semigroupoids" or (buildDepError "semigroupoids"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ] ++ (if flags.use-semigroups
          then [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."semigroups" or (buildDepError "semigroups"))
            ]
          else [ (hsPkgs."base" or (buildDepError "base")) ]);
        buildable = true;
        };
      tests = {
        "unit-tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."config-value" or (buildDepError "config-value"))
            (hsPkgs."config-schema" or (buildDepError "config-schema"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }