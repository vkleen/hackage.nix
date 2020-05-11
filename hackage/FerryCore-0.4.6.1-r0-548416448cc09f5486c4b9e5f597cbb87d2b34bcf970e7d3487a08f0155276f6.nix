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
      identifier = { name = "FerryCore"; version = "0.4.6.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Jeroen Weijers <jeroen.weijers@uni-tuebingen.de>";
      author = "Jeroen Weijers <jeroen.weijers@uni-tuebingen.de> Tom Schreiber <tom.schreiber@uni-tuebingen.de>";
      homepage = "";
      url = "";
      synopsis = "Ferry Core Components";
      description = "The Ferry 2.0 Core\nThis package contains the core components of the Ferry compiler [1]. It lacks a parser\nfor the ferry language and the normalisation ferry front, and the conversion of ferry\nfront language to the ferry core language.\n\nIt exposes the compiler parts that transform (un)typed ferry core into table algebra [2].\nWhen provided an untyped ferrycore AST this ast must have the shape of a normalised\nferry program. When a typed ast is used as input it is required to be typed correctly as well.\nThe ferry compiler uses this package providing it untyped ferrycore. DSH [3] uses this\npackage providing a typed AST.\n\n1. <http://www-db.informatik.uni-tuebingen.de/research/ferry>\n\n2. <http://dbworld.informatik.uni-tuebingen.de/projects/pathfinder/wiki/Logical_Algebra>\n\n3. <http://www-db.informatik.uni-tuebingen.de/files/publications/ferryhaskell.pdf>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."TableAlgebra" or (buildDepError "TableAlgebra"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."HaXml" or (buildDepError "HaXml"))
          (hsPkgs."pretty" or (buildDepError "pretty"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."haskell98" or (buildDepError "haskell98"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          ];
        buildable = true;
        };
      };
    }