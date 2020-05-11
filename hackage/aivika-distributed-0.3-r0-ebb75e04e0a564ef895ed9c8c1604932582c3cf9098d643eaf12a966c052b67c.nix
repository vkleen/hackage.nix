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
      identifier = { name = "aivika-distributed"; version = "0.3"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2015-2016. David Sorokin <david.sorokin@gmail.com>";
      maintainer = "David Sorokin <david.sorokin@gmail.com>";
      author = "David Sorokin";
      homepage = "http://www.aivikasoft.com/en/products/aivika.html";
      url = "";
      synopsis = "Parallel distributed discrete event simulation module for the Aivika library";
      description = "This package extends the aivika-transformers [1] package with facilities for running parallel distributed simulations.\nIt uses an optimistic strategy known as the Time Warp method. To synchronize the global virtual time, since version 0.3\nit uses Samadi's algorithm.\n\n\\[1] <http://hackage.haskell.org/package/aivika-transformers>\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."stm" or (buildDepError "stm"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."distributed-process" or (buildDepError "distributed-process"))
          (hsPkgs."aivika" or (buildDepError "aivika"))
          (hsPkgs."aivika-transformers" or (buildDepError "aivika-transformers"))
          ];
        buildable = true;
        };
      };
    }