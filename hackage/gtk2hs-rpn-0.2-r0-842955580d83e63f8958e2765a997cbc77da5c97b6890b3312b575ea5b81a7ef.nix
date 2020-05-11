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
      identifier = { name = "gtk2hs-rpn"; version = "0.2"; };
      license = "LicenseRef-LGPL";
      copyright = "";
      maintainer = "Maurício CA <mauricio.antunes@gmail.com>";
      author = "";
      homepage = "http://bitbucket.org/mauricio/gtk2hs-rpn";
      url = "";
      synopsis = "Adds a module to gtk2hs allowing layouts to be defined using\nreverse polish notation.";
      description = "Adds a module \"Graphics.UI.Gtk.Layout.Rpn\" to @gtk2hs@. This\nmodule defines a type @RPN@ for operators, which is an\ninstance of 'Data.Monoid.Monoid' class.  You can combine those\noperators using reverse polish notation, as made popular by,\nsay, HP calculators. There are operators for layout elements,\nlike expanders, panes, boxes and notebooks, and for a few\nother widgets, like buttons and labels. You can also insert\nany existing @gtk2hs@ widget in the stack.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."gtk" or (buildDepError "gtk"))
          (hsPkgs."cairo" or (buildDepError "cairo"))
          (hsPkgs."glib" or (buildDepError "glib"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          ];
        buildable = true;
        };
      };
    }