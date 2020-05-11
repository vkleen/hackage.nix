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
      identifier = { name = "ui-command"; version = "0.5.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Conrad Parker <conrad@metadecks.org>";
      author = "Conrad Parker <conrad@metadecks.org>";
      homepage = "";
      url = "";
      synopsis = "A framework for friendly commandline programs";
      description = "This is a framework for creating commandline applications. It\nprovides various features which give a polished feel to your\napplication.\n\nIt is designed to encourage you to provide clear documentation\nand working examples. It implements default ''help''\nand ''man'' commands for your application, which will layout help\ntext and generate Unix-style man pages.\n\nIt provides special handling for applications of the form\n''program command args'', the style of interaction common in revision\ncontrol systems. It will dispatch to handler functions that you\nprovide for each command, and also provide command-specific\nhelp to the user.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."monads-fd" or (buildDepError "monads-fd"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          ];
        buildable = true;
        };
      exes = { "ui-cmd-hello" = { buildable = true; }; };
      };
    }