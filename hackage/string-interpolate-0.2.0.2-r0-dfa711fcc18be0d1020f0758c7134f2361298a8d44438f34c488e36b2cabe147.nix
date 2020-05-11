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
      specVersion = "1.18";
      identifier = { name = "string-interpolate"; version = "0.2.0.2"; };
      license = "BSD-3-Clause";
      copyright = "2019-2020 William Yao";
      maintainer = "williamyaoh@gmail.com";
      author = "William Yao";
      homepage = "https://gitlab.com/williamyaoh/string-interpolate/blob/master/README.md";
      url = "";
      synopsis = "Haskell string/text/bytestring interpolation that just works";
      description = "Unicode-aware string interpolation that handles all textual types.\n\nSee the README at <https://gitlab.com/williamyaoh/string-interpolate/blob/master/README.md> for more info.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
          (hsPkgs."haskell-src-meta" or (buildDepError "haskell-src-meta"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."text-conversions" or (buildDepError "text-conversions"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          ];
        buildable = true;
        };
      tests = {
        "string-interpolate-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."string-interpolate" or (buildDepError "string-interpolate"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."quickcheck-instances" or (buildDepError "quickcheck-instances"))
            (hsPkgs."quickcheck-text" or (buildDepError "quickcheck-text"))
            (hsPkgs."quickcheck-unicode" or (buildDepError "quickcheck-unicode"))
            (hsPkgs."random-shuffle" or (buildDepError "random-shuffle"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "string-interpolate-bench" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."string-interpolate" or (buildDepError "string-interpolate"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."formatting" or (buildDepError "formatting"))
            (hsPkgs."interpolate" or (buildDepError "interpolate"))
            (hsPkgs."interpolatedstring-perl6" or (buildDepError "interpolatedstring-perl6"))
            (hsPkgs."neat-interpolation" or (buildDepError "neat-interpolation"))
            ];
          buildable = true;
          };
        };
      };
    }