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
      identifier = { name = "biophd"; version = "0.0.8"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Dan Fornika <dfornika@gmail.com>";
      author = "Ketil Malde <ketil@malde.org>";
      homepage = "https://github.com/dfornika/biophd/wiki";
      url = "";
      synopsis = "Library for reading phd sequence files";
      description = "Library for reading phd sequence files";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."biocore" or (buildDepError "biocore"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."time-locale-compat" or (buildDepError "time-locale-compat"))
          ];
        buildable = true;
        };
      };
    }