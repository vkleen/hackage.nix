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
      identifier = { name = "conduit"; version = "1.2.10"; };
      license = "MIT";
      copyright = "";
      maintainer = "michael@snoyman.com";
      author = "Michael Snoyman";
      homepage = "http://github.com/snoyberg/conduit";
      url = "";
      synopsis = "Streaming data processing library.";
      description = "`conduit` is a solution to the streaming data problem, allowing for production,\ntransformation, and consumption of streams of data in constant memory. It is an\nalternative to lazy I\\/O which guarantees deterministic resource handling.\n\nFor more information about conduit in general, and how this package in\nparticular fits into the ecosystem, see [the conduit\nhomepage](https://github.com/snoyberg/conduit#readme).\n\nHackage documentation generation is not reliable. For up to date documentation, please see: <http://www.stackage.org/package/conduit>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."mmorph" or (buildDepError "mmorph"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          ] ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "7.9")) (hsPkgs."void" or (buildDepError "void"));
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."safe" or (buildDepError "safe"))
            (hsPkgs."split" or (buildDepError "split"))
            ] ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "7.9")) (hsPkgs."void" or (buildDepError "void"));
          buildable = true;
          };
        };
      benchmarks = {
        "optimize-201408" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."mwc-random" or (buildDepError "mwc-random"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."kan-extensions" or (buildDepError "kan-extensions"))
            ];
          buildable = true;
          };
        "unfused" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            ];
          buildable = true;
          };
        };
      };
    }