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
      specVersion = "1.2";
      identifier = { name = "xosd"; version = "0.2.1"; };
      license = "BSD-3-Clause";
      copyright = "Don Stewart <dons00@gmail.com>";
      maintainer = "Don Stewart <dons00@gmail.com>";
      author = "";
      homepage = "http://code.haskell.org/~dons/code/xosd";
      url = "";
      synopsis = "A binding to the X on-screen display ";
      description = "A binding to the X on-screen display\n\nxosd is a library for displaying an on-screen display (like the one\non many TVs) on your X display.\n\nFor example, the following displays the string \\\"TEST\\\" in the center\nof the screen, in 34pt Helvetica, for 3 seconds.\n\n> runXOSD [ Timeout 3\n>         , VAlign VAlignMiddle\n>         , HAlign HAlignCenter\n>         , Font \"-adobe-helvetica-bold-r-*-*-34-*-*-*-*-*-*-*\"\n>         , Color \"LimeGreen\"\n>         , Display (String \"TEST\")]\n>                   (const \$ return ())\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (buildDepError "base")) ];
        libs = [ (pkgs."xosd" or (sysDepError "xosd")) ];
        buildable = true;
        };
      };
    }