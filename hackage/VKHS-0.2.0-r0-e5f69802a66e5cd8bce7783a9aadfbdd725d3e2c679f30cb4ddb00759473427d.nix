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
      identifier = { name = "VKHS"; version = "0.2.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2012, Sergey Mironov";
      maintainer = "ierton@gmail.com";
      author = "Sergey Mironov";
      homepage = "http://github.com/ierton/vkhs";
      url = "";
      synopsis = "Provides access to Vkontakte social network";
      description = "Provides access to Vkontakte API methods. Library requires no interaction\nwith the user during Implicit-flow authentication.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."json" or (buildDepError "json"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."tagsoup-parsec" or (buildDepError "tagsoup-parsec"))
          (hsPkgs."tagsoup" or (buildDepError "tagsoup"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."failure" or (buildDepError "failure"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."curlhs" or (buildDepError "curlhs"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."bimap" or (buildDepError "bimap"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."fclabels" or (buildDepError "fclabels"))
          (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
          ];
        buildable = true;
        };
      exes = { "vkq" = { buildable = true; }; };
      };
    }