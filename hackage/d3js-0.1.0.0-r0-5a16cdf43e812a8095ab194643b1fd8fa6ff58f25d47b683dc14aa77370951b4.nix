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
      identifier = { name = "d3js"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "nebuta.office@gmail.com";
      author = "Nebuta";
      homepage = "https://github.com/nebuta/d3js-haskell";
      url = "";
      synopsis = "Declarative visualization on a web browser with DSL approach.";
      description = "A library for visualization on a web browser. This works as a DSL that generates JavaScript source code working with D3.js (http://d3js.org/) library.\n\nYou can compose operations with a typed DSL with Haskell's abstraction power.\n\nThis is still an alpha version, and the structure may be changed in the near future.\n\n* A simplest example: drawing a bar chart\n\n> import Control.Monad\n> import qualified Data.Text as T\n> import D3JS\n>\n> test :: Int -> IO ()\n> test n = T.writeFile \"generated.js\" \$ reify (box \"#div1\" (300,300) >>= bars n 300 (Data1D [100,20,80,60,120]))\n\nYou can just put the JavaScript file in an HTML file like the following to show a chart.\n\n> <html>\n> <head>\n>   <title>Chart</title>\n> </head>\n> <body>\n>   <div id='div1'></div>\n>   <script charset='utf-8' src='http://d3js.org/d3.v3.min.js'></script>\n>   <script charset='utf-8' src='generated.js'></script>\n> </body>\n> </html>\n\nSee \"D3JS.Example\" for more examples.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."random" or (buildDepError "random"))
          ];
        buildable = true;
        };
      };
    }