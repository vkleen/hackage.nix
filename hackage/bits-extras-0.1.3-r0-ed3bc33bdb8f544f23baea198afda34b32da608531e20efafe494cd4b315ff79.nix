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
    flags = { test = false; };
    package = {
      specVersion = "1.6";
      identifier = { name = "bits-extras"; version = "0.1.3"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Gabriel Wicke <wicke@wikidev.net>";
      author = "Gabriel Wicke <wicke@wikidev.net>";
      homepage = "";
      url = "";
      synopsis = "Efficient high-level bit operations not found in Data.Bits";
      description = "This package contains efficient implementations of high-level bit operations\nmissing from Data.Bits. The implementation is based on GCC builtins, which\ntranslate to specialized instructions where available.\n\nAll operations in this package can also be (less efficiently) implemented in\nterms of Data.Bits operations.\n\n/Issues:/ A GCC-provided library, @libgcc_s@, is dynamically linked to\nprovide software fallbacks on architectures without instructions\ncorresponding to specific operations. This is currently only expected to work\non Linux systems, and even there can lead to issues with GHCi's custom\nlinker. A workaround for GHCi on a linux system: @ln -s \\/lib\\/libgcc_s.so.1\n\\/lib\\/libgcc_s.so@.\n\nThe current plan for broader support is to replace the libgcc dependency with\nbuilt-in fallbacks in C or Haskell code. This needs to closely follow GCC's\nfall-back behaviour for each architecture. Alternative ideas would be\nappreciated.\n\nRelevant Hackage tickets:\n\n* <http://hackage.haskell.org/trac/ghc/ticket/3563>\n\n* <http://hackage.haskell.org/trac/ghc/ticket/4102>\n\n/Changes/:\n\n* 0.1.3: Added a first test and tweaked documentation. No functional changes.\n\n* 0.1.2: Moved the 'Data.Bits.Atomic' module to the package @bits-atomic@.\nThose operations do not depend on libgcc_s and should work wherever GCC 4.X\nis available.  Link to @bits-atomic@ on hackage:\n<http://hackage.haskell.org/package/bits-atomic>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (buildDepError "base")) ];
        libs = [ (pkgs."gcc_s" or (sysDepError "gcc_s")) ];
        buildable = true;
        };
      exes = {
        "test" = {
          depends = (pkgs.lib).optionals (flags.test) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            ];
          buildable = if flags.test then true else false;
          };
        };
      };
    }