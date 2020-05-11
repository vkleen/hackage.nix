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
      specVersion = "1.6";
      identifier = { name = "hsenv"; version = "0.3"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2011 Bartosz Ćwikłowski";
      maintainer = "Taylor Hedberg <t@tmh.cc>";
      author = "Bartosz Ćwikłowski";
      homepage = "https://github.com/tmhedberg/hsenv";
      url = "http://hackage.haskell.org/package/hsenv";
      synopsis = "Virtual Haskell Environment builder";
      description = "hsenv is a tool (inspired by Python's virtualenv) to create isolated Haskell environments.\n\nIt creates a sandboxed environment in a .hsenv_<ENVIRONMENT_NAME>/ directory, which, when activated,\nallows you to use regular Haskell tools (ghc, ghci, ghc-pkg, cabal) to manage your Haskell\ncode and environment. It's possible to create an environment, that uses a different GHC version\nthan your currently installed system GHC. hsenv is supposed to be easier to learn (and use) than\nsimilar packages (like cabal-dev or capri).\n\nBasic usage.\n\nFirst, choose a directory where you want to keep your sandboxed Haskell environment,\nusually a good choice is a directory containing your cabalized project (if you want to work\non a few projects (perhaps an app and its dependent library), just choose any of them,\nit doesn't really matter). Enter that directory:\n\n> cd ~/projects/foo\n\nNext, create your new isolated Haskell environment (this is a one time only (per environment) step):\n\n> hsenv\n\nNow, every time you want to use this enviroment, you have to activate it:\n\n> source .hsenv_foo/bin/activate\n\nThat's it! Now it's possible to use all regular Haskell tools like usual, but it won't affect\nyour global/system's Haskell environment, and also your per-user environment (from ~/.cabal and\n~/.ghc) will stay the same. All cabal-installed packages will be private to this environment,\nand also the external environments (global and user) will not affect it (this environment\nwill only inherit very basic packages - mostly ghc and Cabal and their deps).\n\nWhen you're done working with this environment, enter command 'deactivate_hsenv',\nor just close the current shell (with exit).\n\n> deactivate_hsenv\n\nAdvanced usage.\n\nThe only advanced usage is using different GHC version. This can be useful to test your code\nagainst different GHC version (even against nightly builds).\n\nFirst, download binary distribution of GHC for your platform\n(e.g. ghc-7.0.4-i386-unknown-linux.tar.bz2), then create a new environment using that GHC\n\n> hsenv --ghc=/path/to/ghc_something.tar.bz2\n\nThen, proceed (with [de]activation) as in basic case.\n\nMisc.\n\nhsenv has been tested on i386 Linux systems, but it should work on any Posix platform.\nExternal (from tarball) GHC feature requires binary GHC distribution compiled for your platform,\nthat can be extracted with tar and installed with \"./configure --prefix=PATH; make install\".\n\nFor more info please consult \"hsenv --help\" or the attached README file.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "hsenv" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."file-embed" or (buildDepError "file-embed"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."safe" or (buildDepError "safe"))
            (hsPkgs."unix" or (buildDepError "unix"))
            ];
          buildable = true;
          };
        };
      };
    }