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
      identifier = { name = "yesod-auth-fb"; version = "1.10.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Sibi <sibi@psibi.in>";
      author = "Felipe Lessa, Michael Snoyman";
      homepage = "https://github.com/psibi/yesod-auth-fb";
      url = "";
      synopsis = "Authentication backend for Yesod using Facebook.";
      description = "This package allows you to use Yesod's authentication framework\nwith Facebook as your backend.  That is, your site's users will\nlog in to your site through Facebook.  Your application need to\nbe registered on Facebook.\n\nThis package works with both the server-side authentication\nflow\n(<https://developers.facebook.com/docs/authentication/server-side/>)\nvia the \"Yesod.Auth.Facebook.ServerSide\" module and the\nclient-side authentication\n(<https://developers.facebook.com/docs/authentication/client-side/>)\nvia the \"Yesod.Auth.Facebook.ClientSide\" module.  It's up to\nyou to decide which one to use.  The server-side code is older\nand as such has been through a lot more testing than the\nclient-side code.  Also, for now only the server-side code is\nable to work with other authentication plugins.  The\nclient-side code, however, allows you to use some features that\nare available only to the Facebook JS SDK (such as\nautomatically logging your users in, see\n<https://developers.facebook.com/blog/post/2012/05/08/how-to--improve-the-experience-for-returning-users/>).";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."yesod-core" or (buildDepError "yesod-core"))
          (hsPkgs."yesod-auth" or (buildDepError "yesod-auth"))
          (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."yesod-fb" or (buildDepError "yesod-fb"))
          (hsPkgs."fb" or (buildDepError "fb"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."unliftio" or (buildDepError "unliftio"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          ];
        buildable = true;
        };
      };
    }