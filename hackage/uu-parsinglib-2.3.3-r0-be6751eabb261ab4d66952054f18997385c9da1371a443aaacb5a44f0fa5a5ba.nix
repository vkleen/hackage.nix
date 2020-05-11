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
      specVersion = "1.4";
      identifier = { name = "uu-parsinglib"; version = "2.3.3"; };
      license = "MIT";
      copyright = "";
      maintainer = "doaitse@swierstra.net       ";
      author = "Doaitse Swierstra";
      homepage = "http://www.cs.uu.nl/wiki/bin/view/HUT/ParserCombinators";
      url = "";
      synopsis = "New version of the Utrecht University parser combinator library        ";
      description = "New version of the Utrecht University parser combinator library, providing online, error correction,\nannotation free, applicative style parser combinators which also provides a monadic interface\n\nThe file Text.ParserCombinators.UU.Examples contains a ready-made main function,\nwhich can be called to see the error correction at work.\n\n\nVersions above 2.1:\n\n* based on Control.Applicative\n\nVersions above 2.2:\n\n*  make use of type families\n*  contain a module with many list-based derived combinators\n\nVersion 2.3.1\n\n* fix for GHC 6.12, because of change in GADT definition handling\n\nVersion 2.3.2\n\n* added microsteps, which can be used to disambiguate\n\nVersion 2.3.3\n\n* added pMunch which takes a Boolean function, and recognises the longest prefix for which the symbols match the predicate\n\n* added the infix operator with piority 2 <?> :: P state a -> String -> P st a which replaces the list of expected symbols\nin error message by its right argument String\n\nFuture versions above 2.3\n\n* contain some form of abstract interpretation from the old uulib versions of these combinators\n\n* are closer to Haskell98, since they do not make use of type families anymore\n\n* note that the basic parser interface will probably not change much when we add more features, but the calling conventions\nof the outer parser and the class structure upon which the parametrisation is based may change\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."haskell98" or (buildDepError "haskell98"))
          ];
        buildable = true;
        };
      };
    }