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
      identifier = { name = "charsetdetect-ae"; version = "1.1.0.3"; };
      license = "LicenseRef-LGPL";
      copyright = "";
      maintainer = "Artyom <yom@artyom.me>";
      author = "Max Bolingbroke <batterseapower@hotmail.com>";
      homepage = "http://github.com/aelve/charsetdetect-ae";
      url = "";
      synopsis = "Character set detection using Mozilla's Universal Character Set Detector";
      description = "Mozilla have developed a robust and efficient character set detection algorithm for use in their web browsers. The algorithm is able to detect all of the most frequently encountered character encodings totally automatically.\n\nThis library wraps up their library and exposes a very simple Haskell interface to it. The library is portable, and is confirmed to work on both Unix and Windows.\n\nThis library is a /maintained/ fork of charsetdetect:\n\n* It compiles with recent version of bytestring.\n\n* It works correctly in presence of Template Haskell on GHC 7.6.\n\n* It builds on 64-bit Windows.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          ];
        libs = if system.isWindows
          then if system.isX86_64
            then [
              (pkgs."stdc++-6" or (sysDepError "stdc++-6"))
              (pkgs."gcc_s_seh-1" or (sysDepError "gcc_s_seh-1"))
              ]
            else [
              (pkgs."stdc++-6" or (sysDepError "stdc++-6"))
              (pkgs."gcc_s_dw2-1" or (sysDepError "gcc_s_dw2-1"))
              ]
          else if system.isOsx
            then [ (pkgs."c++" or (sysDepError "c++")) ]
            else [ (pkgs."stdc++" or (sysDepError "stdc++")) ];
        buildable = true;
        };
      };
    }