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
      identifier = { name = "postgresql-binary"; version = "0.5.2.1"; };
      license = "MIT";
      copyright = "(c) 2014, Nikita Volkov";
      maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/nikita-volkov/postgresql-binary ";
      url = "";
      synopsis = "Encoders and decoders for the PostgreSQL's binary format";
      description = "An API for dealing with PostgreSQL's binary data format.\n\nIt can be used to implement high level APIs for Postgres.\nE.g., <http://hackage.haskell.org/package/hasql-postgres \"hasql-postgres\">\nis based on this library.\n\nIt supports all Postgres versions starting from 8.3\nand is tested against 8.3, 9.3 and 9.4\nwith the @integer_datetimes@ setting off and on.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."uuid" or (buildDepError "uuid"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."scientific" or (buildDepError "scientific"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."loch-th" or (buildDepError "loch-th"))
          (hsPkgs."placeholders" or (buildDepError "placeholders"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."base-prelude" or (buildDepError "base-prelude"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."postgresql-binary" or (buildDepError "postgresql-binary"))
            (hsPkgs."HTF" or (buildDepError "HTF"))
            (hsPkgs."quickcheck-instances" or (buildDepError "quickcheck-instances"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."postgresql-libpq" or (buildDepError "postgresql-libpq"))
            (hsPkgs."uuid" or (buildDepError "uuid"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."base-prelude" or (buildDepError "base-prelude"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "decoding" = {
          depends = [
            (hsPkgs."postgresql-binary" or (buildDepError "postgresql-binary"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."mtl-prelude" or (buildDepError "mtl-prelude"))
            (hsPkgs."base-prelude" or (buildDepError "base-prelude"))
            ];
          buildable = true;
          };
        "encoding" = {
          depends = [
            (hsPkgs."postgresql-binary" or (buildDepError "postgresql-binary"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."mtl-prelude" or (buildDepError "mtl-prelude"))
            (hsPkgs."base-prelude" or (buildDepError "base-prelude"))
            ];
          buildable = true;
          };
        };
      };
    }