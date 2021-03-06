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
      identifier = { name = "repa-examples"; version = "3.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Ben Lippmeier <benl@ouroborus.net>";
      author = "The DPH Team";
      homepage = "http://repa.ouroborus.net";
      url = "";
      synopsis = "Examples using the Repa array library.";
      description = "Examples using the Repa array library.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "repa-canny" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."repa" or (buildDepError "repa"))
            (hsPkgs."repa-algorithms" or (buildDepError "repa-algorithms"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            ];
          buildable = true;
          };
        "repa-mmult" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."repa" or (buildDepError "repa"))
            (hsPkgs."repa-io" or (buildDepError "repa-io"))
            (hsPkgs."repa-algorithms" or (buildDepError "repa-algorithms"))
            ];
          buildable = true;
          };
        "repa-laplace" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."repa" or (buildDepError "repa"))
            (hsPkgs."repa-io" or (buildDepError "repa-io"))
            ];
          buildable = true;
          };
        "repa-fft2d" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."repa" or (buildDepError "repa"))
            (hsPkgs."repa-algorithms" or (buildDepError "repa-algorithms"))
            (hsPkgs."repa-io" or (buildDepError "repa-io"))
            ];
          buildable = true;
          };
        "repa-fft2d-highpass" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."repa" or (buildDepError "repa"))
            (hsPkgs."repa-algorithms" or (buildDepError "repa-algorithms"))
            (hsPkgs."repa-io" or (buildDepError "repa-io"))
            ];
          buildable = true;
          };
        "repa-fft3d-highpass" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."repa" or (buildDepError "repa"))
            (hsPkgs."repa-algorithms" or (buildDepError "repa-algorithms"))
            ];
          buildable = true;
          };
        "repa-blur" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."repa" or (buildDepError "repa"))
            (hsPkgs."repa-algorithms" or (buildDepError "repa-algorithms"))
            ];
          buildable = true;
          };
        "repa-sobel" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."repa" or (buildDepError "repa"))
            (hsPkgs."repa-algorithms" or (buildDepError "repa-algorithms"))
            ];
          buildable = true;
          };
        "repa-volume" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."repa" or (buildDepError "repa"))
            (hsPkgs."repa-io" or (buildDepError "repa-io"))
            ];
          buildable = true;
          };
        };
      };
    }