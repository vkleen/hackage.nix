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
    flags = { splitbase = true; };
    package = {
      specVersion = "1.6";
      identifier = { name = "splot"; version = "0.3.3"; };
      license = "BSD-3-Clause";
      copyright = "Eugene Kirpichov, 2010";
      maintainer = "Eugene Kirpichov <ekirpichov@gmail.com>";
      author = "Eugene Kirpichov <ekirpichov@gmail.com>";
      homepage = "http://www.haskell.org/haskellwiki/Splot";
      url = "";
      synopsis = "A tool for visualizing the lifecycle of many concurrent multi-staged processes.";
      description = "A tool for visualizing the lifecycle of many concurrent multi-staged processes.\nEach process has a name, it starts at a point in time, ends at a point in time, and at some\npoints in time it changes colour. See presentation <http://www.slideshare.net/jkff/two-visualization-tools>\nor download <http://jkff.info/presentations/two-visualization-tools.pdf>.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "splot" = {
          depends = [
            (hsPkgs."cairo" or (buildDepError "cairo"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."bytestring-lexing" or (buildDepError "bytestring-lexing"))
            (hsPkgs."strptime" or (buildDepError "strptime"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."colour" or (buildDepError "colour"))
            (hsPkgs."Chart" or (buildDepError "Chart"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            ] ++ [ (hsPkgs."base" or (buildDepError "base")) ];
          buildable = true;
          };
        };
      };
    }