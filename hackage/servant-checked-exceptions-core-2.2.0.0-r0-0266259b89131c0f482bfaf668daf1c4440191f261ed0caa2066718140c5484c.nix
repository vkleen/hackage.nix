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
    flags = { buildexample = false; };
    package = {
      specVersion = "1.10";
      identifier = {
        name = "servant-checked-exceptions-core";
        version = "2.2.0.0";
        };
      license = "BSD-3-Clause";
      copyright = "2017-2018 Dennis Gosnell";
      maintainer = "cdep.illabout@gmail.com";
      author = "Dennis Gosnell";
      homepage = "https://github.com/cdepillabout/servant-checked-exceptions";
      url = "";
      synopsis = "Checked exceptions for Servant APIs.";
      description = "Please see <https://github.com/cdepillabout/servant-checked-exceptions#readme README.md>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."contravariant" or (buildDepError "contravariant"))
          (hsPkgs."http-media" or (buildDepError "http-media"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."profunctors" or (buildDepError "profunctors"))
          (hsPkgs."tagged" or (buildDepError "tagged"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."servant" or (buildDepError "servant"))
          (hsPkgs."servant-docs" or (buildDepError "servant-docs"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."world-peace" or (buildDepError "world-peace"))
          ];
        buildable = true;
        };
      exes = {
        "servant-checked-exceptions-core-example-docs" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."http-api-data" or (buildDepError "http-api-data"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."servant" or (buildDepError "servant"))
            (hsPkgs."servant-checked-exceptions-core" or (buildDepError "servant-checked-exceptions-core"))
            (hsPkgs."servant-docs" or (buildDepError "servant-docs"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = if flags.buildexample then true else false;
          };
        };
      tests = {
        "servant-checked-exceptions-core-doctest" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            (hsPkgs."Glob" or (buildDepError "Glob"))
            ];
          buildable = if compiler.isGhcjs && true then false else true;
          };
        };
      };
    }