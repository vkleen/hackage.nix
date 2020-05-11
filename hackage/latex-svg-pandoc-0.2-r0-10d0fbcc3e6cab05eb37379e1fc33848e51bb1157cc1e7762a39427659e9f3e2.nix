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
      specVersion = "2.2";
      identifier = { name = "latex-svg-pandoc"; version = "0.2"; };
      license = "BSD-3-Clause";
      copyright = "2020 Oleg Grenrus, 2015-2019 Liam O'Connor";
      maintainer = "Oleg Grenrus <oleg.grenrus@iki.fi>";
      author = "Oleg Grenrus, Liam O'Connor";
      homepage = "http://github.com/phadej/latex-svg#readme";
      url = "";
      synopsis = "Render LaTeX formulae in pandoc documents to images with an actual LaTeX";
      description = "This library provides utility functions to convert LaTeX equations to images\nin Pandoc documents using the @latex-svg-image@ package.  It requires an\nactual LaTeX installation to work (@latex@, @dvisvgm@).\n\nAn executable is also provided which can be used as a Pandoc filter from the\ncommandline, which allows this technique to be used even for standalone Pandoc\njobs.\n\nThis is a fork of https://github.com/liamoc/latex-formulae";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."latex-svg-image" or (buildDepError "latex-svg-image"))
          (hsPkgs."pandoc-types" or (buildDepError "pandoc-types"))
          (hsPkgs."text" or (buildDepError "text"))
          ];
        buildable = true;
        };
      exes = {
        "latex-svg-filter" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."latex-svg-image" or (buildDepError "latex-svg-image"))
            (hsPkgs."latex-svg-pandoc" or (buildDepError "latex-svg-pandoc"))
            (hsPkgs."pandoc-types" or (buildDepError "pandoc-types"))
            ];
          buildable = true;
          };
        };
      };
    }