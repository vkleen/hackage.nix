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
    flags = { old-directory = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "paths"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "2015-2017 Well-Typed LLP,\n2017 Herbert Valerio Riedel";
      maintainer = "hvr@gnu.org";
      author = "Herbert Valerio Riedel";
      homepage = "";
      url = "";
      synopsis = "Library for representing and manipulating type-safe file paths";
      description = "This library provides a more type-safe version of 'FilePath's together with thin wrappers around common IO operations.\n\nThis library is directly derived from @hackage-security@'s\n<http://hackage.haskell.org/package/hackage-security-0.5.2.2/docs/Hackage-Security-Util-Path.html Hackage.Security.Util.Path>\nmodule.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          ] ++ (if flags.old-directory
          then [
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            ]
          else [ (hsPkgs."directory" or (buildDepError "directory")) ]);
        buildable = true;
        };
      };
    }