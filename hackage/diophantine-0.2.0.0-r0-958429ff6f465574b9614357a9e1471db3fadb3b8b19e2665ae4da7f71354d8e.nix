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
      identifier = { name = "diophantine"; version = "0.2.0.0"; };
      license = "GPL-2.0-only";
      copyright = "Joe Jevnik 2013";
      maintainer = "Joe Jevnik <joejev@gmail.com>";
      author = "Joe Jevnik";
      homepage = "https://github.com/llllllllll/Math.Diophantine";
      url = "";
      synopsis = "A quadratic diophantine equation solving library.";
      description = "A library for solving quadratic diophantine equations.\n\nThis library is designed to solve for equations where:\n\n* the form is: ax^2 + bxy + cy^2 + dx + ey + f = 0\n\n* a,b,c,d,e,f are integers.\n\n* soltutions are restricted to x and y are also integers.\n\nThis library breaks down equations based on their type to solve them most\nefficiently. This library supports linear, simple hyperbolic, eliptical, and\nparabolic equations, with hyperbolics on the way.\n\nPlease send feedback or bugs to joejev\\@gmail.com.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (buildDepError "base")) ];
        buildable = true;
        };
      };
    }