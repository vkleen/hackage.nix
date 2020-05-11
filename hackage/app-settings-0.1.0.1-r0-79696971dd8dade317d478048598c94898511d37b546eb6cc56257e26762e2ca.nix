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
      identifier = { name = "app-settings"; version = "0.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "etouzery@gmail.com";
      author = "Emmanuel Touzery";
      homepage = "https://github.com/emmanueltouzery/app-settings";
      url = "";
      synopsis = "A library to manage application settings (INI file-like)";
      description = "A library to deal with application settings.\nThis library deals with read-write application settings.\nYou will have to specify the settings that your application\nuses, their name, types and default values.\nSetting types must implement the 'Read' and 'Show' typeclasses.\nThe settings are saved in a file in an INI-like key-value format\n(without sections).\nReading and updating settings is done in pure code, the IO\nmonad is only used to load settings and save them to disk.\nIt is advised for the user to create a module in your project\nholding settings handling.\nYou can then declare settings:\n> fontSize :: Setting Double\n> fontSize = Setting \"fontSize\" 14\n>\n> dateFormat :: Setting String\n> dateFormat = Setting \"dateFormat\" \"%x\"\n>\n> backgroundColor :: Setting (Int, Int, Int)\n> backgroundColor = Setting \"backcolor\" (255, 0, 0)\nOptionally you can declare the list of all your settings:\n> defaultConfig :: DefaultConfig\n> defaultConfig = getDefaultConfig \$ do\n>     setting fontSize\n>     setting dateFormat\n>     setting backgroundColor\nIf you do it, 'saveSettings' will also save settings\nwhich have not been modified, which are still at their\ndefault value in the configuration file, in a commented\nform, as a documentation to the user who may open the\nconfiguration file.\nSo for instance if you declare this default configuration\nand have set the font size to 16 but left the other\nsettings untouched, the configuration file which will be\nsaved will be:\n> fontSize=16\n> # dateFormat=\"%x\"\n> # backcolor=(255,0,0)\nIf you did not specify the list of settings, only the\nfirst line would be present in the configuration file.\nOnce we declared the settings, we can read the configuration\nfrom disk (and your settings module should export your wrapper\naround the function offered by this library):\n> readResult <- try \$ readSettings (AutoFromAppName \"test\")\n> case readResult of\n> \tRight (conf, GetSetting getSetting) -> do\n> \t\tlet textSize = getSetting textSizeFromWidth\n> \t\tsaveSettings getDefaultConfig (AutoFromAppName \"test\") conf\n> \tLeft (x :: SomeException) -> error \"Error reading the config file!\"\n'AutoFromAppName' specifies where to save the configuration file.\nAnd we've already covered the getSetting in this snippet, see\nthe 'readSettings' documentation for further information.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            ];
          buildable = true;
          };
        };
      };
    }