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
      identifier = { name = "lambdacat"; version = "0.1.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Andreas Baldeau <andreas@baldeau.net>,\nDaniel Ehlers <danielehlers@mindeye.net>";
      author = "Andreas Baldeau, Daniel Ehlers";
      homepage = "http://github.com/baldo/lambdacat";
      url = "";
      synopsis = "Webkit Browser";
      description = "A Browser based on WebKit, concepted to be easy to use and\nextendable.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."gtk" or (buildDepError "gtk"))
          (hsPkgs."glade" or (buildDepError "glade"))
          (hsPkgs."webkit" or (buildDepError "webkit"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."dyre" or (buildDepError "dyre"))
          (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
          ];
        buildable = true;
        };
      exes = { "lambdacat" = { buildable = true; }; };
      };
    }