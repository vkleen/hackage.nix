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
    flags = { install-examples = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "fraxl"; version = "0.3.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2016 Will Fancher";
      maintainer = "willfancher38@gmail.com";
      author = "Will Fancher";
      homepage = "https://github.com/ElvishJerricco/fraxl";
      url = "";
      synopsis = "Cached and parallel data fetching.";
      description = "Fraxl is a free monad designed to make concurrent data fetching easy.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."free" or (buildDepError "free"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."dependent-sum" or (buildDepError "dependent-sum"))
          (hsPkgs."dependent-map" or (buildDepError "dependent-map"))
          (hsPkgs."type-aligned" or (buildDepError "type-aligned"))
          (hsPkgs."fastsum" or (buildDepError "fastsum"))
          ];
        buildable = true;
        };
      exes = {
        "examples" = {
          depends = (pkgs.lib).optionals (flags.install-examples) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fraxl" or (buildDepError "fraxl"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          buildable = if flags.install-examples then true else false;
          };
        };
      benchmarks = {
        "monadbench" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fraxl" or (buildDepError "fraxl"))
            (hsPkgs."time" or (buildDepError "time"))
            ];
          buildable = true;
          };
        };
      };
    }