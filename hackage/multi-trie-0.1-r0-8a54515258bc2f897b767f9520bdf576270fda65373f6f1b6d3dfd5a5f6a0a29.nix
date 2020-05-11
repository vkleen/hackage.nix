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
      identifier = { name = "multi-trie"; version = "0.1"; };
      license = "MIT";
      copyright = "Vadim Vinnik, 2016";
      maintainer = "Vadim Vinnik <vadim.vinnik@gmail.com>";
      author = "Vadim Vinnik <vadim.vinnik@gmail.com>";
      homepage = "https://github.com/vadimvinnik/multi-trie";
      url = "";
      synopsis = "Trie of sets, as a model for compound names having multiple values";
      description = "A multi-trie is a trie (i.e. a tree whose child nodes have distinct labels)\nwith each node containing a list of values.\nThis data structure represents a structured many-valued naming: names are\ncompound and form a monoid under concatenation; each name can have multiple\nvalues.\nSome operations could be defined for multi-tries in a rather natural way,\nincluding 'map', 'union', 'intersection', 'cartesian' product.\nMoreover, a multi-trie can contain not only ordinary values but also\nfunctions that makes it possible to apply a multi-trie of functions to a\nmulti-trie of argument values. This makes 'MultiTrie' an instance of\n'Functor', 'Applicative' and 'Monad'.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."composition" or (buildDepError "composition"))
          ];
        buildable = true;
        };
      tests = {
        "Spec" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HTF" or (buildDepError "HTF"))
            (hsPkgs."multi-trie" or (buildDepError "multi-trie"))
            (hsPkgs."containers" or (buildDepError "containers"))
            ];
          buildable = true;
          };
        };
      };
    }