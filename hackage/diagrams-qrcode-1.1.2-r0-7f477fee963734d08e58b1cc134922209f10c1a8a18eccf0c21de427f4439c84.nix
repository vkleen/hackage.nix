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
      identifier = { name = "diagrams-qrcode"; version = "1.1.2"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2012-2014 Prowdsponsor <opensource@prowdsponsor.com>";
      maintainer = "Felipe Lessa <felipe.lessa@prowdsponsor.com>";
      author = "Felipe Lessa <felipe.lessa@prowdsponsor.com>";
      homepage = "https://github.com/prowdsponsor/diagrams-qrcode";
      url = "";
      synopsis = "Draw QR codes to SVG, PNG, PDF or PS files.";
      description = "This library is able to draw diagrams of QR codes using the\n@diagrams@ library.  In order to create the QR code itself, you\nmay use either the @haskell-qrencode@ library or @qrcode@\nlibrary, both are supported.  In order to draw and save the\ndiagram to a file, we suggest using either the @diagrams-svg@\nlibrary (pure Haskell, fast, SVG output only) or the\n@diagrams-cairo@ library (requires Cairo, supports many\ndifferent output targets, including SVG, PNG, PDF, PS and\ndirectly onto a GUI).\n\nFor an example of how this library may be used, please see the\nexamples on the source code.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."colour" or (buildDepError "colour"))
          (hsPkgs."diagrams-core" or (buildDepError "diagrams-core"))
          (hsPkgs."diagrams-lib" or (buildDepError "diagrams-lib"))
          ];
        buildable = true;
        };
      };
    }