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
      identifier = { name = "wedged"; version = "0"; };
      license = "LicenseRef-OtherLicense";
      copyright = "(C) 2013,2015 Claude Heiland-Allen";
      maintainer = "claude@mathr.co.uk";
      author = "Claude Heiland-Allen";
      homepage = "";
      url = "";
      synopsis = "Wedged postcard generator.";
      description = "Wedged (C) 2013,2015 Claude Heiland-Allen.\n\nCopyleft: This is a free work, you can copy, distribute, and\nmodify it under the terms of the Free Art License\n<http://artlibre.org/licence/lal/en/>.\n\nInstall:\n\n> cabal sandbox init\n> cabal install alex\n> cabal install happy\n> cabal install gtk2hs-buildtools\n> cabal install wedged\n\nRun:\n\n> .cabal-sandbox/bin/wedged\n\nOutput:\n\n189 PNG files in the current working directory, totalling 38 MB.\nRun time is about 10mins (single core of a 3GHz AMD Athlon(tm) II\nX4 640 Processor).\n\nInformation:\n\nA blog post about this version can be found at\n<http://mathr.co.uk/blog/2015-01-16_calendar_2015_wedged.html>.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "wedged" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."MonadRandom" or (buildDepError "MonadRandom"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."strict" or (buildDepError "strict"))
            (hsPkgs."colour" or (buildDepError "colour"))
            (hsPkgs."diagrams-lib" or (buildDepError "diagrams-lib"))
            (hsPkgs."diagrams-cairo" or (buildDepError "diagrams-cairo"))
            ];
          buildable = true;
          };
        };
      };
    }