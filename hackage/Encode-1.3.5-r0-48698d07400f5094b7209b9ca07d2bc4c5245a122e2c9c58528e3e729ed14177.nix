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
      specVersion = "0";
      identifier = { name = "Encode"; version = "1.3.5"; };
      license = "LicenseRef-GPL";
      copyright = "2011";
      maintainer = "otakar.smrz mff.cuni.cz";
      author = "Otakar Smrz";
      homepage = "http://ufal.mff.cuni.cz/~smrz/";
      url = "http://sourceforge.net/projects/encode-arabic/";
      synopsis = "Encoding character data";
      description = "The \"Encode\" library provides a unified interface for converting strings\nfrom different encodings into a common representation, and vice versa.\nThis representation is isomorphic to the Unicode character set, and the\nencodings can be both standard and user-defined. For this purpose, the\n\"Encode\" module defines the 'Encode.UPoint' data type and the\n'Encode.Encoding' type class with the 'encode' and 'decode' methods.\n\nThe \"Encode\" library is being proposed as a Haskell analogy to the\n/Encode/ extension in Perl, <http://search.cpan.org/dist/Encode/>.\n\nThe \"Exec.Encode.Main\" and \"Exec.Decode.Main\" programs mimick the\nfunction calls to 'encode' and 'decode', respectively, with the\nfollowing usage of the executables:\n\n>    decode ArabTeX < decode.d | encode Buckwalter > encode.d\n>\n>    decode MacArabic < data.MacArabic > data.UTF8\n>\n>    encode WinArabic < data.UTF8 > data.WinArabic\n\nThe installation instructions are given in \"INSTALL\".\nFor the list of supported encoding schemes, please refer\nto \"Encode\" and the source files of the programs. With the\nexecutables, the naming of encodings is /case-insensitive/\nand some further options are allowed:\n\n>  encode|decode [--OPTIONS] [ENCODING]\n>    -h       --help         show usage information\n>    -l       --lines        use line-oriented mode\n>    -p text  --prefix=text  prefix input with text\n>    -s text  --suffix=text  suffix input with text\n>    -v       --version      show program's version\n\nThe \"PureFP\" library is an edited excerpt from the /Functional Parsing/\nlibrary developed by Peter Ljungl&#246;f in his licenciate thesis\n/Pure Functional Parsing &#150; an advanced tutorial/, G&#246;teborg\nUniversity and Chalmers University of Technology, April 2002,\n<http://www.ling.gu.se/~peb/software.html>.\n\nThe \"Parsek\" library is included for experimental purposes and subsumes\n\"PureFP.Parsers.Stream\". /Parsek/ was developed by Koen Claessen in his\nfunctional pearl article /Parallel Parsing Processes/, Journal of\nFunctional Programming, 14(6), 741&#150;757, Cambridge University Press,\n2004, <http://www.cs.chalmers.se/~koen/pubs/entry-jfp04-parser.html>.\n\n\"Encode\" \"PureFP\" \"Parsek\"";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."Cabal" or (buildDepError "Cabal"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."containers" or (buildDepError "containers"))
          ];
        buildable = true;
        };
      exes = {
        "encode" = {
          depends = [
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."containers" or (buildDepError "containers"))
            ];
          buildable = true;
          };
        "decode" = {
          depends = [
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."containers" or (buildDepError "containers"))
            ];
          buildable = true;
          };
        };
      };
    }