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
      identifier = { name = "binary-typed"; version = "1.0"; };
      license = "BSD-2-Clause";
      copyright = "David Luposchainsky <dluposchainsky on googles email service>";
      maintainer = "David Luposchainsky <dluposchainsky on googles email service>";
      author = "David Luposchainsky <dluposchainsky on googles email service>";
      homepage = "https://github.com/quchen/binary-typed";
      url = "";
      synopsis = "Type-safe binary serialization";
      description = "`Binary` serialization tagged with type information, allowing for\ntypechecking and useful error messages at the receiving site.\n\nThis package serves the same purpose as tagged-binary, with a couple of\nkey differences:\n\n* Support of different kinds of serialized type annotations, each with\nspecific strengths and weaknesses.\n\n* Error messages can provide details on type errors at the cost of\nlonger message lengths to include the necessary information.\n\n* Very small performance overhead compared to using standard `Binary` due\nto caching when using hashed type information. Since shown and full\ntypes are not cached, decoding them has a significant performance hit\n(ballpark: factor of two).\n\n* No depencency on @Internal@ modules of other libraries, and a very small\ndependency footprint in general.\n\nFor information about usage, see the \"Data.Binary.Typed.Tutorial\" module.\n\nPerformance-wise, here is a value @Right (Left \\<100 chars lipsum\\>)@ of\ntype @Either (Char, Int) (Either String (Maybe Integer))@ benchmarked\nusing the @Hashed64@ type representation:\n\n<<http://i.imgur.com/UMPUpp4.png>>\n\n<doc/bench-overview.png (local copy)>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."murmur-hash" or (buildDepError "murmur-hash"))
          ];
        buildable = true;
        };
      tests = {
        "tasty" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."binary-typed" or (buildDepError "binary-typed"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            ];
          buildable = true;
          };
        "message-length" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."binary-typed" or (buildDepError "binary-typed"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "criterion" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."binary-typed" or (buildDepError "binary-typed"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            ];
          buildable = true;
          };
        "criterion-overview" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."binary-typed" or (buildDepError "binary-typed"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        };
      };
    }