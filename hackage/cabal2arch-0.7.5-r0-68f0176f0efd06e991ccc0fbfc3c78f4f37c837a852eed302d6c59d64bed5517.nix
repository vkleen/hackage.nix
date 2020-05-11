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
      identifier = { name = "cabal2arch"; version = "0.7.5"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "ArchHaskell Team <arch-haskell@haskell.org>";
      author = "Don Stewart <dons@galois.com>";
      homepage = "http://github.com/archhaskell/";
      url = "";
      synopsis = "Create Arch Linux packages from Cabal packages.";
      description = "Create Arch Linux packages from Cabal packages.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "cabal2arch" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."archlinux" or (buildDepError "archlinux"))
            ];
          buildable = true;
          };
        "manycabal2arch" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."archlinux" or (buildDepError "archlinux"))
            ];
          buildable = true;
          };
        };
      };
    }