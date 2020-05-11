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
      identifier = { name = "reanimate"; version = "0.2.0.0"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "lemmih@gmail.com";
      author = "David Himmelstrup";
      homepage = "https://github.com/Lemmih/reanimate";
      url = "";
      synopsis = "Animation library based on SVGs.";
      description = "Animation library based on SVGs. Can import (and manipulate) SVGs from\nLaTeX and diagrams. Exports gifs, mp4s, and more. Ships with a webbased\nviewer and auto-reloader.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."reanimate-svg" or (buildDepError "reanimate-svg"))
          (hsPkgs."xml" or (buildDepError "xml"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."linear" or (buildDepError "linear"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."matrix" or (buildDepError "matrix"))
          (hsPkgs."JuicyPixels" or (buildDepError "JuicyPixels"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."parallel" or (buildDepError "parallel"))
          (hsPkgs."cubicbezier" or (buildDepError "cubicbezier"))
          (hsPkgs."websockets" or (buildDepError "websockets"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."fsnotify" or (buildDepError "fsnotify"))
          (hsPkgs."open-browser" or (buildDepError "open-browser"))
          (hsPkgs."random-shuffle" or (buildDepError "random-shuffle"))
          (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."colour" or (buildDepError "colour"))
          (hsPkgs."cassava" or (buildDepError "cassava"))
          (hsPkgs."ansi-wl-pprint" or (buildDepError "ansi-wl-pprint"))
          (hsPkgs."here" or (buildDepError "here"))
          (hsPkgs."temporary" or (buildDepError "temporary"))
          (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
          (hsPkgs."chiphunk" or (buildDepError "chiphunk"))
          (hsPkgs."geojson" or (buildDepError "geojson"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          ];
        buildable = true;
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."reanimate" or (buildDepError "reanimate"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-golden" or (buildDepError "tasty-golden"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."ansi-wl-pprint" or (buildDepError "ansi-wl-pprint"))
            ];
          buildable = true;
          };
        };
      };
    }