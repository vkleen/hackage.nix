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
      specVersion = "1.9.2";
      identifier = { name = "language-lua"; version = "0.4.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "omeragacan@gmail.com";
      author = "Ömer Sinan Ağacan";
      homepage = "http://github.com/osa1/language-lua";
      url = "";
      synopsis = "Lua parser and pretty-printer";
      description = "Lua 5.2 lexer, parser and pretty-printer. Documentation: (<https://osa1.github.com/language-lua>)\n\nChangelog:\n\\0.4.1:\n\n- Some tweaks in pretty-printer.\n\n\\0.4.0:\n\n- `Table` and `FunDef` nodes are removed from simplified syntax.\n\n\\0.3.1:\n\n- Fixed incorrectly exported name `exp` in `Language.Lua.Parser` module.\n\n\\0.3.0:\n\n- Added non-annotated syntax to make code-generation easier.\n\n\\0.2.3:\n\n- Minor internal changes.\n\n\\0.2.2:\n\n- Some tweaks in pretty-printer.\n\n\\0.2.0:\n\n- Syntax tree is annotated. All parsers(`parseText`, `parseFile`) annotate resulting tree with source positions.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."array" or (buildDepError "array"))
          ];
        buildable = true;
        };
      };
    }