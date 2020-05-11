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
      specVersion = "1.22";
      identifier = { name = "arena"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2015-2016 davean";
      maintainer = "davean <davean@xkcd.com>";
      author = "davean";
      homepage = "";
      url = "";
      synopsis = "A journaled data store";
      description = "@arena@ provides durable storage of data and summaries of that data.\nOn insert, data is written to a journal. Each piece of data is added to a running summary of the current journal. When the summary indicates the correct amount of data has accumulated, the journal data is moved, as a block accompanied by its summary, to long-term storage. The data type, summary type, and accumulation policy are configurable.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."bytes" or (buildDepError "bytes"))
          (hsPkgs."digest" or (buildDepError "digest"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."persistent-vector" or (buildDepError "persistent-vector"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."arena" or (buildDepError "arena"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."semigroups" or (buildDepError "semigroups"))
            ];
          buildable = true;
          };
        "example" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."arena" or (buildDepError "arena"))
            (hsPkgs."bytes" or (buildDepError "bytes"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."semigroups" or (buildDepError "semigroups"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "bench" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."arena" or (buildDepError "arena"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."semigroups" or (buildDepError "semigroups"))
            ];
          buildable = true;
          };
        };
      };
    }