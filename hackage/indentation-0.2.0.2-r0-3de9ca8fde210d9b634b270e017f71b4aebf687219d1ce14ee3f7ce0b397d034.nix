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
    flags = { parsec = true; trifecta = true; };
    package = {
      specVersion = "1.10";
      identifier = { name = "indentation"; version = "0.2.0.2"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Ömer Sinan Ağacan <omeragacan@gmail.com>\nAleksey Kliger <aleksey@lambdageek.org>";
      author = "Michael D. Adams <http://michaeldadams.org/>";
      homepage = "https://bitbucket.org/mdmkolbe/indentation";
      url = "";
      synopsis = "Indentation sensitive parsing combinators for Parsec and Trifecta";
      description = "Indentation sensitive parsing combinators for Parsec and Trifecta.\n\nSee\n\n__Michael D. Adams and Ömer S. Ağacan__.\nIndentation-sensitive parsing for Parsec.\nIn /Proceedings of the 2014 ACM SIGPLAN Symposium on Haskell/,\nHaskell ’14, pages 121–132.\nACM, New York, NY, USA, September 2014. ISBN 978-1-4503-3041-1.\n<http://dx.doi.org/10.1145/2633357.2633369 doi:10.1145/2633357.2633369>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          ] ++ (pkgs.lib).optional (flags.parsec) (hsPkgs."parsec" or (buildDepError "parsec"))) ++ (pkgs.lib).optionals (flags.trifecta) [
          (hsPkgs."trifecta" or (buildDepError "trifecta"))
          (hsPkgs."parsers" or (buildDepError "parsers"))
          ];
        buildable = true;
        };
      };
    }