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
    flags = { dev = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "inflections"; version = "0.4.0.3"; };
      license = "MIT";
      copyright = "2014–2016 Justin Leitgeb";
      maintainer = "Justin Leitgeb <justin@stackbuilders.com>";
      author = "Justin Leitgeb <justin@stackbuilders.com>";
      homepage = "https://github.com/stackbuilders/inflections-hs";
      url = "";
      synopsis = "Inflections library for Haskell";
      description = "Inflections provides methods for singularization, pluralization,\ndasherizing, etc. The library is based on Rails' inflections library.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          ] ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "7.10")) (hsPkgs."void" or (buildDepError "void"));
        buildable = true;
        };
      tests = {
        "test" = {
          depends = ([
            (hsPkgs."inflections" or (buildDepError "inflections"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."hspec-megaparsec" or (buildDepError "hspec-megaparsec"))
            (hsPkgs."megaparsec" or (buildDepError "megaparsec"))
            (hsPkgs."text" or (buildDepError "text"))
            ] ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "7.10")) (hsPkgs."void" or (buildDepError "void"))) ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "8.0")) (hsPkgs."semigroups" or (buildDepError "semigroups"));
          buildable = true;
          };
        };
      };
    }