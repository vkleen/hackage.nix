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
      identifier = { name = "list-t-attoparsec"; version = "0.4.0.0"; };
      license = "MIT";
      copyright = "(c) 2015, Nikita Volkov";
      maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/nikita-volkov/list-t-attoparsec";
      url = "";
      synopsis = "An \"attoparsec\" adapter for \"list-t\"";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."list-t" or (buildDepError "list-t"))
          (hsPkgs."either" or (buildDepError "either"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."base-prelude" or (buildDepError "base-prelude"))
          ];
        buildable = true;
        };
      tests = {
        "hspec" = {
          depends = [
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."list-t-attoparsec" or (buildDepError "list-t-attoparsec"))
            (hsPkgs."list-t-text" or (buildDepError "list-t-text"))
            (hsPkgs."list-t" or (buildDepError "list-t"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."either" or (buildDepError "either"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."base-prelude" or (buildDepError "base-prelude"))
            ];
          buildable = true;
          };
        };
      };
    }