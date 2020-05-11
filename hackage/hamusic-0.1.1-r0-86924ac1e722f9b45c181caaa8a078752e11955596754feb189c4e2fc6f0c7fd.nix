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
      identifier = { name = "hamusic"; version = "0.1.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2008 Samuel Silva";
      maintainer = "Samuel Silva <silva.samuel@alumni.uminho.pt>";
      author = "Samuel Silva <silva.samuel@alumni.uminho.pt>";
      homepage = "https://troglodita.di.uminho.pt/svn/musica/work/HaMusic";
      url = "";
      synopsis = "Library to handle abstract music";
      description = "This library consists on abstract music manipulation. It also\nsupports interfaces with MusicXML.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."HaXml" or (buildDepError "HaXml"))
          (hsPkgs."musicxml" or (buildDepError "musicxml"))
          (hsPkgs."haskore" or (buildDepError "haskore"))
          (hsPkgs."non-negative" or (buildDepError "non-negative"))
          ];
        buildable = true;
        };
      exes = {
        "HaMusic" = {
          depends = [ (hsPkgs."filepath" or (buildDepError "filepath")) ];
          buildable = true;
          };
        "MusicTranslate" = { buildable = true; };
        "MusicCount" = { buildable = true; };
        };
      };
    }