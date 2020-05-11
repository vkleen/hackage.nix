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
      specVersion = "1.8";
      identifier = { name = "hbro"; version = "0.4.4"; };
      license = "LicenseRef-OtherLicense";
      copyright = "";
      maintainer = "koral at mailoo dot org";
      author = "koral";
      homepage = "";
      url = "";
      synopsis = "A suckless minimal KISSy browser";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."webkit" or (buildDepError "webkit"))
          (hsPkgs."gtk" or (buildDepError "gtk"))
          (hsPkgs."glade" or (buildDepError "glade"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."dyre" or (buildDepError "dyre"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."url" or (buildDepError "url"))
          (hsPkgs."zeromq-haskell" or (buildDepError "zeromq-haskell"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."unix" or (buildDepError "unix"))
          ];
        buildable = true;
        };
      exes = {
        "hbro" = {
          depends = [
            (hsPkgs."hbro" or (buildDepError "hbro"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."gtk" or (buildDepError "gtk"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."webkit" or (buildDepError "webkit"))
            ];
          buildable = true;
          };
        };
      };
    }