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
      specVersion = "1.9.2";
      identifier = { name = "simple"; version = "0.2.0"; };
      license = "GPL-3.0-only";
      copyright = "";
      maintainer = "amit@amitlevy.com";
      author = "Amit Levy";
      homepage = "";
      url = "";
      synopsis = "A minimalist web framework for the WAI server interface";
      description = "\\Simple\\ is \\\"framework-less\\\" web framework for Haskell web applications\nusing the WAI server interface (e.g. for use with the warp server). Unlike\nother frameoworks, \\Simple\\ does not enforce a particular structure or\nparadigm for web applications. Rather, \\Simple\\ makes it easier for you, the\ndeveloper, to use whichever paradigm or structure you like. This package\nincludes:\n\n* Web application building blocks under Web.Simple\n\n* A Sintra (http://www.sinatrarb.com) inspired DSL - Web.Frank\n\n* A Monad for building RESTful controllers - Web.REST\n\nTo get started using the warp web server:\n\n@\n\$ cabal install simple warp\n@\n\n\\helloworld.hs\\:\n\n> import Web.Simple\n> import Network.Wai.Handler.Warp\n>\n> main :: IO ()\n> main = runSettings defaultSettings \$ mkRouter \$\n>         okHtml \"Hello World\"\n\n@\$ runghc -XOverloadedStrings helloworld.hs@\n\nSee /Web.Simple/ for a more detailed introduction.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          ];
        buildable = true;
        };
      };
    }