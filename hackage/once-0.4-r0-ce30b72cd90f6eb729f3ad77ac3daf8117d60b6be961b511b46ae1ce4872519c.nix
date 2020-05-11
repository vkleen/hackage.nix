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
      specVersion = "1.12";
      identifier = { name = "once"; version = "0.4"; };
      license = "GPL-3.0-only";
      copyright = "2015-2018 Dmitry Bogatov";
      maintainer = "KAction@debian.org";
      author = "Dmitry Bogatov";
      homepage = "https://gitlab.com/kaction/haskell-once";
      url = "";
      synopsis = "memoization for IO actions and functions";
      description = "Package provides single polymorphic function 'once', that allows you\nto memoize IO actions and functions, evaluating them at most once.\n\n>>> let mkStamp = (putStrLn \"stamping\" >> writeFile \"/tmp/stamp\" \"\") :: IO ()\n>>> -- onceStamp :: IO ()\n>>> onceStamp <- once mkStamp\n>>> -- onceStamp actually evaluates mkStamp it wraps first time.\n>>> onceStamp\nstamping\n>>> -- but second time result `()' is memoized, no action is performed.\n>>> onceStamp\n>>> -- we can memoize functions too\n>>> foo <- once \$ \\x -> print \"foo\" >> print (x :: Int)\n>>> -- action will be performed once for every distinct argument\n>>> foo 10\nfoo\n10\n>>> foo 10\n10\n>>> foo 4\nfoo\n4";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          ];
        buildable = true;
        };
      tests = {
        "spec" = {
          depends = [
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."async" or (buildDepError "async"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."once" or (buildDepError "once"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.hspec-discover or (pkgs.buildPackages.hspec-discover or (buildToolDepError "hspec-discover")))
            ];
          buildable = true;
          };
        };
      };
    }