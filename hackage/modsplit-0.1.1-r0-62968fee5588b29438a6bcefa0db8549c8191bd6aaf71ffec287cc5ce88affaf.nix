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
      specVersion = "0";
      identifier = { name = "modsplit"; version = "0.1.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Dmitry Golubovsky <golubovsky@gmail.com>";
      author = "Dmitry Golubovsky";
      homepage = "";
      url = "";
      synopsis = "Haskell source splitter driven by special comments.";
      description = "The \"modsplit\" program takes a (most likely auto-generated) single-module\nHaskell source file containing specifically formatted comments and\nsplits it into several modules according to the directives\ncontained in the special comments.\n\nThis program has its roots in HSFFIG, and the format of these\ncomments is described here:\n\n<http://www.haskell.org/haskellwiki/HSFFIG/Tutorial#Splitting_large_modules>\n\nThis program is intended to post-process the output of programs generating\nHaskell code rather than to deal with handwritten code.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "modsplit" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."utf8-env" or (buildDepError "utf8-env"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."haskell98" or (buildDepError "haskell98"))
            (hsPkgs."directory" or (buildDepError "directory"))
            ];
          buildable = true;
          };
        };
      };
    }