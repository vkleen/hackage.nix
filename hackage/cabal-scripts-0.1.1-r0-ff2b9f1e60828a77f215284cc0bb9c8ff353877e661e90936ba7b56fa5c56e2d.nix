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
      identifier = { name = "cabal-scripts"; version = "0.1.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "darcs@henning-thielemann.de";
      author = "Henning Thielemann <darcs@henning-thielemann.de>";
      homepage = "";
      url = "";
      synopsis = "Shell scripts for support of Cabal maintenance";
      description = "This is a collection of Bash shell scripts\nfor support of Cabal package development.\nThe scripts are installed in your @cabal/share@ directory,\nthus you may extend your command search path accordingly.\n\nIf you are in the directory of @mypkg@\n(the directory that contains @mypkg.cabal@),\nthen you may run scripts in the following way:\n\n* @cabal-test dist/mypkg-0.1.tar.gz@:\nUnpack the tarball in the @/tmp@ directory\nand try to build it using Cabal.\nThis check helps to find missing files in the Cabal package description.\n\n* @cabal-darcs-bump-version 0.2@:\nReplaces the package and the repository version number\nin your Cabal file by 0.2\nand records an according Darcs patch.\n\n* @cabal-darcs-upload 0.2@:\nThis command supports the following workflow:\nSay, on Hackage there is version 0.0.1 of your package\nand the cabal file in the darcs repository says @Version: 0.1@.\nNow you decide to finish that version\nand to work next on the version 0.2.\nThis is the time when you call @cabal-darcs-upload 0.2@.\nThe call runs @cabal-test@ and @cabal check@ before uploading.\nThen it tags the repository with the current package version number.\nThen it uploads the package to Hackage.\nFinally it bumps the version of the package to @0.2@.\nThis workflow makes sure,\nthat you never have two different contents for the same version\nin Hackage and in your darcs repository.\nIf you set the environment variable HACKAGEUSER,\nthen this will be automatically used for upload.\n\n* @cabal-darcs-repository@:\nShows some lines of @Source-Repository@ fields,\nthat you may copy into @mypkg.cabal@.\nWe fetch the repository URL from Darcs files.\nUnfortunately, as developer\nyou will certainly use a private read-write access\nto your repository like @code.haskell.org:\\/home\\/user\\/mypkg\\/@,\nwhereas the Cabal field may contain a public read-only access,\nsuch as @http:\\/\\/code.haskell.org\\/~user\\/mypkg\\/@.\n\n* @cabal-main-directory@\nIf started in a source sub-directory\nthen it prints the closest super-directory containing a cabal file.\nThis way a build script can automatically find the directory\nwhere to run @cabal build@.\n\n* @cabal-find-revdeps author package@:\nFind all Cabal files of packages of a certain author\nthat import a certain package.\nThis is intended for updating a bunch of packages,\nwhen a new version of a basic packages shall be supported.\nIn this use case, @author@ should be your name\nand @package@ should be the basic package to adapt to.\nActually the script is very silly\nand just scans for the author name and the package name\nand does not check, where in the Cabal file they occur.\nThus be prepared for false positives search results.\nThe script also filters out package paths that contain underscores\nin order to hide paths in @_darcs@ directories\nand branched darcs repositories\nthat usually have names like @pkg_0@.\nI advise to process the packages with\n@\nfor pkg in \\`cabal-find-revdeps author package\\` ; do\n(cd \\`dirname \$pkg\\`; bash);\ndone\n@.\nThis @for@ loop will take you successively into every package directory.\nThere you can perform some operations\nand you can browse the shell history for the commands\nyou performed for the previous packages.\nIf you are finished with a package, then you just call @exit@,\nand the @for@ loop automatically puts you in the next package directory.\nSee also package @cabal-sort@ that provides\nthe commands @cabal-sort@ and @ghc-pkg-dep@.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (buildDepError "base")) ];
        buildable = true;
        };
      };
    }