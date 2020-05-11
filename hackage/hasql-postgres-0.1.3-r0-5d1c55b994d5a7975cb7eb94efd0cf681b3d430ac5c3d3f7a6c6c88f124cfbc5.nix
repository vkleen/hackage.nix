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
      identifier = { name = "hasql-postgres"; version = "0.1.3"; };
      license = "MIT";
      copyright = "(c) 2014, Nikita Volkov";
      maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/nikita-volkov/hasql-postgres ";
      url = "";
      synopsis = "A \"PostgreSQL\" backend for the \"hasql\" library";
      description = "This library provides a \\\"PostgreSQL\\\" driver for\n<http://hackage.haskell.org/package/hasql the \"hasql\" library>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."hasql-backend" or (buildDepError "hasql-backend"))
          (hsPkgs."postgresql-libpq" or (buildDepError "postgresql-libpq"))
          (hsPkgs."base16-bytestring" or (buildDepError "base16-bytestring"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."hashtables" or (buildDepError "hashtables"))
          (hsPkgs."scientific" or (buildDepError "scientific"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."mmorph" or (buildDepError "mmorph"))
          (hsPkgs."list-t" or (buildDepError "list-t"))
          (hsPkgs."loch-th" or (buildDepError "loch-th"))
          (hsPkgs."placeholders" or (buildDepError "placeholders"))
          (hsPkgs."mtl-prelude" or (buildDepError "mtl-prelude"))
          (hsPkgs."base-prelude" or (buildDepError "base-prelude"))
          (hsPkgs."base" or (buildDepError "base"))
          ];
        buildable = true;
        };
      tests = {
        "library-tests" = {
          depends = [
            (hsPkgs."HTF" or (buildDepError "HTF"))
            (hsPkgs."quickcheck-instances" or (buildDepError "quickcheck-instances"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."hasql" or (buildDepError "hasql"))
            (hsPkgs."postgresql-libpq" or (buildDepError "postgresql-libpq"))
            (hsPkgs."base16-bytestring" or (buildDepError "base16-bytestring"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."hashtables" or (buildDepError "hashtables"))
            (hsPkgs."Decimal" or (buildDepError "Decimal"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."mmorph" or (buildDepError "mmorph"))
            (hsPkgs."list-t" or (buildDepError "list-t"))
            (hsPkgs."loch-th" or (buildDepError "loch-th"))
            (hsPkgs."placeholders" or (buildDepError "placeholders"))
            (hsPkgs."mtl-prelude" or (buildDepError "mtl-prelude"))
            (hsPkgs."base-prelude" or (buildDepError "base-prelude"))
            (hsPkgs."base" or (buildDepError "base"))
            ];
          buildable = true;
          };
        "tests" = {
          depends = [
            (hsPkgs."hasql-postgres" or (buildDepError "hasql-postgres"))
            (hsPkgs."hasql-backend" or (buildDepError "hasql-backend"))
            (hsPkgs."hasql" or (buildDepError "hasql"))
            (hsPkgs."HTF" or (buildDepError "HTF"))
            (hsPkgs."quickcheck-instances" or (buildDepError "quickcheck-instances"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."SafeSemaphore" or (buildDepError "SafeSemaphore"))
            (hsPkgs."slave-thread" or (buildDepError "slave-thread"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."list-t" or (buildDepError "list-t"))
            (hsPkgs."mtl-prelude" or (buildDepError "mtl-prelude"))
            (hsPkgs."base-prelude" or (buildDepError "base-prelude"))
            (hsPkgs."base" or (buildDepError "base"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "competition" = {
          depends = [
            (hsPkgs."HDBC" or (buildDepError "HDBC"))
            (hsPkgs."HDBC-postgresql" or (buildDepError "HDBC-postgresql"))
            (hsPkgs."postgresql-simple" or (buildDepError "postgresql-simple"))
            (hsPkgs."hasql-postgres" or (buildDepError "hasql-postgres"))
            (hsPkgs."hasql-backend" or (buildDepError "hasql-backend"))
            (hsPkgs."hasql" or (buildDepError "hasql"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."quickcheck-instances" or (buildDepError "quickcheck-instances"))
            (hsPkgs."criterion-plus" or (buildDepError "criterion-plus"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            (hsPkgs."monad-control" or (buildDepError "monad-control"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."list-t" or (buildDepError "list-t"))
            (hsPkgs."mtl-prelude" or (buildDepError "mtl-prelude"))
            (hsPkgs."base-prelude" or (buildDepError "base-prelude"))
            (hsPkgs."base" or (buildDepError "base"))
            ];
          buildable = true;
          };
        "profiling" = {
          depends = [
            (hsPkgs."postgresql-simple" or (buildDepError "postgresql-simple"))
            (hsPkgs."hasql-postgres" or (buildDepError "hasql-postgres"))
            (hsPkgs."hasql-backend" or (buildDepError "hasql-backend"))
            (hsPkgs."hasql" or (buildDepError "hasql"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."quickcheck-instances" or (buildDepError "quickcheck-instances"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            (hsPkgs."list-t" or (buildDepError "list-t"))
            (hsPkgs."mtl-prelude" or (buildDepError "mtl-prelude"))
            (hsPkgs."base-prelude" or (buildDepError "base-prelude"))
            (hsPkgs."base" or (buildDepError "base"))
            ];
          buildable = true;
          };
        };
      };
    }