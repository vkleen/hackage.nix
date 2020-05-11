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
      identifier = { name = "quantum-random"; version = "0.6.4"; };
      license = "MIT";
      copyright = "2016";
      maintainer = "cs.hbar+hs@gmail.com";
      author = "Cliff Harvey";
      homepage = "http://github.com/BlackBrane/quantum-random/";
      url = "";
      synopsis = "Retrieve, store and manage real quantum random data.";
      description = "Retrieve, store and manage real quantum random data, originating from vacuum\nfluctuations of the electromagnetic field and served by Australian National\nUniversity.\n\nThe package is designed to ensure quantum random data is promptly available for\nyour application by keeping a sufficient amount locally. When depleted to a\nspecified level, more data is downloaded concurrently over SSL. It can be\nconfigured by specifying the minimum store size (below which more data are\nretrieved) the target store size (the size of the store after retrieval) and\nthe default display style.\n\nFor more information on the API service on which this package is based,\nvisit the ANU QRN webpage at <http://qrng.anu.edu.au/>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."ansigraph" or (buildDepError "ansigraph"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
          (hsPkgs."ansi-terminal" or (buildDepError "ansi-terminal"))
          (hsPkgs."terminal-size" or (buildDepError "terminal-size"))
          (hsPkgs."directory" or (buildDepError "directory"))
          ];
        buildable = true;
        };
      exes = {
        "qrand" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."haskeline" or (buildDepError "haskeline"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."quantum-random" or (buildDepError "quantum-random"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test-quantum-random" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."quantum-random" or (buildDepError "quantum-random"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        };
      };
    }