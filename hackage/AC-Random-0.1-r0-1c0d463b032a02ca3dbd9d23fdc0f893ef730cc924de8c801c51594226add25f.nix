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
      specVersion = "1.6";
      identifier = { name = "AC-Random"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "MathematicalOrchid@hotmail.com";
      author = "Andrew Coppin";
      homepage = "";
      url = "";
      synopsis = "A pure Haskell PRNG.";
      description = "This is a psuedo-random number generator (PRNG). It is designed to\nreplace the standard Haskell '98 PRNG from the @random@ package. It\nhas the following properties:\n\n* Nicer API than @random@. (Supports all sizes of @Int@ and\n@Word@, for example.)\n\n* Much faster than @random@. (In my tests, roughly 14x faster.)\n\n* Comparable quality to @random@. (Both libraries pass the \\\"Die\nHarder\\\" suite of statistical randomness tests. In other words,\nneither has any overly obvious pattern to the \\\"random\\\" numbers\nit produces. Both libraries pass Die Harder with similar scores.)\n\n* 100% Haskell '98 code. No compiler-specific features. No\nexternal dependencies. Builds everywhere.\n\n* Pure functions and simple ADTs. No mutable state, no @IO@ monad.\nSimple API.\n\nThe actual algorithm is a lag-4 Multiply With Carry (MWC)\ngenerator, using 32-bit arithmetic. (Should be fast on 32-bit and\n64-bit platforms.) If my algebra is correct, its period should be\nroughly 1.46 * 10^48. (By constrast, @random@ claims to have a\nperiod of only 2.30 * 10^18.)\n\nNote that this algorithm, by itself, is /not/ cryptographically\nsecure.\n\nChanges:\n\n* Initial release.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (buildDepError "base")) ];
        buildable = true;
        };
      };
    }