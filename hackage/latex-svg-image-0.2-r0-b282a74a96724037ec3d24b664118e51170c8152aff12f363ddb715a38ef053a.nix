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
      identifier = { name = "latex-svg-image"; version = "0.2"; };
      license = "BSD-3-Clause";
      copyright = "2020 Oleg Grenrus, 2015-2019 Liam O'Connor";
      maintainer = "Oleg Grenrus <oleg.grenrus@iki.fi>";
      author = "Oleg Grenrus, Liam O'Connor";
      homepage = "http://github.com/phadej/latex-svg#readme";
      url = "";
      synopsis = "A library for rendering LaTeX formulae as SVG using an actual LaTeX";
      description = "This library provides the basic infrastructure necessary to convert LaTeX\nformulae into SVG images, using a real LaTeX installation. This is useful in\nparticular for showing formulae on websites, where using alternatives like\nMathJax is not an option (e.g, when you want to use various LaTeX packages that\nMathJax doesn't support).\n\nThis library requires @latex@, @dvisvgm@ to be present in the system.\n\nThe companion library to this, @latex-svg-pandoc@, provides useful tools to\nintegrate this library with pandoc, when generating HTML documents.\n\nThis is a fork of https://github.com/liamoc/latex-formulae";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."temporary" or (buildDepError "temporary"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."base64-bytestring" or (buildDepError "base64-bytestring"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."cryptohash-sha256" or (buildDepError "cryptohash-sha256"))
          ];
        buildable = true;
        };
      };
    }