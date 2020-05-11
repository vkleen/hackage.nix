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
      identifier = { name = "c-mosquitto"; version = "0.1.7.0"; };
      license = "BSD-3-Clause";
      copyright = "2017-9(c) Marcin Tolysz";
      maintainer = "tolysz@gmail.com";
      author = "Marcin Tolysz";
      homepage = "https://github.com/tolysz/c-mosquitto#readme";
      url = "";
      synopsis = "Simpe mosquito MQTT binding able to work with the Amazons IoT";
      description = "Simpe mosquito MQTT binding\nable to work with the Amazons IoT but it should work with other providers";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."inline-c" or (buildDepError "inline-c"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          ];
        libs = [ (pkgs."mosquitto" or (sysDepError "mosquitto")) ];
        buildable = true;
        };
      exes = {
        "c-mosquitto" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."c-mosquitto" or (buildDepError "c-mosquitto"))
            (hsPkgs."options" or (buildDepError "options"))
            ];
          buildable = true;
          };
        };
      tests = {
        "c-mosquitto-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."c-mosquitto" or (buildDepError "c-mosquitto"))
            ];
          buildable = true;
          };
        };
      };
    }