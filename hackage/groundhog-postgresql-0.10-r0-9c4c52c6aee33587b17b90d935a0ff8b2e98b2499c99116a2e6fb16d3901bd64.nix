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
      specVersion = "1.6";
      identifier = { name = "groundhog-postgresql"; version = "0.10"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Boris Lykah <lykahb@gmail.com>";
      author = "Boris Lykah <lykahb@gmail.com>";
      homepage = "";
      url = "";
      synopsis = "PostgreSQL backend for the groundhog library.";
      description = "This package uses postgresql-simple and postgresql-libpq.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."postgresql-simple" or (buildDepError "postgresql-simple"))
          (hsPkgs."postgresql-libpq" or (buildDepError "postgresql-libpq"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."blaze-builder" or (buildDepError "blaze-builder"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."groundhog" or (buildDepError "groundhog"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."resource-pool" or (buildDepError "resource-pool"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          ] ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "8.0")) (hsPkgs."semigroups" or (buildDepError "semigroups"));
        buildable = true;
        };
      };
    }