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
    flags = { ghc7 = true; };
    package = {
      specVersion = "1.6.0";
      identifier = { name = "yesod-auth"; version = "0.3.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Michael Snoyman <michael@snoyman.com>";
      author = "Michael Snoyman, Patrick Brisbin";
      homepage = "http://docs.yesodweb.com/";
      url = "";
      synopsis = "Authentication for Yesod.";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."authenticate" or (buildDepError "authenticate"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."yesod-core" or (buildDepError "yesod-core"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."pureMD5" or (buildDepError "pureMD5"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."data-object" or (buildDepError "data-object"))
          (hsPkgs."control-monad-attempt" or (buildDepError "control-monad-attempt"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."mime-mail" or (buildDepError "mime-mail"))
          (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
          (hsPkgs."yesod-persistent" or (buildDepError "yesod-persistent"))
          (hsPkgs."hamlet" or (buildDepError "hamlet"))
          (hsPkgs."yesod-json" or (buildDepError "yesod-json"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."json-types" or (buildDepError "json-types"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."yesod-form" or (buildDepError "yesod-form"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."persistent" or (buildDepError "persistent"))
          (hsPkgs."SHA" or (buildDepError "SHA"))
          ] ++ [ (hsPkgs."base" or (buildDepError "base")) ];
        buildable = true;
        };
      };
    }