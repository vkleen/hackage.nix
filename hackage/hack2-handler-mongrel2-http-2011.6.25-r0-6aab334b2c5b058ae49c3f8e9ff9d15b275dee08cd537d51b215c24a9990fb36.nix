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
      identifier = {
        name = "hack2-handler-mongrel2-http";
        version = "2011.6.25";
        };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Jinjing Wang <nfjinjing@gmail.com>";
      author = "Jinjing Wang";
      homepage = "https://github.com/nfjinjing/hack2-handler-mongrel2-http";
      url = "";
      synopsis = "Hack2 Mongrel2 HTTP handler";
      description = "Hack2 Mongrel2 HTTP handler";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."hack2" or (buildDepError "hack2"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."enumerator" or (buildDepError "enumerator"))
          (hsPkgs."air" or (buildDepError "air"))
          (hsPkgs."zeromq-haskell" or (buildDepError "zeromq-haskell"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."blaze-textual" or (buildDepError "blaze-textual"))
          (hsPkgs."blaze-builder" or (buildDepError "blaze-builder"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."attoparsec" or (buildDepError "attoparsec"))
          (hsPkgs."stm" or (buildDepError "stm"))
          ];
        buildable = true;
        };
      };
    }