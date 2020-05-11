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
      identifier = { name = "shakebook"; version = "0.1.5.0"; };
      license = "BSD-3-Clause";
      copyright = "20XX Me";
      maintainer = "example@example.com";
      author = "Me";
      homepage = "";
      url = "";
      synopsis = "Shake-based markdown/latex webbook.";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."comonad" or (buildDepError "comonad"))
          (hsPkgs."comonad-extras" or (buildDepError "comonad-extras"))
          (hsPkgs."doctemplates" or (buildDepError "doctemplates"))
          (hsPkgs."extra" or (buildDepError "extra"))
          (hsPkgs."feed" or (buildDepError "feed"))
          (hsPkgs."free" or (buildDepError "free"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."lens-aeson" or (buildDepError "lens-aeson"))
          (hsPkgs."pandoc" or (buildDepError "pandoc"))
          (hsPkgs."pandoc-types" or (buildDepError "pandoc-types"))
          (hsPkgs."relude" or (buildDepError "relude"))
          (hsPkgs."rio" or (buildDepError "rio"))
          (hsPkgs."shake" or (buildDepError "shake"))
          (hsPkgs."slick" or (buildDepError "slick"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."tasty" or (buildDepError "tasty"))
          (hsPkgs."text-time" or (buildDepError "text-time"))
          ];
        buildable = true;
        };
      tests = {
        "shakebook-test" = {
          depends = [
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."comonad" or (buildDepError "comonad"))
            (hsPkgs."comonad-extras" or (buildDepError "comonad-extras"))
            (hsPkgs."doctemplates" or (buildDepError "doctemplates"))
            (hsPkgs."extra" or (buildDepError "extra"))
            (hsPkgs."feed" or (buildDepError "feed"))
            (hsPkgs."free" or (buildDepError "free"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."lens-aeson" or (buildDepError "lens-aeson"))
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            (hsPkgs."pandoc-types" or (buildDepError "pandoc-types"))
            (hsPkgs."relude" or (buildDepError "relude"))
            (hsPkgs."rio" or (buildDepError "rio"))
            (hsPkgs."shake" or (buildDepError "shake"))
            (hsPkgs."shakebook" or (buildDepError "shakebook"))
            (hsPkgs."slick" or (buildDepError "slick"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."text-time" or (buildDepError "text-time"))
            ];
          buildable = true;
          };
        };
      };
    }