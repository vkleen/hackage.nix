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
      specVersion = "1.10";
      identifier = { name = "shift"; version = "0.2.0.3"; };
      license = "MIT";
      copyright = "2010 Siddharth Bhat, 2017 Vanessa McHale";
      maintainer = "vamchale@gmail.com";
      author = "Siddharth Bhat, Vanessa McHale";
      homepage = "https://github.com/vmchale/teleport#readme";
      url = "";
      synopsis = "A tool to quickly switch between directories";
      description = "This is a command-line tool to \"teleport\" between directories";
      buildType = "Simple";
      };
    components = {
      exes = {
        "teleport-hask" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."turtle" or (buildDepError "turtle"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."system-filepath" or (buildDepError "system-filepath"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."composition-prelude" or (buildDepError "composition-prelude"))
            (hsPkgs."microlens" or (buildDepError "microlens"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
            (hsPkgs."system-fileio" or (buildDepError "system-fileio"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            ];
          buildable = true;
          };
        };
      };
    }