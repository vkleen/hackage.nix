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
      identifier = { name = "Tablify"; version = "0.8.1"; };
      license = "BSD-3-Clause";
      copyright = "© 2009-2011 Daniel Lyons";
      maintainer = "Daniel Lyons <fusion@storytotell.org>";
      author = "Daniel Lyons";
      homepage = "http://www.storytotell.org/code/tablify";
      url = "";
      synopsis = "Tool to render CSV into tables of various formats";
      description = "Tool to render CSV into tables of various formats, including HTML, tbl, and character art (both ASCII and Unicode)";
      buildType = "Simple";
      };
    components = {
      exes = {
        "tablify" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."haskell98" or (buildDepError "haskell98"))
            (hsPkgs."xhtml" or (buildDepError "xhtml"))
            (hsPkgs."safer-file-handles" or (buildDepError "safer-file-handles"))
            ];
          buildable = true;
          };
        };
      };
    }