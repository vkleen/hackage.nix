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
      specVersion = "1.20";
      identifier = { name = "fltkhs"; version = "0.2.0.2"; };
      license = "MIT";
      copyright = "";
      maintainer = "aditya.siram@gmail.com";
      author = "Aditya Siram";
      homepage = "http://github.com/deech/fltkhs";
      url = "";
      synopsis = "FLTK bindings";
      description = "Low level bindings for the FLTK GUI toolkit.";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.c2hs or (pkgs.buildPackages.c2hs or (buildToolDepError "c2hs")))
          ];
        buildable = true;
        };
      exes = {
        "fltkhs-fluidtohs" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          buildable = true;
          };
        "fltkhs-pack" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-tile" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-nativefilechooser-simple-app" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-table-as-container" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-texteditor-simple" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-textdisplay-with-colors" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-doublebuffer" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-make-tree" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-tree-simple" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-table-spreadsheet-with-keyboard-nav" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-test_call" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-buttons" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-table-simple" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-table-sort" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            (hsPkgs."process" or (buildDepError "process"))
            ];
          buildable = true;
          };
        "fltkhs-arc" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            ];
          buildable = true;
          };
        "fltkhs-bitmap" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        "fltkhs-boxtype" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        "fltkhs-browser" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        "fltkhs-clock" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."fltkhs" or (buildDepError "fltkhs"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            ];
          buildable = true;
          };
        };
      };
    }