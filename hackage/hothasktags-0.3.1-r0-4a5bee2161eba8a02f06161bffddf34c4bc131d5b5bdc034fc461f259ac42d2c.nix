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
      identifier = { name = "hothasktags"; version = "0.3.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Luke Palmer <lrpalmer@gmail.com>";
      author = "Luke Palmer <lrpalmer@gmail.com>";
      homepage = "http://github.com/luqui/hothasktags";
      url = "";
      synopsis = "Generates ctags for Haskell, incorporating import lists and qualified imports";
      description = "hothasktags generates ctags files for Haskell, with knowledge of import lists\nand qualified imports.  It provides a smart go-to-definition for Vim, that almost\nalways gets it right in the presence of multiple names from different modules.\n\nYou will want to configure Vim to allow dots in keywords, because hothasktags\ngenerates tags for qualified names.  You can do this with:\n\n> set iskeyword=a-z,A-Z,_,.,39\n\n(The 39 is for the prime character)\n\nUsage is easy, just give hothasktags the names of all the haskell sources you\nwant to index and redirect into a tags file.  For example:\n\n> find . | egrep '\\.hs\$' | xargs hothasktags > tags\n\nwill index all the hs files under the current directory.\n\nhothasktags does not work with the emacs tag file format.  Sorry.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hothasktags" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
            (hsPkgs."cpphs" or (buildDepError "cpphs"))
            ];
          buildable = true;
          };
        };
      };
    }