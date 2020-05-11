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
      identifier = { name = "temporary-resourcet"; version = "0.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2003-2006, Isaac Jones\n(c) 2005-2009, Duncan Coutts\n(c) 2014-2018, Thomas Tuegel";
      maintainer = "Thomas Tuegel <ttuegel@mailbox.org>";
      author = "Isaac Jones <ijones@syntaxpolice.org>\nDuncan Coutts <duncan@haskell.org>\nThomas Tuegel <ttuegel@mailbox.org>";
      homepage = "http://www.github.com/ttuegel/temporary-resourcet";
      url = "";
      synopsis = "Portable temporary files and directories with automatic deletion";
      description = "The functions for creating temporary files and directories in the base\nlibrary are quite limited. The @unixutils@ package contains some good ones,\nbut they aren't portable to Windows.\n\nThis library repackages the Cabal implementations of its own temporary file\nand folder functions so that you can use them without linking against Cabal\nor depending on it being installed.\n\nThis library provides the same functionality as the @temporary@ package, but\nuses @resourcet@ to provide automatic deletion without nesting @withTempFile@.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."resourcet" or (buildDepError "resourcet"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ] ++ (pkgs.lib).optional (!system.isWindows) (hsPkgs."unix" or (buildDepError "unix"));
        buildable = true;
        };
      tests = {
        "test-temporary-resourcet" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."resourcet" or (buildDepError "resourcet"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."temporary-resourcet" or (buildDepError "temporary-resourcet"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            ];
          buildable = true;
          };
        };
      };
    }