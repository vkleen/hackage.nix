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
    flags = { small_base = true; };
    package = {
      specVersion = "1.10";
      identifier = { name = "aviation-cessna172-diagrams"; version = "0.0.1"; };
      license = "LicenseRef-OtherLicense";
      copyright = "Copyright (c) 2016, Commonwealth Scientific and Industrial Research Organisation (CSIRO) ABN 41 687 119 230.";
      maintainer = "Tony Morris, Joshua Morris";
      author = "Tony Morris <ʇǝu˙sıɹɹoɯʇ@ןןǝʞsɐɥ>, Joshua Morris <ɯoɔ˙lᴉɐɯƃ@llǝʞsɐɥ+sᴉɹɹoɯuɥoɾɐnɥsoɾ>";
      homepage = "https://github.com/data61/aviation-cessna172-diagrams";
      url = "";
      synopsis = "Diagrams for the Cessna 172 aircraft in aviation.";
      description = "<<http://i.imgur.com/0h9dFhl.png>>\n\nDiagrams for the Cessna 172 aircraft in aviation.";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."aviation-units" or (buildDepError "aviation-units"))
          (hsPkgs."aviation-weight-balance" or (buildDepError "aviation-weight-balance"))
          (hsPkgs."aviation-cessna172-weight-balance" or (buildDepError "aviation-cessna172-weight-balance"))
          (hsPkgs."diagrams-cairo" or (buildDepError "diagrams-cairo"))
          (hsPkgs."diagrams-core" or (buildDepError "diagrams-core"))
          (hsPkgs."diagrams-lib" or (buildDepError "diagrams-lib"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."plots" or (buildDepError "plots"))
          (hsPkgs."hgeometry" or (buildDepError "hgeometry"))
          (hsPkgs."colour" or (buildDepError "colour"))
          ];
        buildable = true;
        };
      tests = {
        "doctests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."quickcheck-text" or (buildDepError "quickcheck-text"))
            ];
          buildable = true;
          };
        };
      };
    }