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
      identifier = { name = "gdiff-th"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "jonathangfischoff@gmail.com";
      author = "";
      homepage = "";
      url = "";
      synopsis = "Generate gdiff GADTs and Instances.";
      description = "Generate gdiff GADTs and Instances. Alpha, but suprisingly functional.\nVery useful for unit testing large data structures. I have tested it on a\nfew very large collections of types and it appears to work. Although,\nwhen I tried to compare two versions of a hackage package with src-exts\nthe (GDiff) performance is terrible. In my personal experience of using\ngdiff in unit testing, the performance has be great. Your mileage may vary.\n\nI wouldn't use it for sending patches over the wire or anything like that,\nI am not convinced there are no bugs in my code yet. There are examples in the @examples@ directory of the\ncabal tarball. Also the main module includes an example in the documentation.\n\n* New in this version: It's functional.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."gdiff" or (buildDepError "gdiff"))
          (hsPkgs."th-expand-syns" or (buildDepError "th-expand-syns"))
          (hsPkgs."uniplate" or (buildDepError "uniplate"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."pointless-haskell" or (buildDepError "pointless-haskell"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."th-expand-syns" or (buildDepError "th-expand-syns"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."DebugTraceHelpers" or (buildDepError "DebugTraceHelpers"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."checkers" or (buildDepError "checkers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."th-instances" or (buildDepError "th-instances"))
            (hsPkgs."specialize-th" or (buildDepError "specialize-th"))
            (hsPkgs."universe-th" or (buildDepError "universe-th"))
            (hsPkgs."type-sub-th" or (buildDepError "type-sub-th"))
            (hsPkgs."gdiff" or (buildDepError "gdiff"))
            (hsPkgs."tuple" or (buildDepError "tuple"))
            (hsPkgs."pointless-haskell" or (buildDepError "pointless-haskell"))
            (hsPkgs."containers" or (buildDepError "containers"))
            ];
          buildable = true;
          };
        };
      };
    }