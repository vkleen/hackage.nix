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
      identifier = { name = "haskell-src-exts-simple"; version = "1.18.0.1"; };
      license = "MIT";
      copyright = "2016, Bertram Felgenhauer";
      maintainer = "Bertram Felgenhauer <int-e@gmx.de>";
      author = "Bertram Felgenhauer";
      homepage = "https://github.com/int-e/haskell-src-exts-simple";
      url = "";
      synopsis = "A simplified view on the haskell-src-exts AST";
      description = "This package provides a shim for haskell-src-exts (HSE), exposing the\nsame AST but without annotations.\n\nThis package is useful for synthesizing and manipulating HSE ASTs\nthat don't carry source location information. It may also aid\nin porting packages from haskell-src-exts 1.17 to 1.18, but it\nis not a drop-in replacement for the old annotation-free AST.\nSee COMPATIBILITY.md for details.\n\nSee \"Language.Haskell.Exts.Simple\" for further information.\n\n__Versioning policy__: To be able to track the haskell-src-exts version\nnumbers conveniently, the first __three__ components of the version\nwill be treated as the major version, followed by the minor version\nas usual.\n\n__GHC compatibility__: With ghc-7.8, some constructors only work as\npatterns. See \"Language.Haskell.Exts.Simple.Syntax#t:Literal\"";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
          ];
        buildable = true;
        };
      };
    }