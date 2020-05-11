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
      identifier = { name = "hgrev"; version = "0.2.4"; };
      license = "BSD-3-Clause";
      copyright = "Bitnomial, Inc. (c) 2016";
      maintainer = "luke@bitnomial.com";
      author = "Luke Hoersten";
      homepage = "https://github.com/bitnomial/hgrev";
      url = "";
      synopsis = "Compile Mercurial (hg) version info into Haskell code";
      description = "[Overview]\n\n`hgrev` provides two modules:\n\n* `Development.HgRev` - <https://mercurial.selenic.com Mercurial (hg)> Haskell API\n\n* `Development.HgRev.TH` - Template Haskell splice to compile version info into Haskell code\n\nUse @\$(hgRevStateTH defFormat)@ with Template Haskell enabled to insert the\nformatted version string.\n\n[Requirements]\n\n`hgrev` requires the `hg` binary version 3.2 or greater is installed and available on the system.\n`Development.HgRev.HgRev` and `Development.HgRev.HgState` are obtained via two\nseparate calls to `hg` because working directory state isn't available programmatically.\n\n[Usage Example]\n\n> module Example where\n>\n> import           Data.Monoid          ((<>))\n> import           Data.Text            (Text, pack)\n> import           Development.HgRev.TH (defFormat, hgRevStateTH, jsonFormat)\n> import           Options.Applicative  (Parser, ParserInfo, execParser, fullDesc,\n>                                        help, helper, info, infoOption, long,\n>                                        progDesc, short)\n>\n> main :: IO ()\n> main = execParser parserInfo >> return ()\n>\n> verSwitch :: Parser (a -> a)\n> verSwitch =\n>     infoOption (\"HG rev: \" <> \$(hgRevStateTH defFormat))\n>     \$  long \"version\"\n>     <> short 'v'\n>     <> help \"Display version information\"\n>\n> jsonSwitch :: Parser (a -> a)\n> jsonSwitch =\n>     infoOption \$(hgRevStateTH jsonFormat)\n>     \$  long \"json\"\n>     <> short 'J'\n>     <> help \"Display JSON version information\"\n>\n> parserInfo :: ParserInfo (a -> a)\n> parserInfo = info (helper <*> verSwitch <* jsonSwitch) fullDesc\n>\n\nCheck out the <https://hackage.haskell.org/package/gitrev gitrev> package for similar git functionality.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          ];
        buildable = true;
        };
      };
    }