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
      identifier = { name = "convertible-ascii"; version = "0.1.0.1"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "PHO <pho at cielonegro dot org>";
      author = "PHO <pho at cielonegro dot org>";
      homepage = "https://github.com/phonohawk/convertible-ascii";
      url = "";
      synopsis = "convertible instances for ascii";
      description = "\nThis package provides convertible instances for ascii:\n\n* <http://hackage.haskell.org/package/convertible-text>\n\n* <http://hackage.haskell.org/package/ascii>\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."ascii" or (buildDepError "ascii"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base-unicode-symbols" or (buildDepError "base-unicode-symbols"))
          (hsPkgs."blaze-builder" or (buildDepError "blaze-builder"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."convertible-text" or (buildDepError "convertible-text"))
          (hsPkgs."failure" or (buildDepError "failure"))
          (hsPkgs."text" or (buildDepError "text"))
          ];
        buildable = true;
        };
      };
    }