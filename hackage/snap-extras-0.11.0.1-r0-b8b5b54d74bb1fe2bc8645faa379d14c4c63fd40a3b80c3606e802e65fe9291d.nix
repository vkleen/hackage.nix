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
    flags = { examples = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "snap-extras"; version = "0.11.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "oz@soostone.com";
      author = "Ozgun Ataman, Doug Beardsley";
      homepage = "";
      url = "";
      synopsis = "A collection of useful helpers and utilities for Snap web applications.";
      description = "This package contains a collection of helper functions\nthat come in handy in most practical, real-world\napplications. Check individual modules to understand\nwhat's here. You can simply import Snap.Extras and use\nthe initializer in there to get them all at once.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."blaze-builder" or (buildDepError "blaze-builder"))
          (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
          (hsPkgs."configurator" or (buildDepError "configurator"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."digestive-functors" or (buildDepError "digestive-functors"))
          (hsPkgs."digestive-functors-heist" or (buildDepError "digestive-functors-heist"))
          (hsPkgs."digestive-functors-snap" or (buildDepError "digestive-functors-snap"))
          (hsPkgs."directory-tree" or (buildDepError "directory-tree"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."heist" or (buildDepError "heist"))
          (hsPkgs."jmacro" or (buildDepError "jmacro"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."pcre-light" or (buildDepError "pcre-light"))
          (hsPkgs."readable" or (buildDepError "readable"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."snap" or (buildDepError "snap"))
          (hsPkgs."snap-core" or (buildDepError "snap-core"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."wl-pprint-text" or (buildDepError "wl-pprint-text"))
          (hsPkgs."xmlhtml" or (buildDepError "xmlhtml"))
          ];
        buildable = true;
        };
      exes = {
        "PollExample" = {
          depends = (pkgs.lib).optionals (!(!flags.examples)) [
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."heist" or (buildDepError "heist"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."readable" or (buildDepError "readable"))
            (hsPkgs."snap" or (buildDepError "snap"))
            (hsPkgs."snap-core" or (buildDepError "snap-core"))
            (hsPkgs."snap-extras" or (buildDepError "snap-extras"))
            (hsPkgs."snap-server" or (buildDepError "snap-server"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            ];
          buildable = if !flags.examples then false else true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."snap-core" or (buildDepError "snap-core"))
            (hsPkgs."snap-extras" or (buildDepError "snap-extras"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        };
      };
    }