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
      identifier = { name = "d-bus"; version = "0.1.3"; };
      license = "BSD-3-Clause";
      copyright = "2013 Philipp Balzarek";
      maintainer = "p.balzarek@googlemail.com";
      author = "Philipp Balzarek";
      homepage = "";
      url = "";
      synopsis = "Permissively licensed D-Bus client library";
      description = "This library uses modern extensions to the Haskell type system\n(including GADTs, DataKinds and TypeFamilies) and the\nsingletons library to embedd the D-Bus type system. D-Bus\nsignatures can thus be inferred.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."async" or (buildDepError "async"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."blaze-builder" or (buildDepError "blaze-builder"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."conduit-extra" or (buildDepError "conduit-extra"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."data-binary-ieee754" or (buildDepError "data-binary-ieee754"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."free" or (buildDepError "free"))
          (hsPkgs."hslogger" or (buildDepError "hslogger"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."singletons" or (buildDepError "singletons"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."xml-conduit" or (buildDepError "xml-conduit"))
          (hsPkgs."xml-picklers" or (buildDepError "xml-picklers"))
          (hsPkgs."xml-types" or (buildDepError "xml-types"))
          ];
        buildable = true;
        };
      tests = {
        "unittests" = {
          depends = [
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."d-bus" or (buildDepError "d-bus"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."singletons" or (buildDepError "singletons"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-th" or (buildDepError "tasty-th"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."xml-hamlet" or (buildDepError "xml-hamlet"))
            ];
          buildable = true;
          };
        };
      };
    }