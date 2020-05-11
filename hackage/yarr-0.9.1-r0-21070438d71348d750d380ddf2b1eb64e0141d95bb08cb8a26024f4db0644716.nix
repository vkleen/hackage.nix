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
      identifier = { name = "yarr"; version = "0.9.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "Roman Leventov <leventov@ya.ru>";
      author = "Roman Leventov";
      homepage = "";
      url = "";
      synopsis = "Yet another array library";
      description = "Yarr is a new blazing fast dataflow framework (array library),\nmainly intented to process @Storable@s (including all \\\"primitive\\\" numeric types)\nand @fixed-vector@s of them, for example coordinates,\ncolor components, complex numbers.\n\nYarr framework is inspired by @repa@ library and inherits its features,\nincluding shape-polymorphism and auto-parallelism.\nAdditionaly, the framework is polymorphic over type and arity\nof fixed-size vectors and supports neat flow operations over them.\nFor example, you can convert colored image to greyscale like this:\n\n> let greyImage = zipElems (\\r g b -> 0.21 * r + 0.71 * g + 0.07 * b) image\n\nThe library is considerably faster than @repa@.\nCanny edge detector on Yarr is 40% (on 5 threads)\nand 55% (in sequential mode) faster then on @repa@.\n\nShortcoming by design: lack of pure indexing interface.\n\n/Work ahead:/\n\n* Safe fold wrappers\n\n* Unresolved issues with parameterized unrolling in slice-wise loading\n\nTo start with, read documentation in the root module: \"Data.Yarr\".\n\n[@Yarr!@]";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."ghc-prim" or (buildDepError "ghc-prim"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."fixed-vector" or (buildDepError "fixed-vector"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."missing-foreign" or (buildDepError "missing-foreign"))
          ];
        buildable = true;
        };
      };
    }