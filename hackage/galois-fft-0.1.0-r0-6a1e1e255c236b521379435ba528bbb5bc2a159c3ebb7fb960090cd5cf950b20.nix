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
      specVersion = "1.12";
      identifier = { name = "galois-fft"; version = "0.1.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Adjoint Inc (info@adjoint.io)";
      author = "";
      homepage = "https://github.com/adjoint-io/galois-fft#readme";
      url = "";
      synopsis = "FFTs over finite fields";
      description = "Finite field polynomial arithmetic based on fast Fourier transforms";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."elliptic-curve" or (buildDepError "elliptic-curve"))
          (hsPkgs."galois-field" or (buildDepError "galois-field"))
          (hsPkgs."poly" or (buildDepError "poly"))
          (hsPkgs."protolude" or (buildDepError "protolude"))
          (hsPkgs."vector" or (buildDepError "vector"))
          ];
        buildable = true;
        };
      tests = {
        "fft-tests" = {
          depends = [
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."elliptic-curve" or (buildDepError "elliptic-curve"))
            (hsPkgs."galois-fft" or (buildDepError "galois-fft"))
            (hsPkgs."galois-field" or (buildDepError "galois-field"))
            (hsPkgs."pairing" or (buildDepError "pairing"))
            (hsPkgs."poly" or (buildDepError "poly"))
            (hsPkgs."protolude" or (buildDepError "protolude"))
            (hsPkgs."quickcheck-instances" or (buildDepError "quickcheck-instances"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-discover" or (buildDepError "tasty-discover"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "fft-benchmarks" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."elliptic-curve" or (buildDepError "elliptic-curve"))
            (hsPkgs."galois-fft" or (buildDepError "galois-fft"))
            (hsPkgs."galois-field" or (buildDepError "galois-field"))
            (hsPkgs."pairing" or (buildDepError "pairing"))
            (hsPkgs."poly" or (buildDepError "poly"))
            (hsPkgs."protolude" or (buildDepError "protolude"))
            (hsPkgs."vector" or (buildDepError "vector"))
            ];
          buildable = true;
          };
        };
      };
    }