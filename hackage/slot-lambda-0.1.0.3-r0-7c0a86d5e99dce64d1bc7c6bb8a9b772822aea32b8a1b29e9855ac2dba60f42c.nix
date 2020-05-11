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
      specVersion = "1.10";
      identifier = { name = "slot-lambda"; version = "0.1.0.3"; };
      license = "MIT";
      copyright = "";
      maintainer = "ducis_cn@126.com";
      author = "ducis";
      homepage = "https://github.com/ducis/pa_slot";
      url = "";
      synopsis = "Write lambdas without naming the parameters.";
      description = "Write lambdas without naming the parameters. Example:\n\n@\n[s| ı : ı : _ı : ı : _ı : _ı : _0 : [] |] \\'a\\' \\'b\\' \\'c\\'\n=  (\\\\x y z -> x:y:y:z:z:z:x:[]) \\'a\\' \\'b\\' \\'c\\'\n=  \\\"abbccca\\\"\n@\n\nThe unicode character @ı@(U+0131, not the number @1@!) representing a \\'slot\\' can be input in vim with the digraph \\'i.\\' . @_ı@ stands for the same argument as the immediate left @ı@ does.\nAny suggestions of another unicode character in the 'Letter, Lowercase' category that\n\n1)no one would use as a variable name, and\n\n2)can be easily input in vim\n\nare welcome.\nYou can also use @_0@,@_1@,@_2@,... to refer to the 1st, 2nd, 3rd, ... arguments.\n\nJust @import Syntax.Slot@ and use either @[s| ... |]@ or @[slot| ... |]@, which are the same thing given two names for convenience.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."haskell-src-meta" or (buildDepError "haskell-src-meta"))
          (hsPkgs."syb" or (buildDepError "syb"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
          (hsPkgs."containers" or (buildDepError "containers"))
          ];
        buildable = true;
        };
      };
    }