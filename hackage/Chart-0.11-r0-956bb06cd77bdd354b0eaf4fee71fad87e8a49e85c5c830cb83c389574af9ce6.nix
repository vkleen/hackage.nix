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
    flags = { splitbase = true; };
    package = {
      specVersion = "1.6";
      identifier = { name = "Chart"; version = "0.11"; };
      license = "BSD-3-Clause";
      copyright = "Tim Docker, 2006-2009";
      maintainer = "Tim Docker <tim@dockerz.net>";
      author = "Tim Docker <tim@dockerz.net>";
      homepage = "http://www.dockerz.net/software/chart.html";
      url = "";
      synopsis = "A library for generating 2D Charts and Plots";
      description = "A library for generating 2D Charts and Plots, based upon the cairo graphics library.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."gtk" or (buildDepError "gtk"))
          (hsPkgs."cairo" or (buildDepError "cairo"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."data-accessor" or (buildDepError "data-accessor"))
          (hsPkgs."data-accessor-template" or (buildDepError "data-accessor-template"))
          (hsPkgs."colour" or (buildDepError "colour"))
          ] ++ (if flags.splitbase
          then [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."array" or (buildDepError "array"))
            ]
          else [ (hsPkgs."base" or (buildDepError "base")) ]);
        buildable = true;
        };
      };
    }