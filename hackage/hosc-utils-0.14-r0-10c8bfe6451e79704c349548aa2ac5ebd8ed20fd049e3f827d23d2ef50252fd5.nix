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
      specVersion = "1.8";
      identifier = { name = "hosc-utils"; version = "0.14"; };
      license = "LicenseRef-GPL";
      copyright = "(c) Rohan Drape and others, 2006-2013";
      maintainer = "rd@slavepianos.org";
      author = "Rohan Drape";
      homepage = "http://rd.slavepianos.org/?t=hosc-utils";
      url = "";
      synopsis = "Haskell Open Sound Control Utilities";
      description = "hosc-utils";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hosc-json-cat" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."hosc" or (buildDepError "hosc"))
            (hsPkgs."hosc-json" or (buildDepError "hosc-json"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            ];
          buildable = true;
          };
        "hosc-json-cgi" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cgi" or (buildDepError "cgi"))
            (hsPkgs."hosc" or (buildDepError "hosc"))
            (hsPkgs."hosc-json" or (buildDepError "hosc-json"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."www-minus" or (buildDepError "www-minus"))
            ];
          buildable = true;
          };
        "hosc-json-console" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."haskeline" or (buildDepError "haskeline"))
            (hsPkgs."hosc" or (buildDepError "hosc"))
            (hsPkgs."hosc-json" or (buildDepError "hosc-json"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            ];
          buildable = true;
          };
        "hosc-json-nrt" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."hosc" or (buildDepError "hosc"))
            (hsPkgs."hosc-json" or (buildDepError "hosc-json"))
            (hsPkgs."hsc3" or (buildDepError "hsc3"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            ];
          buildable = true;
          };
        "hosc-json-ws" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."hosc" or (buildDepError "hosc"))
            (hsPkgs."hosc-json" or (buildDepError "hosc-json"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."websockets" or (buildDepError "websockets"))
            ];
          buildable = true;
          };
        };
      };
    }