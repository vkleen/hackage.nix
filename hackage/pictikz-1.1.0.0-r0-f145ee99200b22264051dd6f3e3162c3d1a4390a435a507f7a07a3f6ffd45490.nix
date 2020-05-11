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
      identifier = { name = "pictikz"; version = "1.1.0.0"; };
      license = "GPL-3.0-only";
      copyright = "";
      maintainer = "marcelogmillani@gmail.com";
      author = "Marcelo Garlet Millani";
      homepage = "";
      url = "";
      synopsis = "Converts a svg image to tikz code.";
      description = "Tikz is often used to draw graphs (i.e., networks) in LaTeX. Even though the resulting image can be very clean, manually writing tikz code can be time consuming, especially when the picture needs to be modified afterwards.\nOn the other side of the spectrum, drawing with graphical tools like inkscape is easy, but getting a clean looking result can be complicated.\nWith pictikz you get the best of both worlds: You draw using a graphical tool and pictikz converts the resulting SVG file to tikz code, making some automatic style adjustments if you desire.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "pictikz" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."xml" or (buildDepError "xml"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."matrix" or (buildDepError "matrix"))
            ];
          buildable = true;
          };
        };
      };
    }