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
      identifier = { name = "hsoz"; version = "0.0.0.2"; };
      license = "BSD-3-Clause";
      copyright = "2016 Rodney Lorrimar";
      maintainer = "dev@rodney.id.au";
      author = "Rodney Lorrimar";
      homepage = "https://github.com/rvl/hsoz#readme";
      url = "";
      synopsis = "Iron, Hawk, Oz: Web auth protocols";
      description = "<<images/iron.png>> &#x20;__&#x20;\n<<images/hawk.png>> &#x20;__&#x20;\n<<images/oz.png>>\n\n__hsoz__ is a Haskell implementation of the Iron, Hawk, and Oz web\nauthentication protocols. These protocols originate from the OAuth2\nstandardisation process, but are designed to be simpler to implement\nfor the common case of web applications.\n\nThis module is based on the Javascript code and documentation by\nEran Hammer and others. A fair amount of Hammer's descriptive text\nhas been incorporated into this documentation, as well as the cool\nlogos.\n\n== Introduction\n\nIn the words of their principal designer:\n\n__Iron__ is a cryptographic utility for sealing a JSON object using\nsymmetric key encryption with message integrity verification. Or in\nother words, it lets you encrypt an object, send it around (in\ncookies, authentication credentials, etc.), then receive it back and\ndecrypt it. The algorithm ensures that the message was not tampered\nwith, and also provides a simple mechanism for password rotation.\n\n__Hawk__ is an HTTP authentication scheme using a message\nauthentication code (MAC) algorithm to provide partial HTTP request\ncryptographic verification.\n\n__Oz__ is a web authorization protocol based on industry best\npractices. Oz combines the Hawk authentication protocol with the\nIron encryption protocol to provide a simple to use and secure\nsolution for granting and authenticating third-party access to an\nAPI on behalf of a user or an application.\n\n== Usage\n\nThe top-level \"Network.Iron\", \"Network.Hawk\", \"Network.Oz\" modules\ncontain further instructions on their usage. There are also some\nexample server and client programs within the\n<https://github.com/rvl/hsoz project git repository>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."base16-bytestring" or (buildDepError "base16-bytestring"))
          (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
          (hsPkgs."byteable" or (buildDepError "byteable"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."cryptonite" or (buildDepError "cryptonite"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."either" or (buildDepError "either"))
          (hsPkgs."errors" or (buildDepError "errors"))
          (hsPkgs."http-client" or (buildDepError "http-client"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."memory" or (buildDepError "memory"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."scientific" or (buildDepError "scientific"))
          (hsPkgs."scotty" or (buildDepError "scotty"))
          (hsPkgs."securemem" or (buildDepError "securemem"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."uri-bytestring" or (buildDepError "uri-bytestring"))
          (hsPkgs."vault" or (buildDepError "vault"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."warp" or (buildDepError "warp"))
          ];
        buildable = true;
        };
      exes = {
        "hsoz-example" = {
          depends = [
            (hsPkgs."hsoz" or (buildDepError "hsoz"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."cryptonite" or (buildDepError "cryptonite"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."http-client" or (buildDepError "http-client"))
            (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."lucid" or (buildDepError "lucid"))
            (hsPkgs."scotty" or (buildDepError "scotty"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."uri-bytestring" or (buildDepError "uri-bytestring"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."wreq" or (buildDepError "wreq"))
            ];
          buildable = if compiler.isGhcjs && true then false else true;
          };
        };
      tests = {
        "hsoz-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hsoz" or (buildDepError "hsoz"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."tasty-golden" or (buildDepError "tasty-golden"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."http-client" or (buildDepError "http-client"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            ];
          buildable = true;
          };
        };
      };
    }