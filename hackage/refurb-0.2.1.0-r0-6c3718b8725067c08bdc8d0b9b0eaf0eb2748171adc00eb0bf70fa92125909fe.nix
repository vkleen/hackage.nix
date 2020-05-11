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
      identifier = { name = "refurb"; version = "0.2.1.0"; };
      license = "BSD-3-Clause";
      copyright = "2017 Confer Health, Inc.";
      maintainer = "oss@confer.care";
      author = "";
      homepage = "https://github.com/ConferHealth/refurb#readme";
      url = "";
      synopsis = "Tools for maintaining a database";
      description = "Tools for maintaining a database";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."Frames" or (buildDepError "Frames"))
          (hsPkgs."ansi-wl-pprint" or (buildDepError "ansi-wl-pprint"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."classy-prelude" or (buildDepError "classy-prelude"))
          (hsPkgs."composite-base" or (buildDepError "composite-base"))
          (hsPkgs."composite-opaleye" or (buildDepError "composite-opaleye"))
          (hsPkgs."dlist" or (buildDepError "dlist"))
          (hsPkgs."fast-logger" or (buildDepError "fast-logger"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."opaleye" or (buildDepError "opaleye"))
          (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
          (hsPkgs."postgresql-simple" or (buildDepError "postgresql-simple"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."product-profunctors" or (buildDepError "product-profunctors"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."these" or (buildDepError "these"))
          (hsPkgs."thyme" or (buildDepError "thyme"))
          (hsPkgs."vector-space" or (buildDepError "vector-space"))
          ];
        buildable = true;
        };
      tests = {
        "refurb-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."Frames" or (buildDepError "Frames"))
            (hsPkgs."ansi-wl-pprint" or (buildDepError "ansi-wl-pprint"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."classy-prelude" or (buildDepError "classy-prelude"))
            (hsPkgs."composite-base" or (buildDepError "composite-base"))
            (hsPkgs."composite-opaleye" or (buildDepError "composite-opaleye"))
            (hsPkgs."dlist" or (buildDepError "dlist"))
            (hsPkgs."fast-logger" or (buildDepError "fast-logger"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."opaleye" or (buildDepError "opaleye"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."postgresql-simple" or (buildDepError "postgresql-simple"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."product-profunctors" or (buildDepError "product-profunctors"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."these" or (buildDepError "these"))
            (hsPkgs."thyme" or (buildDepError "thyme"))
            (hsPkgs."vector-space" or (buildDepError "vector-space"))
            (hsPkgs."refurb" or (buildDepError "refurb"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            ];
          buildable = true;
          };
        };
      };
    }