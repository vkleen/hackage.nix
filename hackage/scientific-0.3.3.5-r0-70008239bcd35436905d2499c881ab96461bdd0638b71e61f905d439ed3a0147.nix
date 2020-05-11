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
    flags = { bytestring-builder = true; integer-simple = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "scientific"; version = "0.3.3.5"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Bas van Dijk <v.dijk.bas@gmail.com>";
      author = "Bas van Dijk";
      homepage = "https://github.com/basvandijk/scientific";
      url = "";
      synopsis = "Numbers represented using scientific notation";
      description = "@Data.Scientific@ provides a space efficient and arbitrary precision\nscientific number type.\n\n'Scientific' numbers are represented using\n<http://en.wikipedia.org/wiki/Scientific_notation scientific notation>. It\nuses a coefficient @c :: 'Integer'@ and a base-10 exponent @e :: 'Int'@ (do\nnote that since we're using an 'Int' to represent the exponent these numbers\naren't truly arbitrary precision). A scientific number corresponds to the\n'Fractional' number: @'fromInteger' c * 10 '^^' e@.\n\nThe main application of 'Scientific' is to be used as the target of parsing\narbitrary precision numbers coming from an untrusted source. The advantages\nover using 'Rational' for this are that:\n\n* A 'Scientific' is more efficient to construct. Rational numbers need to be\nconstructed using '%' which has to compute the 'gcd' of the 'numerator' and\n'denominator'.\n\n* 'Scientific' is safe against numbers with huge exponents. For example:\n@1e1000000000 :: 'Rational'@ will fill up all space and crash your\nprogram. Scientific works as expected:\n\n> > read \"1e1000000000\" :: Scientific\n> 1.0e1000000000\n\n* Also, the space usage of converting scientific numbers with huge exponents to\n@'Integral's@ (like: 'Int') or @'RealFloat's@ (like: 'Double' or 'Float')\nwill always be bounded by the target type.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."array" or (buildDepError "array"))
          ] ++ (if flags.integer-simple
          then [ (hsPkgs."integer-simple" or (buildDepError "integer-simple")) ]
          else [
            (hsPkgs."integer-gmp" or (buildDepError "integer-gmp"))
            ])) ++ (pkgs.lib).optional (flags.bytestring-builder) (hsPkgs."bytestring" or (buildDepError "bytestring"));
        buildable = true;
        };
      tests = {
        "test-scientific" = {
          depends = [
            (hsPkgs."scientific" or (buildDepError "scientific"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-ant-xml" or (buildDepError "tasty-ant-xml"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-smallcheck" or (buildDepError "tasty-smallcheck"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."smallcheck" or (buildDepError "smallcheck"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "bench-scientific" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."array" or (buildDepError "array"))
            ] ++ (if flags.integer-simple
            then [
              (hsPkgs."integer-simple" or (buildDepError "integer-simple"))
              ]
            else [ (hsPkgs."integer-gmp" or (buildDepError "integer-gmp")) ]);
          buildable = true;
          };
        };
      };
    }