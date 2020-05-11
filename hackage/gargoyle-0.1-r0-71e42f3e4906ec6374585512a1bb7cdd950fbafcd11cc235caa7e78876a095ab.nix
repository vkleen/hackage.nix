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
      identifier = { name = "gargoyle"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) Obsidian Systems LLC 2017";
      maintainer = "maintainer@obsidian.systems";
      author = "Obsidian Systems LLC";
      homepage = "";
      url = "";
      synopsis = "Automatically spin up and spin down local daemons";
      description = "Gargoyle is a framework for managing daemons from Haskell. In the current release the only requirement is that the daemon be able to communicate over a Unix domain socket. See <https://hackage.haskell.org/package/gargoyle-postgresql gargoyle-postgresql> for a fully worked out example.\n\nTo use Gargoyle the client must:\n\n1. Define a value of the 'Gargoyle' type which specifies how to administer the daemon.\n2. Create an executable whose `main` is 'gargoyleMain'. The name of this executable should match the executable name specified in the '_gargoyle_exec' field of the 'Gargoyle'.\n3. The client will run their code with 'withGargoyle' to gain access to the daemon.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."filelock" or (buildDepError "filelock"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."process" or (buildDepError "process"))
          ];
        buildable = true;
        };
      };
    }