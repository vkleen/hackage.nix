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
      identifier = { name = "http-media"; version = "0.7.1"; };
      license = "MIT";
      copyright = "(c) 2012-2017 Timothy Jones";
      maintainer = "Timothy Jones <tim@zmthy.net>";
      author = "Timothy Jones";
      homepage = "https://github.com/zmthy/http-media";
      url = "";
      synopsis = "Processing HTTP Content-Type and Accept headers";
      description = "This library is intended to be a comprehensive solution to parsing and\nselecting quality-indexed values in HTTP headers.  It is capable of\nparsing both media types and language parameters from the Accept and\nContent header families, and can be extended to match against other\naccept headers as well.  Selecting the appropriate header value is\nachieved by comparing a list of server options against the\nquality-indexed values supplied by the client.\n\nIn the following example, the Accept header is parsed and then matched\nagainst a list of server options to serve the appropriate media using\n'mapAcceptMedia':\n\n> getHeader >>= maybe send406Error sendResourceWith . mapAcceptMedia\n>     [ (\"text/html\",        asHtml)\n>     , (\"application/json\", asJson)\n>     ]\n\nSimilarly, the Content-Type header can be used to produce a parser for\nrequest bodies based on the given content type with 'mapContentMedia':\n\n> getContentType >>= maybe send415Error readRequestBodyWith . mapContentMedia\n>     [ (\"application/json\", parseJson)\n>     , (\"text/plain\",       parseText)\n>     ]\n\nThe API is agnostic to your choice of server.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          ];
        buildable = true;
        };
      tests = {
        "test-http-media" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-quickcheck2" or (buildDepError "test-framework-quickcheck2"))
            ];
          buildable = true;
          };
        };
      };
    }