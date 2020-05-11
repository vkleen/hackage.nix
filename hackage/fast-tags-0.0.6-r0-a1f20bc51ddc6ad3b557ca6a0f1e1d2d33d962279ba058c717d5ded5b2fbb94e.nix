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
      identifier = { name = "fast-tags"; version = "0.0.6"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Evan Laforge <qdunkan@gmail.com>";
      author = "Evan Laforge";
      homepage = "https://github.com/elaforge/fast-tags";
      url = "";
      synopsis = "Fast incremental vi tags.";
      description = "Yet another tags program.  Like hasktags, it uses its own parser rather\nthan haskell-src or haskell-src-exts, so it's fast.  It understands\nhsc files, though not literate haskell.\n\nIn addition, it will load an existing tags file and merge generated tags.\n\nThe intent is to bind it to vim's BufWrite autocommand to automatically\nkeep the tags file up to date.  This only works for files changed by the\neditor of course, so you may want to bind 'rm tags' to a 'pull' posthook.\n\nLimitations:\n\n- No emacs tags, but they would be easy to add.\n\n- Not using a real haskell parser means there are more likely to be dark\ncorners that don't parse right.\n\n- Only top-level functions with type declarations are tagged.  Top-level\nfunctions without type declarations are skipped, as are ones inside 'let'\nor 'where'.\n\n- Code has to be indented \\\"properly\\\", so brace and semicolon style with\nstrange dedents will probably confuse it.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "fast-tags" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."ghc" or (buildDepError "ghc"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }