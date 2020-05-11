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
      identifier = { name = "json-tokens"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2019 Andrew Martin";
      maintainer = "andrew.thaddeus@gmail.com";
      author = "Andrew Martin";
      homepage = "https://github.com/andrewthad/json-tokens";
      url = "";
      synopsis = "Tokenize JSON";
      description = "Convert JSON to a token stream. This libary focuses on\nhigh performance and minimal allocations. This library\nis distinguished from `aeson` in the following ways:\n\n* In `aeson`, `decode` parses JSON by building an AST\nthat resembles the ABNF given in RFC 7159. Notably,\nthis converts every JSON `object` to a `HashMap`.\n(This choice of intermediate data structure may not\nbe appropritae depending on how the user wants to\ninterpret the `object`). By constrast, `json-tokens`\nconverts a document to a token sequence.\n\n* For numbers, `aeson` uses `scientific`, but `json-tokens`\nuses `scientific-notation`. Although `scientific` and\n`scientific-notation` have similar APIs, `scientific-notation`\nincludes a parser that is about 4x faster and conversion\nfunctions that are 10x faster than those found in\n`scientific` and `aeson`.\n\n* For text, `aeson` uses the UTF-16-backed `text` library,\nbut `json-tokens` uses the UTF-8-backed `text-short`\nlibrary.\n\n* Parsing is resumable in `aeson`, which uses `attoparsec`,\nbut not in `json-tokens`, which uses `bytesmith`.\n\n* In `aeson`, all batteries are included. In particular,\nthe combination of typeclasses and GHC Generics\n(or Template Haskell) make it possible to elide lots of\nboilerplate. None of these are included in `json-tokens`.\n\nThe difference in design decisions means that solutions using\n`json-tokens` are able to decode JSON twice as fast as\nsolutions with `aeson. In the `zeek-json` benchmark suite,\na `json-tokens`-based decoding outperforms `aeson`'s `decode`\nby a factor of two. This speed comes at a cost. Users must\nwrite more code to use `json-tokens` than they do for `aeson`.\nIf high-throughput parsing of small JSON documents is paramount,\nthis cost may be worth bearing. It is always possible to go a\nstep further and forego tokenization entirely, parsing the\ndesired Haskell data type directly from a byte sequence. Doing this\nin a low-allocation way while retaining both the ability the\nhandle JSON `object` keys in any order and the ability to handle\nescape sequences in `object` keys is fiendishly difficult. Kudos\nto the brave soul that goes down that path. For the rest of us,\n`json-tokens` is a compromise worth considering.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."array-builder" or (buildDepError "array-builder"))
          (hsPkgs."text-short" or (buildDepError "text-short"))
          (hsPkgs."bytesmith" or (buildDepError "bytesmith"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."byteslice" or (buildDepError "byteslice"))
          (hsPkgs."array-chunks" or (buildDepError "array-chunks"))
          (hsPkgs."scientific-notation" or (buildDepError "scientific-notation"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."byteslice" or (buildDepError "byteslice"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."json-tokens" or (buildDepError "json-tokens"))
            (hsPkgs."neat-interpolation" or (buildDepError "neat-interpolation"))
            (hsPkgs."primitive" or (buildDepError "primitive"))
            (hsPkgs."scientific-notation" or (buildDepError "scientific-notation"))
            (hsPkgs."small-bytearray-builder" or (buildDepError "small-bytearray-builder"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "bench" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."byteslice" or (buildDepError "byteslice"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."gauge" or (buildDepError "gauge"))
            (hsPkgs."json-tokens" or (buildDepError "json-tokens"))
            (hsPkgs."neat-interpolation" or (buildDepError "neat-interpolation"))
            (hsPkgs."primitive" or (buildDepError "primitive"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."scientific-notation" or (buildDepError "scientific-notation"))
            ];
          buildable = true;
          };
        };
      };
    }