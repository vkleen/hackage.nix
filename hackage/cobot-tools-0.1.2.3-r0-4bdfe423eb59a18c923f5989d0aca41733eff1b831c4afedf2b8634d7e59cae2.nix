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
      specVersion = "1.12";
      identifier = { name = "cobot-tools"; version = "0.1.2.3"; };
      license = "BSD-3-Clause";
      copyright = "2018-2019, Less Wrong Bio";
      maintainer = "pavel@yakovlev.me";
      author = "Pavel Yakovlev, Bogdan Neterebskii, Alexander Sadovnikov";
      homepage = "https://github.com/less-wrong/cobot-tools#readme";
      url = "";
      synopsis = "Biological data file formats and IO";
      description = "Please see the README on GitHub at <https://github.com/less-wrong/cobot-tools#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."cobot" or (buildDepError "cobot"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."data-msgpack" or (buildDepError "data-msgpack"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."regex-tdfa" or (buildDepError "regex-tdfa"))
          (hsPkgs."text" or (buildDepError "text"))
          ];
        libs = [ (pkgs."RNA" or (sysDepError "RNA")) ];
        buildable = true;
        };
      tests = {
        "cobot-tools-test" = {
          depends = [
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cobot" or (buildDepError "cobot"))
            (hsPkgs."cobot-tools" or (buildDepError "cobot-tools"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."data-msgpack" or (buildDepError "data-msgpack"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."neat-interpolation" or (buildDepError "neat-interpolation"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."regex-tdfa" or (buildDepError "regex-tdfa"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }