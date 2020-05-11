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
      identifier = { name = "hasql"; version = "0.1.0"; };
      license = "MIT";
      copyright = "(c) 2014, Nikita Volkov";
      maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/nikita-volkov/hasql ";
      url = "";
      synopsis = "A minimalistic general high level API for relational databases";
      description = "A robust and concise yet powerful API for communication with arbitrary\nrelational databases. Features:\n\n* Concise and crisp API. Just a few functions and two monads doing all the\nboilerplate job for you.\n\n* Automated management of resources related to connections, transactions and\ncursors.\n\n* A built-in connections pool.\n\n* Employment of prepared statements. Every statement you emit gets prepared\nand cached. This raises the performance of the backend.\n\n* Support for cursors. Allows to fetch virtually limitless result sets in a\nconstant memory using streaming.\n\n* Type-level generation of templates. You just can't write a statement with an\nincorrect number of placeholders.\n\n* Mapping to any types actually supported by the backend.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."hasql-backend" or (buildDepError "hasql-backend"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."ex-pool" or (buildDepError "ex-pool"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."list-t" or (buildDepError "list-t"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."loch-th" or (buildDepError "loch-th"))
          (hsPkgs."placeholders" or (buildDepError "placeholders"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."mmorph" or (buildDepError "mmorph"))
          (hsPkgs."mtl-prelude" or (buildDepError "mtl-prelude"))
          (hsPkgs."base-prelude" or (buildDepError "base-prelude"))
          (hsPkgs."base" or (buildDepError "base"))
          ];
        buildable = true;
        };
      };
    }