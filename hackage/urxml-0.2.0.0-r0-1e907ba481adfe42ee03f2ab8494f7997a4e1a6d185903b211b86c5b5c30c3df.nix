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
      identifier = { name = "urxml"; version = "0.2.0.0"; };
      license = "LicenseRef-PublicDomain";
      copyright = "";
      maintainer = "grrwlf@gmail.com";
      author = "Sergey Mironov";
      homepage = "http://github.com/grwlf/urxml";
      url = "";
      synopsis = "XML parser-printer supporting Ur/Web syntax extensions";
      description = "UrXML is yet another XML parser/pretty-printer based on\n[RSXP](http://hackage.haskell.org/package/really-simple-xml-parser) package by\nCK Kashyap.\nUrXML is vim-friendly and can be used to pretty-print the XML-fragment of\nnon-XML file.\nAdditionaly, the tool is able to translate the usual XML into\n[Ur/Web](http://www.impredicative.com/ur/) dialect of XML (uses several\nhardcoded rules)";
      buildType = "Simple";
      };
    components = {
      exes = {
        "urxml" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."syb" or (buildDepError "syb"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."process" or (buildDepError "process"))
            ];
          buildable = true;
          };
        };
      };
    }