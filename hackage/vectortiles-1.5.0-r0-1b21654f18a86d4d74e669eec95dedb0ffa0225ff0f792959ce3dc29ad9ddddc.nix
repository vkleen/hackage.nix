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
      specVersion = "2.2";
      identifier = { name = "vectortiles"; version = "1.5.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "colin@fosskers.ca";
      author = "Colin Woodbury";
      homepage = "https://github.com/fosskers/vectortiles";
      url = "";
      synopsis = "GIS Vector Tiles, as defined by Mapbox.";
      description = "GIS Vector Tiles, as defined by Mapbox.\nThis library implements version 2.1 of the official Mapbox spec, as defined\nhere: <https://github.com/mapbox/vector-tile-spec/tree/master/2.1>\n\nNote that currently this library ignores top-level protobuf extensions,\n/Value/ extensions, and /UNKNOWN/ geometries.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."protocol-buffers" or (buildDepError "protocol-buffers"))
          (hsPkgs."protocol-buffers-descriptor" or (buildDepError "protocol-buffers-descriptor"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          ];
        buildable = true;
        };
      tests = {
        "vectortiles-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."protocol-buffers" or (buildDepError "protocol-buffers"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."vectortiles" or (buildDepError "vectortiles"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "vectortiles-bench" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."microlens" or (buildDepError "microlens"))
            (hsPkgs."microlens-platform" or (buildDepError "microlens-platform"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."vectortiles" or (buildDepError "vectortiles"))
            ];
          buildable = true;
          };
        };
      };
    }