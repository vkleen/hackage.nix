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
    flags = { network-uri = true; };
    package = {
      specVersion = "1.8";
      identifier = { name = "xss-sanitize"; version = "0.3.5.7"; };
      license = "BSD-2-Clause";
      copyright = "";
      maintainer = "Greg Weber <greg@gregweber.info>";
      author = "Greg Weber <greg@gregweber.info>";
      homepage = "http://github.com/yesodweb/haskell-xss-sanitize";
      url = "";
      synopsis = "sanitize untrusted HTML to prevent XSS attacks";
      description = "run untrusted HTML through Text.HTML.SanitizeXSS.sanitizeXSS to prevent XSS attacks. see README.md <http://github.com/yesodweb/haskell-xss-sanitize> for more details";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."tagsoup" or (buildDepError "tagsoup"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."css-text" or (buildDepError "css-text"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          ] ++ (if flags.network-uri
          then [ (hsPkgs."network-uri" or (buildDepError "network-uri")) ]
          else [ (hsPkgs."network" or (buildDepError "network")) ]);
        buildable = true;
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."tagsoup" or (buildDepError "tagsoup"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."css-text" or (buildDepError "css-text"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            ] ++ (if flags.network-uri
            then [ (hsPkgs."network-uri" or (buildDepError "network-uri")) ]
            else [ (hsPkgs."network" or (buildDepError "network")) ]);
          buildable = true;
          };
        };
      };
    }