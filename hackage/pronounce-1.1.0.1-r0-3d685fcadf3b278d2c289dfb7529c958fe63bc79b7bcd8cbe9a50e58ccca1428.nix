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
      identifier = { name = "pronounce"; version = "1.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "ngoodman@uchicago.edu";
      author = "Noah Goodman";
      homepage = "https://github.com/buonuomo/Text.Pronounce";
      url = "";
      synopsis = "A Haskell library for interfacing with the CMU Pronouncing Dictionary";
      description = "Text.Pronounce is a Haskell library for interfacing and\nCMU Pronouncing Dictionary. It is based off of Allison\nParrish's python library called 'pronouncing', and it\nexports much of the same functionality. The underlying data\nstructure that I used for representing the dictionary was a\nMap from entries to lists of their possible phones as\nrepresented in the CMU dict. Many functions rely on access\nto the CMU dict, so I decided to encompass this underlying\nstate of the dictionary by using the Reader Monad. When\nworking with this library, the default setting is to load\nthe dictionary from an included binary file, but the user\nhas the option to parse the dictionary from a unicode text\nfile, or encode the text file into binary themselves.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."binary" or (buildDepError "binary"))
          ];
        buildable = true;
        };
      };
    }