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
      identifier = { name = "multilinear-io"; version = "0.5.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2018 Artur M. Brodzki";
      maintainer = "artur@brodzki.org";
      author = "Artur M. Brodzki";
      homepage = "https://github.com/ArturB/multilinear-io#readme";
      url = "";
      synopsis = "Conduit-based input/output capability for multilinear package.";
      description = "Conduit-based input & output capability for multilinear package <https://hackage.haskell.org/package/multilinear>. Supports various file formats: binary, CSV, JSON. More information available on GitHub: <https://github.com/ArturB/multilinear-io#readme>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."cassava" or (buildDepError "cassava"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."cereal-vector" or (buildDepError "cereal-vector"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."either" or (buildDepError "either"))
          (hsPkgs."multilinear" or (buildDepError "multilinear"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."zlib" or (buildDepError "zlib"))
          ];
        buildable = true;
        };
      tests = {
        "binary" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."either" or (buildDepError "either"))
            (hsPkgs."multilinear" or (buildDepError "multilinear"))
            (hsPkgs."multilinear-io" or (buildDepError "multilinear-io"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            ];
          buildable = true;
          };
        "csv" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."either" or (buildDepError "either"))
            (hsPkgs."multilinear" or (buildDepError "multilinear"))
            (hsPkgs."multilinear-io" or (buildDepError "multilinear-io"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            ];
          buildable = true;
          };
        "json" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."either" or (buildDepError "either"))
            (hsPkgs."multilinear" or (buildDepError "multilinear"))
            (hsPkgs."multilinear-io" or (buildDepError "multilinear-io"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "multilinear-io-bench" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."either" or (buildDepError "either"))
            (hsPkgs."multilinear" or (buildDepError "multilinear"))
            (hsPkgs."multilinear-io" or (buildDepError "multilinear-io"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            ];
          buildable = true;
          };
        };
      };
    }