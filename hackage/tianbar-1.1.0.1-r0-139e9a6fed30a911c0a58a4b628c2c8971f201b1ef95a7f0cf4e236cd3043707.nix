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
      identifier = { name = "tianbar"; version = "1.1.0.1"; };
      license = "MIT";
      copyright = "";
      maintainer = "a@koterpillar.com";
      author = "Alexey Kotlyarov";
      homepage = "https://github.com/koterpillar/tianbar";
      url = "";
      synopsis = "A desktop bar based on WebKit";
      description = "A desktop bar using WebKit for rendering as much as possible.\nBased on Taffybar.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."dbus" or (buildDepError "dbus"))
          (hsPkgs."xmonad" or (buildDepError "xmonad"))
          (hsPkgs."xmonad-contrib" or (buildDepError "xmonad-contrib"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
          (hsPkgs."blaze-markup" or (buildDepError "blaze-markup"))
          ];
        buildable = true;
        };
      exes = {
        "tianbar" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."dbus" or (buildDepError "dbus"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."haskell-gi-base" or (buildDepError "haskell-gi-base"))
            (hsPkgs."http-types" or (buildDepError "http-types"))
            (hsPkgs."gi-gdk" or (buildDepError "gi-gdk"))
            (hsPkgs."gi-gio" or (buildDepError "gi-gio"))
            (hsPkgs."gi-glib" or (buildDepError "gi-glib"))
            (hsPkgs."gi-gtk" or (buildDepError "gi-gtk"))
            (hsPkgs."gi-webkit2" or (buildDepError "gi-webkit2"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."mime-types" or (buildDepError "mime-types"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."xdg-basedir" or (buildDepError "xdg-basedir"))
            ];
          pkgconfig = [
            (pkgconfPkgs."gtk+-3.0" or (pkgConfDepError "gtk+-3.0"))
            ];
          buildable = true;
          };
        };
      };
    }