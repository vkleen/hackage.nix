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
      identifier = { name = "postgresql-syntax"; version = "0.1"; };
      license = "MIT";
      copyright = "(c) 2017, Nikita Volkov";
      maintainer = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      author = "Nikita Volkov <nikita.y.volkov@mail.ru>";
      homepage = "https://github.com/nikita-volkov/postgresql-syntax";
      url = "";
      synopsis = "PostgreSQL SQL syntax utilities";
      description = "Currently this library only provides an SQL syntax validator.\n\nThis library wraps the \\\"libpq_query\\\" C library,\nwhich is an SQL parser based on the source code of the Postgres server.\nIOW, it uses the same parser as Postgres itself\nand hence supports all of its syntax.\n\nSo far this package has only been tested to work on the *nix systems (Mac OS including).";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."base-prelude" or (buildDepError "base-prelude"))
          (hsPkgs."base" or (buildDepError "base"))
          ];
        libs = [ (pkgs."pg_query" or (sysDepError "pg_query")) ];
        buildable = true;
        };
      tests = {
        "demo" = {
          depends = [
            (hsPkgs."postgresql-syntax" or (buildDepError "postgresql-syntax"))
            (hsPkgs."rerebase" or (buildDepError "rerebase"))
            ];
          buildable = true;
          };
        };
      };
    }