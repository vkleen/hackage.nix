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
      specVersion = "0";
      identifier = { name = "vector-space"; version = "0.0"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2007-2008 by Conal Elliott";
      maintainer = "conal@conal.net";
      author = "Conal Elliott ";
      homepage = "http://haskell.org/haskellwiki/vector-space";
      url = "http://darcs.haskell.org/vector-space";
      synopsis = "Vector & affine spaces, plus ";
      description = "vector-space provides classes and generic operations for vector\nspaces and affine spaces.  It also defines a type of infinite towers\nof generalized derivatives.  A generalized derivative is a linear\ntransformation rather than one of the usual concrete representations\n(scalars, vectors, matrices, ...).\n\nProject wiki page: <http://haskell.org/haskellwiki/vector-space>\n\nThe module documentation pages have links to colorized source code and\nto wiki pages where you can read and contribute user comments.  Enjoy!\n\n&#169; 2008 by Conal Elliott; BSD3 license.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (buildDepError "base")) ];
        buildable = true;
        };
      };
    }