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
      specVersion = "1.6.0";
      identifier = { name = "yesod-auth"; version = "1.2.7"; };
      license = "MIT";
      copyright = "";
      maintainer = "Michael Snoyman <michael@snoyman.com>";
      author = "Michael Snoyman, Patrick Brisbin";
      homepage = "http://www.yesodweb.com/";
      url = "";
      synopsis = "Authentication for Yesod.";
      description = "This package provides a pluggable mechanism for allowing users to authenticate with your site. It comes with a number of common plugins, such as OpenID, BrowserID (a.k.a., Mozilla Persona), and email. Other packages are available from Hackage as well. If you've written such an add-on, please notify me so that it can be added to this description.\n\n* <http://hackage.haskell.org/package/yesod-auth-account>: An account authentication plugin for Yesod";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."authenticate" or (buildDepError "authenticate"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."yesod-core" or (buildDepError "yesod-core"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."pureMD5" or (buildDepError "pureMD5"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."mime-mail" or (buildDepError "mime-mail"))
          (hsPkgs."yesod-persistent" or (buildDepError "yesod-persistent"))
          (hsPkgs."hamlet" or (buildDepError "hamlet"))
          (hsPkgs."shakespeare-css" or (buildDepError "shakespeare-css"))
          (hsPkgs."shakespeare-js" or (buildDepError "shakespeare-js"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."yesod-form" or (buildDepError "yesod-form"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."persistent" or (buildDepError "persistent"))
          (hsPkgs."persistent-template" or (buildDepError "persistent-template"))
          (hsPkgs."SHA" or (buildDepError "SHA"))
          (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."pwstore-fast" or (buildDepError "pwstore-fast"))
          (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
          (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
          (hsPkgs."blaze-markup" or (buildDepError "blaze-markup"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."file-embed" or (buildDepError "file-embed"))
          (hsPkgs."email-validate" or (buildDepError "email-validate"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."time" or (buildDepError "time"))
          ];
        buildable = true;
        };
      };
    }