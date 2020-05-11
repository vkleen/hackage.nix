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
      identifier = { name = "mysnapsession-example"; version = "0.4"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Chris Smith <cdsmith@gmail.com>";
      author = "Chris Smith <cdsmith@gmail.com>";
      homepage = "";
      url = "";
      synopsis = "Example projects using mysnapsession";
      description = "This is a collection of simple web applications that use\nthe mysnapsession package for stateful HTTP.\n\nAs of version 0.3, this uses Cabal's data file mechanism,\nso you'll need to install before you run to copy the\ndata files to where they are expected.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "animalgame" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."heist" or (buildDepError "heist"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."snap" or (buildDepError "snap"))
            (hsPkgs."snap-core" or (buildDepError "snap-core"))
            (hsPkgs."snap-server" or (buildDepError "snap-server"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."mysnapsession" or (buildDepError "mysnapsession"))
            (hsPkgs."clientsession" or (buildDepError "clientsession"))
            ];
          buildable = true;
          };
        "clientcount" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."heist" or (buildDepError "heist"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."snap" or (buildDepError "snap"))
            (hsPkgs."snap-core" or (buildDepError "snap-core"))
            (hsPkgs."snap-server" or (buildDepError "snap-server"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."mysnapsession" or (buildDepError "mysnapsession"))
            ];
          buildable = true;
          };
        };
      };
    }