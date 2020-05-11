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
      identifier = { name = "yesod-platform"; version = "1.1.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "Michael Snoyman <michael@snoyman.com>";
      author = "Michael Snoyman <michael@snoyman.com>";
      homepage = "http://www.yesodweb.com/";
      url = "";
      synopsis = "Meta package for Yesod";
      description = "Instead of allowing version ranges of dependencies, this package requires specific versions to avoid dependency hell";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."SHA" or (buildDepError "SHA"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
          (hsPkgs."asn1-data" or (buildDepError "asn1-data"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."attoparsec-conduit" or (buildDepError "attoparsec-conduit"))
          (hsPkgs."attoparsec-enumerator" or (buildDepError "attoparsec-enumerator"))
          (hsPkgs."authenticate" or (buildDepError "authenticate"))
          (hsPkgs."base-unicode-symbols" or (buildDepError "base-unicode-symbols"))
          (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
          (hsPkgs."blaze-builder" or (buildDepError "blaze-builder"))
          (hsPkgs."blaze-builder-conduit" or (buildDepError "blaze-builder-conduit"))
          (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
          (hsPkgs."blaze-markup" or (buildDepError "blaze-markup"))
          (hsPkgs."byteorder" or (buildDepError "byteorder"))
          (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."certificate" or (buildDepError "certificate"))
          (hsPkgs."clientsession" or (buildDepError "clientsession"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."cookie" or (buildDepError "cookie"))
          (hsPkgs."cprng-aes" or (buildDepError "cprng-aes"))
          (hsPkgs."cpu" or (buildDepError "cpu"))
          (hsPkgs."crypto-api" or (buildDepError "crypto-api"))
          (hsPkgs."crypto-conduit" or (buildDepError "crypto-conduit"))
          (hsPkgs."crypto-pubkey-types" or (buildDepError "crypto-pubkey-types"))
          (hsPkgs."cryptocipher" or (buildDepError "cryptocipher"))
          (hsPkgs."cryptohash" or (buildDepError "cryptohash"))
          (hsPkgs."css-text" or (buildDepError "css-text"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."dlist" or (buildDepError "dlist"))
          (hsPkgs."email-validate" or (buildDepError "email-validate"))
          (hsPkgs."entropy" or (buildDepError "entropy"))
          (hsPkgs."enumerator" or (buildDepError "enumerator"))
          (hsPkgs."failure" or (buildDepError "failure"))
          (hsPkgs."fast-logger" or (buildDepError "fast-logger"))
          (hsPkgs."file-embed" or (buildDepError "file-embed"))
          (hsPkgs."filesystem-conduit" or (buildDepError "filesystem-conduit"))
          (hsPkgs."hamlet" or (buildDepError "hamlet"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."hjsmin" or (buildDepError "hjsmin"))
          (hsPkgs."hspec" or (buildDepError "hspec"))
          (hsPkgs."hspec-expectations" or (buildDepError "hspec-expectations"))
          (hsPkgs."html-conduit" or (buildDepError "html-conduit"))
          (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
          (hsPkgs."http-date" or (buildDepError "http-date"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."language-javascript" or (buildDepError "language-javascript"))
          (hsPkgs."largeword" or (buildDepError "largeword"))
          (hsPkgs."lifted-base" or (buildDepError "lifted-base"))
          (hsPkgs."mime-mail" or (buildDepError "mime-mail"))
          (hsPkgs."mime-types" or (buildDepError "mime-types"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
          (hsPkgs."network-conduit" or (buildDepError "network-conduit"))
          (hsPkgs."path-pieces" or (buildDepError "path-pieces"))
          (hsPkgs."pem" or (buildDepError "pem"))
          (hsPkgs."persistent" or (buildDepError "persistent"))
          (hsPkgs."persistent-template" or (buildDepError "persistent-template"))
          (hsPkgs."pool-conduit" or (buildDepError "pool-conduit"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."pureMD5" or (buildDepError "pureMD5"))
          (hsPkgs."pwstore-fast" or (buildDepError "pwstore-fast"))
          (hsPkgs."ranges" or (buildDepError "ranges"))
          (hsPkgs."resource-pool" or (buildDepError "resource-pool"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
          (hsPkgs."shakespeare-css" or (buildDepError "shakespeare-css"))
          (hsPkgs."shakespeare-i18n" or (buildDepError "shakespeare-i18n"))
          (hsPkgs."shakespeare-js" or (buildDepError "shakespeare-js"))
          (hsPkgs."shakespeare-text" or (buildDepError "shakespeare-text"))
          (hsPkgs."silently" or (buildDepError "silently"))
          (hsPkgs."simple-sendfile" or (buildDepError "simple-sendfile"))
          (hsPkgs."skein" or (buildDepError "skein"))
          (hsPkgs."socks" or (buildDepError "socks"))
          (hsPkgs."stringsearch" or (buildDepError "stringsearch"))
          (hsPkgs."system-fileio" or (buildDepError "system-fileio"))
          (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
          (hsPkgs."tagged" or (buildDepError "tagged"))
          (hsPkgs."tagsoup" or (buildDepError "tagsoup"))
          (hsPkgs."tagstream-conduit" or (buildDepError "tagstream-conduit"))
          (hsPkgs."tar" or (buildDepError "tar"))
          (hsPkgs."tls" or (buildDepError "tls"))
          (hsPkgs."tls-extra" or (buildDepError "tls-extra"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          (hsPkgs."unix-compat" or (buildDepError "unix-compat"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."utf8-light" or (buildDepError "utf8-light"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."vault" or (buildDepError "vault"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."void" or (buildDepError "void"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."wai-app-static" or (buildDepError "wai-app-static"))
          (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
          (hsPkgs."wai-logger" or (buildDepError "wai-logger"))
          (hsPkgs."wai-test" or (buildDepError "wai-test"))
          (hsPkgs."warp" or (buildDepError "warp"))
          (hsPkgs."xml-conduit" or (buildDepError "xml-conduit"))
          (hsPkgs."xml-types" or (buildDepError "xml-types"))
          (hsPkgs."xss-sanitize" or (buildDepError "xss-sanitize"))
          (hsPkgs."yaml" or (buildDepError "yaml"))
          (hsPkgs."yesod" or (buildDepError "yesod"))
          (hsPkgs."yesod-auth" or (buildDepError "yesod-auth"))
          (hsPkgs."yesod-core" or (buildDepError "yesod-core"))
          (hsPkgs."yesod-default" or (buildDepError "yesod-default"))
          (hsPkgs."yesod-form" or (buildDepError "yesod-form"))
          (hsPkgs."yesod-json" or (buildDepError "yesod-json"))
          (hsPkgs."yesod-persistent" or (buildDepError "yesod-persistent"))
          (hsPkgs."yesod-routes" or (buildDepError "yesod-routes"))
          (hsPkgs."yesod-static" or (buildDepError "yesod-static"))
          (hsPkgs."yesod-test" or (buildDepError "yesod-test"))
          (hsPkgs."zlib-bindings" or (buildDepError "zlib-bindings"))
          (hsPkgs."zlib-conduit" or (buildDepError "zlib-conduit"))
          ];
        buildable = true;
        };
      };
    }