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
      identifier = { name = "pg-store"; version = "0.5.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) Ole Krüger 2015";
      maintainer = "Ole Krüger <ole@vprsm.de>";
      author = "Ole Krüger <ole@vprsm.de>";
      homepage = "https://github.com/vapourismo/pg-store";
      url = "";
      synopsis = "Simple storage interface to PostgreSQL";
      description = "Simple storage interface to PostgreSQL";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."blaze-builder" or (buildDepError "blaze-builder"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."postgresql-libpq" or (buildDepError "postgresql-libpq"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."haskell-src-meta" or (buildDepError "haskell-src-meta"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."scientific" or (buildDepError "scientific"))
          (hsPkgs."tagged" or (buildDepError "tagged"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          ];
        buildable = true;
        };
      tests = {
        "entities" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."pg-store" or (buildDepError "pg-store"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."postgresql-libpq" or (buildDepError "postgresql-libpq"))
            (hsPkgs."scientific" or (buildDepError "scientific"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }