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
      identifier = { name = "comfort-array"; version = "0.0.1.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Henning Thielemann <haskell@henning-thielemann.de>";
      author = "Henning Thielemann <haskell@henning-thielemann.de>";
      homepage = "http://hub.darcs.net/thielema/comfort-array/";
      url = "";
      synopsis = "Arrays where the index type is a function of the shape type";
      description = "Arrays from the basic @array@ package are already very powerful\ncompared with arrays in other languages.\nIt provides arrays of any dimension in a type safe and uniform way\nwith free choice of the lower bounds (0, 1, or whatever you like).\n\nThis package goes one step further:\nThe shape and the index type are different,\nbut the index type is a type function of the shape type.\nThis offers much more flexibility and type safety.\n\nSome examples are:\n\n* @Range@:\nAllow dynamic choice of lower and upper array bounds\nsuch as in the 'Array's from the @array@ package.\nYou can combine it with other shapes in other dimensions.\nIt allows you to describe the bounds of each dimension individually.\n\n* @Shifted@:\nDescribe array bounds by start index and length.\nIt is sometimes more natural to use these parameters.\nE.g. a non-negative index type like 'Word' cannot represent @-1@\nand thus cannot encode an empty range starting with index @0@.\n\n* @Square@:\nAn 2D array where both dimensions always have equal size.\n\n* @ZeroBased, OneBased@:\nArrays with fixed lower bound, either 0 or 1, respectively.\n\n* Arrays with indices like 'LT', 'EQ', 'GT' and dummy shape.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."utility-ht" or (buildDepError "utility-ht"))
          (hsPkgs."base" or (buildDepError "base"))
          ];
        buildable = true;
        };
      };
    }