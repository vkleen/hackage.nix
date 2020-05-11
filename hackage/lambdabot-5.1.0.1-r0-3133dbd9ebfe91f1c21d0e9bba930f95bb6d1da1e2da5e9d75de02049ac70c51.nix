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
      identifier = { name = "lambdabot"; version = "5.1.0.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "James Cook <mokus@deepbondi.net>";
      author = "James Cook";
      homepage = "https://wiki.haskell.org/Lambdabot";
      url = "";
      synopsis = "Lambdabot is a development tool and advanced IRC bot";
      description = "Lambdabot is an IRC bot written over several years by\nthose on the #haskell IRC channel.\n\nIt operates as a command line tool, embedded in an editor,\nembedded in GHCi, via internet relay chat and on the web.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "lambdabot" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."lambdabot-core" or (buildDepError "lambdabot-core"))
            (hsPkgs."lambdabot-haskell-plugins" or (buildDepError "lambdabot-haskell-plugins"))
            (hsPkgs."lambdabot-irc-plugins" or (buildDepError "lambdabot-irc-plugins"))
            (hsPkgs."lambdabot-misc-plugins" or (buildDepError "lambdabot-misc-plugins"))
            (hsPkgs."lambdabot-novelty-plugins" or (buildDepError "lambdabot-novelty-plugins"))
            (hsPkgs."lambdabot-reference-plugins" or (buildDepError "lambdabot-reference-plugins"))
            (hsPkgs."lambdabot-social-plugins" or (buildDepError "lambdabot-social-plugins"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          buildable = true;
          };
        };
      };
    }