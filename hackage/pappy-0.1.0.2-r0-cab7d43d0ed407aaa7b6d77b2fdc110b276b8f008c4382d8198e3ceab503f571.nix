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
      identifier = { name = "pappy"; version = "0.1.0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Chris Done <chrisdone@gmail.com>";
      author = "Bryan Ford";
      homepage = "http://pdos.csail.mit.edu/~baford/packrat/thesis/";
      url = "";
      synopsis = "Packrat parsing; linear-time parsers for grammars in TDPL.";
      description = "Packrat parsing is a novel and practical\nmethod for implementing linear-time parsers\nfor grammars defined in Top-Down Parsing\nLanguage (TDPL). While TDPL was originally\ncreated as a formal model for top-down\nparsers with backtracking capability, this\nthesis extends TDPL into a powerful\ngeneral-purpose notation for describing\nlanguage syntax, providing a compelling\nalternative to traditional context-free\ngrammars (CFGs). Common syntactic idioms\nthat cannot be represented concisely in a\nCFG are easily expressed in TDPL, such as\nlongest-match disambiguation and \"syntactic\npredicates,\" making it possible to describe\nthe complete lexical and grammatical syntax\nof a practical programming language in a\nsingle TDPL grammar.\nPackrat parsing is an adaptation of a\n30-year-old tabular parsing algorithm that\nwas never put into practice until now. A\npackrat parser can recognize any string\ndefined by a TDPL grammar in linear time,\nproviding the power and flexibility of a\nbacktracking recursive descent parser\nwithout the attendant risk of exponential\nparse time. A packrat parser can recognize\nany LL(k) or LR(k) language, as well as many\nlanguages requiring unlimited lookahead that\ncannot be parsed by shift/reduce\nparsers. Packrat parsing also provides\nbetter composition properties than LL/LR\nparsing, making it more suitable for dynamic\nor extensible languages. The primary\ndisadvantage of packrat parsing is its\nstorage cost, which is a constant multiple\nof the total input size rather than being\nproportional to the nesting depth of the\nsyntactic constructs appearing in the input.\nMonadic combinators and lazy evaluation\nenable elegant and direct implementations of\npackrat parsers in recent functional\nprogramming languages such as Haskell. Three\ndifferent packrat parsers for the Java\nlanguage are presented here, demonstrating\nthe construction of packrat parsers in\nHaskell using primitive pattern matching,\nusing monadic combinators, and by automatic\ngeneration from a declarative parser\nspecification. The prototype packrat parser\ngenerator developed for the third case\nitself uses a packrat parser to read its\nparser specifications, and supports full\nTDPL notation extended with \"semantic\npredicates,\" allowing parsing decisions to\ndepend on the semantic values of other\nsyntactic entities. Experimental results\nshow that all of these packrat parsers run\nreliably in linear time, efficiently support\n\"scannerless\" parsing with integrated\nlexical analysis, and provide the\nuser-friendly error-handling facilities\nnecessary in practical applications.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "pappy" = {
          depends = [ (hsPkgs."base" or (buildDepError "base")) ];
          buildable = true;
          };
        };
      };
    }