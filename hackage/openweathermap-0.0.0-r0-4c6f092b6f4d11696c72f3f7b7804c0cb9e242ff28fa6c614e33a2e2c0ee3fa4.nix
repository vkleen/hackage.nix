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
    flags = { cmd = true; };
    package = {
      specVersion = "1.20";
      identifier = { name = "openweathermap"; version = "0.0.0"; };
      license = "LicenseRef-PublicDomain";
      copyright = "2017, Igor Pashev <pashev.igor@gmail.com>";
      maintainer = "Igor Pashev <pashev.igor@gmail.com>";
      author = "Igor Pashev";
      homepage = "";
      url = "";
      synopsis = "Access data at OpenWeatherMap";
      description = "Client library and command-line utility to access\nOpenWeatherMap https://openweathermap.org";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."http-client" or (buildDepError "http-client"))
          (hsPkgs."servant" or (buildDepError "servant"))
          (hsPkgs."servant-client" or (buildDepError "servant-client"))
          ];
        buildable = true;
        };
      exes = {
        "openweathermap" = {
          depends = (pkgs.lib).optionals (flags.cmd) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."openweathermap" or (buildDepError "openweathermap"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."xdg-basedir" or (buildDepError "xdg-basedir"))
            ];
          buildable = if flags.cmd then true else false;
          };
        };
      };
    }