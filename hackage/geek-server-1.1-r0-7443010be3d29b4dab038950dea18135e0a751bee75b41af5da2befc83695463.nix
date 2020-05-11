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
      identifier = { name = "geek-server"; version = "1.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Jinjing Wang <nfjinjing@gmail.com>";
      author = "Jinjing Wang";
      homepage = "http://github.com/nfjinjing/geek";
      url = "";
      synopsis = "Geek blog engine server";
      description = "A dynamic blog engine, customizable with standard web technology, i.e. HTML, CSS and Javascript (JSON)";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."air" or (buildDepError "air"))
          (hsPkgs."hack2-handler-snap-server" or (buildDepError "hack2-handler-snap-server"))
          (hsPkgs."geek" or (buildDepError "geek"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."pandoc" or (buildDepError "pandoc"))
          (hsPkgs."hack2" or (buildDepError "hack2"))
          ];
        buildable = true;
        };
      exes = {
        "geek" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."air" or (buildDepError "air"))
            (hsPkgs."hack2-handler-snap-server" or (buildDepError "hack2-handler-snap-server"))
            (hsPkgs."geek" or (buildDepError "geek"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            (hsPkgs."hack2" or (buildDepError "hack2"))
            ];
          buildable = true;
          };
        };
      };
    }