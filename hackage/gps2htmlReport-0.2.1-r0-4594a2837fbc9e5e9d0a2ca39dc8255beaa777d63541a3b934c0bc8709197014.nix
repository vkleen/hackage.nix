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
      identifier = { name = "gps2htmlReport"; version = "0.2.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Rob Stewart <robstewart57@googlemail.com>";
      author = "Rob Stewart <robstewart57@googlemail.com>";
      homepage = "https://github.com/robstewart57/Gps2HtmlReport";
      url = "";
      synopsis = "GPS to HTML Summary Report";
      description = "Generate a HTML summary report of GPS tracks";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."html" or (buildDepError "html"))
          (hsPkgs."gps" or (buildDepError "gps"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."cairo" or (buildDepError "cairo"))
          (hsPkgs."Chart" or (buildDepError "Chart"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."data-accessor" or (buildDepError "data-accessor"))
          (hsPkgs."colour" or (buildDepError "colour"))
          (hsPkgs."xsd" or (buildDepError "xsd"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."gd" or (buildDepError "gd"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."http-enumerator" or (buildDepError "http-enumerator"))
          (hsPkgs."hsmagick" or (buildDepError "hsmagick"))
          (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
          ];
        buildable = true;
        };
      exes = { "gps2htmlReport" = { buildable = true; }; };
      };
    }