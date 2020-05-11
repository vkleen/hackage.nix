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
      identifier = { name = "Hmpf"; version = "0.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Thomas L. Bevan <thomas.bevan@gmail.com>";
      author = "Thomas L. Bevan";
      homepage = "";
      url = "";
      synopsis = "An MPD client designed for a Home Theatre PC";
      description = "An MPD client designed to be used on a Home Theatre PC equipt with an infrared remote\nand VDU display.\n\nHmpf is designed to allow the user to navigate through a large digital music collection with\na standard infrared remote and VDU. The client does not need or accept input from the keyboard\n\nHmpf also implements the LastFM protocol and is able to intelligently generate dynamic playlists";
      buildType = "Custom";
      };
    components = {
      exes = {
        "hmpf" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."Crypto" or (buildDepError "Crypto"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."ConfigFile" or (buildDepError "ConfigFile"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            ];
          buildable = true;
          };
        };
      };
    }