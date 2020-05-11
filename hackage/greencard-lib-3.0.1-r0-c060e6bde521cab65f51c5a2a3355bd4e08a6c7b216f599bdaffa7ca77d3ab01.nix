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
      specVersion = "1.2";
      identifier = { name = "greencard-lib"; version = "3.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Alastair Reid <alastair@reid-consulting-uk.ltd.uk>; Sigbjorn Finne <sof@galois.com>";
      author = "Alastair Reid, Sigbjorn Finne, and Thomas Nordin";
      homepage = "http://www.haskell.org/greencard/";
      url = "";
      synopsis = "A foreign function interface pre-processor library for Haskell";
      description = "Green Card is a foreign function interface preprocessor for Haskell,\nsimplifying the task of interfacing Haskell programs to external libraries\n(which are normally exposed via C interfaces).\n\nThis package provides the Foreign.GreenCard library; the greencard binary is\npackaged separately.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."pretty" or (buildDepError "pretty"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."greencard" or (buildDepError "greencard"))
          ];
        buildable = true;
        };
      };
    }