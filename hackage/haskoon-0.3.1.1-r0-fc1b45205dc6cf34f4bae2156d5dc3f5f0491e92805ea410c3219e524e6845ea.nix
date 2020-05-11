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
      specVersion = "1.2";
      identifier = { name = "haskoon"; version = "0.3.1.1"; };
      license = "LicenseRef-LGPL";
      copyright = "";
      maintainer = "David Leuschner <leuschner@factisresearch.com>, Dirk Spöri <spoeri@factisresearch.com>, Stefan Wehr <wehr@factisresearch.com>";
      author = "David Leuschner <leuschner@factisresearch.com>, Dirk Spöri <spoeri@factisresearch.com>, Stefan Wehr <wehr@factisresearch.com>";
      homepage = "";
      url = "";
      synopsis = "Web Application Abstraction";
      description = "Web Astraction Layer with a binding to CGI providing a simple way to\nmap parameter and header values to data structures (inspired by HAppS)\nand a sitemap functionality to map URLs to functions that answer the request.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."hslogger" or (buildDepError "hslogger"))
          (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
          (hsPkgs."MissingH" or (buildDepError "MissingH"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."MaybeT" or (buildDepError "MaybeT"))
          (hsPkgs."cgi" or (buildDepError "cgi"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."hsp" or (buildDepError "hsp"))
          (hsPkgs."hsx" or (buildDepError "hsx"))
          ] ++ [ (hsPkgs."fastcgi" or (buildDepError "fastcgi")) ];
        buildable = true;
        };
      };
    }