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
      identifier = { name = "Raincat"; version = "1.1.1.3"; };
      license = "BSD-3-Clause";
      copyright = "Garrick Chin 2008-2010";
      maintainer = "Mikhail S. Pobolovets <styx.mp@gmail.com>";
      author = "Garrick Chin, Susan Lin, SooHyun Jang, Anthony Maurice, William Wang,\nAndrew Zheng, Rachel Berkowitz, Spencer Ying, Tal Stramer, Mikhail Pobolovets,\nSergei Trofimovich";
      homepage = "http://raincat.bysusanlin.com/";
      url = "git://github.com/styx/Raincat.git";
      synopsis = "A puzzle game written in Haskell with a cat in lead role";
      description = "Project Raincat is a game developed by Carnegie Mellon students\nthrough GCS during the Fall 2008 semester. Raincat features game\nplay inspired from classics Lemmings and The Incredible Machine.\nThe project proved to be an excellent learning experience for\nthe programmers. Everything is programmed in Haskell.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "raincat" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."extensible-exceptions" or (buildDepError "extensible-exceptions"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."GLUT" or (buildDepError "GLUT"))
            (hsPkgs."OpenGL" or (buildDepError "OpenGL"))
            (hsPkgs."SDL" or (buildDepError "SDL"))
            (hsPkgs."SDL-image" or (buildDepError "SDL-image"))
            (hsPkgs."SDL-mixer" or (buildDepError "SDL-mixer"))
            ];
          buildable = true;
          };
        };
      };
    }