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
      identifier = { name = "laborantin-hs"; version = "0.1.2.0"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "lucas@dicioccio.fr";
      author = "lucas dicioccio";
      homepage = "https://github.com/lucasdicioccio/laborantin-hs";
      url = "";
      synopsis = "an experiment management framework";
      description = "Laborantin is a framework and DSL to run and manage results from scientific\nexperiments. Good targets for Laborantin are experiments that you can\nrun /offline/ such as benchmark and batch analytics.\n\nWriting experiments with Laborantin has at least two advantages over\nrolling your own scripts.  First, Laborantain standardizes the workflow of your\nexperimentations.  There is one-way to describe what a project can do, what\nexperiments where already run, how to delete files corresponding to a specific\nexperiment etc.  Second, Laborantin builds on years of experience running\nexperiments. Using Laborantin    should alleviates common pain points such as\nquerying for experiments, managing dependencies between results\n\nLaborantin's DSL lets you express experiment parameters,\nsetup, teardown, and recovery hooks in a systematic way.\nIn addition, this DSL let you express dependencies on your\nexperiments so that you can run prior experiments or data analyses.\n\nLaborantin comes with a default backend that stores\nexperiment results in a filesystem-hierarchy. Laborantin\nalso comes with a default command-line that let you\nspecify which experiments to run, analyze, or delete.\n\n> ping :: ScenarioDescription EnvIO\n> ping = scenario \"ping\" \$ do\n>   describe \"ping to a remote server\"\n>   parameter \"destination\" \$ do\n>     describe \"a destination server (host or ip)\"\n>     values [str \"example.com\", str \"probecraft.net\"]\n>   parameter \"packet-size\" \$ do\n>     describe \"packet size in bytes\"\n>     values [num 50, num 1500]\n>   run \$ do\n>     (StringParam srv) <- param \"destination\"\n>     (StringParam ps) <- param \"packet-size\"\n>     liftIO (executePingCommand srv ps) >>= writeResult \"raw-result\"\n>     where executePingCommand :: Text -> Rational -> IO (Text)\n>           executePingCommand host packetSize = ...\n>\n> main :: IO ()\n> main = defaultMain [ping]";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."uuid" or (buildDepError "uuid"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."hslogger" or (buildDepError "hslogger"))
          (hsPkgs."cmdlib" or (buildDepError "cmdlib"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          ];
        buildable = true;
        };
      exes = {
        "labor-example" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."uuid" or (buildDepError "uuid"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."hslogger" or (buildDepError "hslogger"))
            (hsPkgs."cmdlib" or (buildDepError "cmdlib"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."laborantin-hs" or (buildDepError "laborantin-hs"))
            ];
          buildable = true;
          };
        };
      };
    }