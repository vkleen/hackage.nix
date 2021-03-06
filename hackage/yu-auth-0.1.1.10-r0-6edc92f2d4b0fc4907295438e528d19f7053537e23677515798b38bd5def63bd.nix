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
    flags = { server-side = true; };
    package = {
      specVersion = "1.10";
      identifier = { name = "yu-auth"; version = "0.1.1.10"; };
      license = "GPL-3.0-only";
      copyright = "Copyright (C) 2017-2018 Johann Lee";
      maintainer = "qinka@live.com";
      author = "Johann Lee";
      homepage = "https://github.com/Qinka/Yu";
      url = "";
      synopsis = "Auth module for Yu.";
      description = "Helper of auth via SHA for Yu";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."cryptonite" or (buildDepError "cryptonite"))
          (hsPkgs."yu-utils" or (buildDepError "yu-utils"))
          (hsPkgs."memory" or (buildDepError "memory"))
          ];
        buildable = true;
        };
      tests = {
        "test-core" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."yu-utils" or (buildDepError "yu-utils"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."MonadRandom" or (buildDepError "MonadRandom"))
            (hsPkgs."yu-auth" or (buildDepError "yu-auth"))
            ];
          buildable = true;
          };
        "test-auth" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."yu-auth" or (buildDepError "yu-auth"))
            (hsPkgs."yu-utils" or (buildDepError "yu-utils"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."hspec-wai" or (buildDepError "hspec-wai"))
            (hsPkgs."yesod-test" or (buildDepError "yesod-test"))
            (hsPkgs."yesod-core" or (buildDepError "yesod-core"))
            (hsPkgs."wai" or (buildDepError "wai"))
            ];
          buildable = if flags.server-side then false else true;
          };
        };
      };
    }