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
      identifier = { name = "pontarius-xmpp"; version = "0.2.0.0"; };
      license = "LicenseRef-OtherLicense";
      copyright = "Dmitry Astapov, Pierre Kovalev, Mahdi Abdinejadi, Jon Kristensen,\nIETF Trust, Philipp Balzarek";
      maintainer = "info@jonkri.com";
      author = "Jon Kristensen, Mahdi Abdinejadi, Philipp Balzarek";
      homepage = "https://github.com/jonkri/pontarius-xmpp/";
      url = "http://www.jonkri.com/releases/pontarius-xmpp-0.2.0.0.tar.gz";
      synopsis = "An incomplete implementation of RFC 6120 (XMPP: Core)";
      description = "Pontarius XMPP is a work in progress implementation of\nRFC 6120 (XMPP: Core).";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."crypto-api" or (buildDepError "crypto-api"))
          (hsPkgs."crypto-random-api" or (buildDepError "crypto-random-api"))
          (hsPkgs."cryptohash" or (buildDepError "cryptohash"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."dns" or (buildDepError "dns"))
          (hsPkgs."hslogger" or (buildDepError "hslogger"))
          (hsPkgs."iproute" or (buildDepError "iproute"))
          (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."pureMD5" or (buildDepError "pureMD5"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."stringprep" or (buildDepError "stringprep"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."tls" or (buildDepError "tls"))
          (hsPkgs."tls-extra" or (buildDepError "tls-extra"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."void" or (buildDepError "void"))
          (hsPkgs."xml-types" or (buildDepError "xml-types"))
          (hsPkgs."xml-conduit" or (buildDepError "xml-conduit"))
          (hsPkgs."xml-picklers" or (buildDepError "xml-picklers"))
          ];
        buildable = true;
        };
      };
    }