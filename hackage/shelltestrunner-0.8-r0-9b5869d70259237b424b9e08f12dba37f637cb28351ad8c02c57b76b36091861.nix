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
      identifier = { name = "shelltestrunner"; version = "0.8"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Simon Michael <simon@joyful.com>";
      author = "Simon Michael <simon@joyful.com>";
      homepage = "http://joyful.com/darcsweb/darcsweb.cgi?r=shelltestrunner";
      url = "";
      synopsis = "A tool for testing command-line programs.";
      description = "\nRun a command-line program through \\\"shell tests\\\" defined in one or\nmore test files. Each test specifies command-line arguments, some input,\nand expected output, stderr output and/or exit status.\nWe use test-framework's test runner, so can run tests in parallel.\nshelltestrunner was inspired by the tests in John Wiegley's ledger project.\n\nUsage:\n\n> shelltest [FLAG] [TESTFILES|TESTDIRS]\n>\n>\n>   -? --help[=FORMAT]           Show usage information (optional format)\n>   -V --version                 Show version information\n>   -v --verbose                 Higher verbosity\n>   -q --quiet                   Lower verbosity\n>   -d --debug                   show debug messages\n>      --debug-parse             show parsing debug messages and stop\n>      --execdir                 run tests in same directory as test file\n>      --extension=EXT           extension of test files when dirs specified (default=.test)\n>   -i --implicit=none|exit|all  provide implicit tests (default=exit)\n>   -w --with=EXECUTABLE         alternate executable, replaces the first word of test commands\n>      =OTHER FLAGS              any other flags are passed to test runner\n>\n> A test file contains one or more shell tests, which look like this:\n>\n>  # optional comment lines\n>  a one-line shell command to be tested\n>  <<<\n>  stdin lines\n>  >>> [/regexp to match in stdout/]\n>  [or expected stdout lines\n>  >>>2 [/regexp to match in stderr/]\n>  [or expected stderr lines]\n>  >>>= expected exit status or /regexp/\n>\n> The command line is required; all other fields are optional.\n> The expected stdout (>>>) and expected stderr (>>>2) fields can have either\n> a regular expression match pattern, in which case the test passes if the\n> output is matched, or 0 or more data lines, in which case the output\n> must match these exactly. The expected exit status (>>>=) field can have\n> either a numeric exit code or a /regexp/. A ! preceding a /regexp/ or exit\n> code negates the match. The regular expression syntax is that of the\n> pcre-light library with the dotall flag.\n>\n> By default there is an implicit test for exit status=0, but no implicit test\n> for stdout or stderr.  You can change this with -i/--implicit-tests.\n>\n> The command runs in your current directory unless you use --execdir.\n> You can use --with/-w to replace the first word of command lines\n> (everything up to the first space) with something else, eg to test a\n> different version of your program. To prevent this, start the command line\n> with a space.\n>\n> Any unrecognised options will be passed through to test-framework's runner.\n> You may be able to get a big speedup by running tests in parallel: try -j8.\n";
      buildType = "Simple";
      };
    components = {
      exes = {
        "shelltest" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."test-framework" or (buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (buildDepError "test-framework-hunit"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."pcre-light" or (buildDepError "pcre-light"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."FileManipCompat" or (buildDepError "FileManipCompat"))
            ];
          buildable = true;
          };
        };
      };
    }