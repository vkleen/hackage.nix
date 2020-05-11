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
      specVersion = "1.18";
      identifier = { name = "kerry"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright: (c) 2019 Nick Hibberd";
      maintainer = "Nick Hibberd <nhibberd@gmail.com>";
      author = "Nick Hibberd <nhibberd@gmail.com>";
      homepage = "https://github.com/nhibberd/kerry#readme";
      url = "";
      synopsis = "Manage and abstract your packer configurations.";
      description = "Kerry is a library for representing and rendering\n<https://www.packer.io/ packer> definitions.\n\nTo get started quickly, see the <https://github.com/nhibberd/kerry/blob/master/src/Kerry/Example.hs example>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."aeson-pretty" or (buildDepError "aeson-pretty"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."errors" or (buildDepError "errors"))
          (hsPkgs."mmorph" or (buildDepError "mmorph"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."transformers-bifunctors" or (buildDepError "transformers-bifunctors"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."kerry" or (buildDepError "kerry"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."mmorph" or (buildDepError "mmorph"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."hedgehog" or (buildDepError "hedgehog"))
            (hsPkgs."hedgehog-corpus" or (buildDepError "hedgehog-corpus"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."temporary-resourcet" or (buildDepError "temporary-resourcet"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            ];
          buildable = true;
          };
        };
      };
    }