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
    flags = { cairo = false; svg = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "diagrams-builder"; version = "0.2.1.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "diagrams-discuss@googlegroups.com";
      author = "Brent Yorgey";
      homepage = "http://projects.haskell.org/diagrams";
      url = "";
      synopsis = "hint-based build service for the diagrams graphics EDSL.";
      description = "@diagrams-builder@ provides backend-agnostic tools for\ndynamically turning code into rendered diagrams,\nusing the @hint@ wrapper to the GHC API.  It\nsupports conditional recompilation using hashing\nof diagrams source code, to avoid recompiling\ncode that has not changed.  It is useful for\ncreating tools which compile diagrams code\nembedded in other documents.  For example, it is\nused by the @BlogLiterately-diagrams@ package (a\nplugin for @BlogLiterately@) to compile diagrams\nembedded in Markdown-formatted blog posts.\n\nExecutables specific to the cairo and SVG\nbackends are included (more executables specific\nto other backends may be included in the future).\nBoth take an input file and an expression to\nrender, and outputs an image file.  If you want\nthese executables you must explicitly enable the\n@-fcairo@ and/or @-fsvg@ flags.\n\nA LaTeX package, @diagrams-latex.sty@, is also\nprovided in the @latex/@ directory of the source\ndistribution, which renders diagrams code found\nwithin @diagram@ environments.  It makes use of\nthe @diagrams-builder-cairo@ executable, so if\nyou want to use @diagrams-latex.sty@ you should\ninstall @diagrams-builder@ with the @-fcairo@\noption.  Note that @diagrams-latex.sty@ is\nlicensed under the GPL.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."diagrams-lib" or (buildDepError "diagrams-lib"))
          (hsPkgs."hint" or (buildDepError "hint"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."haskell-src-exts" or (buildDepError "haskell-src-exts"))
          (hsPkgs."cryptohash" or (buildDepError "cryptohash"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."base16-bytestring" or (buildDepError "base16-bytestring"))
          (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
          ];
        buildable = true;
        };
      exes = {
        "diagrams-builder-cairo" = {
          depends = (pkgs.lib).optionals (flags.cairo) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."diagrams-builder" or (buildDepError "diagrams-builder"))
            (hsPkgs."diagrams-lib" or (buildDepError "diagrams-lib"))
            (hsPkgs."diagrams-cairo" or (buildDepError "diagrams-cairo"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            ];
          buildable = if !flags.cairo then false else true;
          };
        "diagrams-builder-svg" = {
          depends = (pkgs.lib).optionals (flags.svg) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."diagrams-builder" or (buildDepError "diagrams-builder"))
            (hsPkgs."diagrams-lib" or (buildDepError "diagrams-lib"))
            (hsPkgs."diagrams-svg" or (buildDepError "diagrams-svg"))
            (hsPkgs."blaze-svg" or (buildDepError "blaze-svg"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            ];
          buildable = if !flags.svg then false else true;
          };
        };
      };
    }