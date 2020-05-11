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
      identifier = { name = "warp-tls-uid"; version = "0.2.0.5"; };
      license = "BSD-3-Clause";
      copyright = "2018 Yoshikuni Jujo";
      maintainer = "PAF01143[at]nifty.ne.jp";
      author = "Yoshikuni Jujo";
      homepage = "https://github.com/YoshikuniJujo/warp-tls-uid#readme";
      url = "";
      synopsis = "set group and user id before running server";
      description = "Please see the README on GitHub at <https://github.com/YoshikuniJujo/warp-tls-uid#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."streaming-commons" or (buildDepError "streaming-commons"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."warp" or (buildDepError "warp"))
          (hsPkgs."warp-tls" or (buildDepError "warp-tls"))
          ];
        buildable = true;
        };
      tests = {
        "warp-tls-uid-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."streaming-commons" or (buildDepError "streaming-commons"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."warp-tls" or (buildDepError "warp-tls"))
            (hsPkgs."warp-tls-uid" or (buildDepError "warp-tls-uid"))
            ];
          buildable = true;
          };
        };
      };
    }