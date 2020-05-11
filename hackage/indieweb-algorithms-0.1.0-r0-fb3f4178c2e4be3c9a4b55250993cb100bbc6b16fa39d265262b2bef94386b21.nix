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
      identifier = { name = "indieweb-algorithms"; version = "0.1.0"; };
      license = "LicenseRef-PublicDomain";
      copyright = "2015 Greg V <greg@unrelenting.technology>";
      maintainer = "greg@unrelenting.technology";
      author = "Greg V";
      homepage = "https://github.com/myfreeweb/indieweb-algorithms";
      url = "";
      synopsis = "A collection of implementations of IndieWeb algorithms.";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."either" or (buildDepError "either"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."lens-aeson" or (buildDepError "lens-aeson"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."network-uri" or (buildDepError "network-uri"))
          (hsPkgs."microformats2-parser" or (buildDepError "microformats2-parser"))
          (hsPkgs."http-link-header" or (buildDepError "http-link-header"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."network-uri" or (buildDepError "network-uri"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."hspec-expectations-pretty-diff" or (buildDepError "hspec-expectations-pretty-diff"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."indieweb-algorithms" or (buildDepError "indieweb-algorithms"))
            (hsPkgs."microformats2-parser" or (buildDepError "microformats2-parser"))
            (hsPkgs."raw-strings-qq" or (buildDepError "raw-strings-qq"))
            (hsPkgs."aeson-qq" or (buildDepError "aeson-qq"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            ];
          buildable = true;
          };
        };
      };
    }