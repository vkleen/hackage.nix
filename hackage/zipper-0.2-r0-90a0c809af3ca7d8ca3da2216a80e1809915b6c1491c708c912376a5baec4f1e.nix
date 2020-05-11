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
      specVersion = "1.2.1";
      identifier = { name = "zipper"; version = "0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "generics@haskell.org";
      author = "Alexey Rodriguez,\nStefan Holdermans,\nAndres Löh,\nJohan Jeuring";
      homepage = "http://www.cs.uu.nl/wiki/GenericProgramming/Multirec";
      url = "";
      synopsis = "Generic zipper for families of recursive datatypes";
      description = "The Zipper is a data structure that allows typed navigation on a value.\nIt maintains a subterm as a current point of focus. The rest of the value\nis the context. Focus and context are automatically updated when navigating\nup, down, left or right in the value. The term that is in focus can also\nbe modified.\n\nThis library offers a generic Zipper for families of datatypes. In particular,\nit is possible to move the focus between subterms of different types, in an\nentirely type-safe way. This library is built on top of the multirec library,\nso all that is required to get a Zipper for a datatype family is to instantiate\nthe multirec library for that family.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."multirec" or (buildDepError "multirec"))
          ];
        buildable = true;
        };
      };
    }