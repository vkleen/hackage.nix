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
      specVersion = "1.8";
      identifier = { name = "yesod-test"; version = "0.3.3.2"; };
      license = "MIT";
      copyright = "";
      maintainer = "Nubis <nubis@woobiz.com.ar>, Michael Snoyman";
      author = "Nubis <nubis@woobiz.com.ar>";
      homepage = "http://www.yesodweb.com";
      url = "";
      synopsis = "integration testing for WAI/Yesod Applications ";
      description = "Behaviour Oriented integration Testing for Yesod Applications ";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."persistent" or (buildDepError "persistent"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."wai-test" or (buildDepError "wai-test"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."HUnit" or (buildDepError "HUnit"))
          (hsPkgs."hspec" or (buildDepError "hspec"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."xml-conduit" or (buildDepError "xml-conduit"))
          (hsPkgs."xml-types" or (buildDepError "xml-types"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."html-conduit" or (buildDepError "html-conduit"))
          (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
          (hsPkgs."blaze-markup" or (buildDepError "blaze-markup"))
          (hsPkgs."pool-conduit" or (buildDepError "pool-conduit"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."blaze-builder" or (buildDepError "blaze-builder"))
          (hsPkgs."cookie" or (buildDepError "cookie"))
          ];
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."yesod-test" or (buildDepError "yesod-test"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."xml-conduit" or (buildDepError "xml-conduit"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."html-conduit" or (buildDepError "html-conduit"))
            ];
          buildable = true;
          };
        };
      };
    }