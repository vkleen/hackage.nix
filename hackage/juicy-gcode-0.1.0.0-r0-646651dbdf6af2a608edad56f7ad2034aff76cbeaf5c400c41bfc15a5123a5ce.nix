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
      identifier = { name = "juicy-gcode"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "dlacko@gmail.com";
      author = "dlacko";
      homepage = "https://github.com/domoszlai/juicy-gcode";
      url = "";
      synopsis = "SVG to G-Code converter";
      description = "SVG to G-code converter that aims to support almost all of the SVG features. It currently supports all of the shapes except images (not planned) and text (maybe once as you it can be converted to curves easily anyway). The flavor of the generated G-Code can be configured providing a configuration file.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "juicy-gcode" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."svg-tree" or (buildDepError "svg-tree"))
            (hsPkgs."matrix" or (buildDepError "matrix"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."configurator" or (buildDepError "configurator"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."linear" or (buildDepError "linear"))
            (hsPkgs."lens" or (buildDepError "lens"))
            ];
          buildable = true;
          };
        };
      };
    }