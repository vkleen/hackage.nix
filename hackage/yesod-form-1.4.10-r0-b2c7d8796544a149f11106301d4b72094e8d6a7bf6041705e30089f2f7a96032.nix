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
    flags = { network-uri = true; };
    package = {
      specVersion = "1.8";
      identifier = { name = "yesod-form"; version = "1.4.10"; };
      license = "MIT";
      copyright = "";
      maintainer = "Michael Snoyman <michael@snoyman.com>";
      author = "Michael Snoyman <michael@snoyman.com>";
      homepage = "http://www.yesodweb.com/";
      url = "";
      synopsis = "Form handling support for Yesod Web Framework";
      description = "API docs and the README are available at <http://www.stackage.org/package/yesod-form>.  Third-party packages which you can find useful: <http://hackage.haskell.org/package/yesod-form-richtext yesod-form-richtext> - richtext form fields (currntly it provides only Summernote support).";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."yesod-core" or (buildDepError "yesod-core"))
          (hsPkgs."yesod-persistent" or (buildDepError "yesod-persistent"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
          (hsPkgs."persistent" or (buildDepError "persistent"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."xss-sanitize" or (buildDepError "xss-sanitize"))
          (hsPkgs."blaze-builder" or (buildDepError "blaze-builder"))
          (hsPkgs."email-validate" or (buildDepError "email-validate"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
          (hsPkgs."blaze-markup" or (buildDepError "blaze-markup"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."byteable" or (buildDepError "byteable"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          ] ++ (if flags.network-uri
          then [ (hsPkgs."network-uri" or (buildDepError "network-uri")) ]
          else [ (hsPkgs."network" or (buildDepError "network")) ]);
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."yesod-form" or (buildDepError "yesod-form"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }