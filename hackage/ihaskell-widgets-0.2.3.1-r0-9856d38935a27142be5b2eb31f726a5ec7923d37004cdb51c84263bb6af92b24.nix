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
      identifier = { name = "ihaskell-widgets"; version = "0.2.3.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "Sumit Sahrawat <sumit.sahrawat.apm13@iitbhu.ac.in>,\nAndrew Gibiansky <andrew.gibiansky@gmail.com>";
      author = "Sumit Sahrawat";
      homepage = "http://www.github.com/gibiansky/IHaskell";
      url = "";
      synopsis = "IPython standard widgets for IHaskell.";
      description = "";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = (([
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."ipython-kernel" or (buildDepError "ipython-kernel"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."vinyl" or (buildDepError "vinyl"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."scientific" or (buildDepError "scientific"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."ihaskell" or (buildDepError "ihaskell"))
          ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).ge "7.10.2") (hsPkgs."singletons" or (buildDepError "singletons"))) ++ (pkgs.lib).optionals (compiler.isGhc && (compiler.version).eq "7.10.1") [
          (hsPkgs."singletons" or (buildDepError "singletons"))
          (hsPkgs."nats" or (buildDepError "nats"))
          ]) ++ (pkgs.lib).optionals (compiler.isGhc && (compiler.version).lt "7.10.1") [
          (hsPkgs."singletons" or (buildDepError "singletons"))
          (hsPkgs."nats" or (buildDepError "nats"))
          ];
        buildable = true;
        };
      };
    }