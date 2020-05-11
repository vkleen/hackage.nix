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
      identifier = { name = "prometheus"; version = "0.4.0"; };
      license = "BSD-3-Clause";
      copyright = "Bitnomial, Inc. (c) 2016";
      maintainer = "luke@hoersten.org, opensource@bitnomial.com";
      author = "Luke Hoersten";
      homepage = "http://github.com/LukeHoersten/prometheus#readme";
      url = "";
      synopsis = "Prometheus Haskell Client";
      description = "[Prometheus Haskell Client]\n\nA simple and modern, type safe, idiomatic Haskell client for\n<http://prometheus.io Prometheus> monitoring. Specifically there is no\nuse of unsafe IO or manual ByteString construction from lists of\nbytes. Batteries-included web server.\n\n[Usage Example]\n\n> module Example where\n>\n> import           Control.Monad.IO.Class                         (liftIO)\n> import           System.Metrics.Prometheus.Concurrent.Http      (serveHttpTextMetricsT)\n> import           System.Metrics.Prometheus.Concurrent.RegistryT\n> import           System.Metrics.Prometheus.Metric.Counter       (inc)\n> import           System.Metrics.Prometheus.MetricId\n>\n> main :: IO ()\n> main = runRegistryT \$ do\n>     -- Labels can be defined as lists or added to an empty label set\n>     connectSuccessGauge <- registerGauge \"example_connections\" (fromList [(\"login\", \"success\")])\n>     connectFailureGauge <- registerGauge \"example_connections\" (addLabel \"login\" \"failure\" mempty)\n>     connectCounter <- registerCounter \"example_connection_total\" mempty\n>     latencyHistogram <- registerHistogram \"example_round_trip_latency_ms\" mempty [10, 20..100]\n>\n>     liftIO \$ inc connectCounter -- increment a counter\n>\n>     -- [...] pass metric handles to the rest of the app\n>\n>     serveHttpTextMetricsT 8080 [\"metrics\"] -- http://localhost:8080/metric server\n>\n\n[Advanced Usage]\n\nA `Registry` and `StateT`-based `RegistryT` are available for unit testing or generating lists\nof `[IO a]` actions that can be `sequenced` and returned from pure code to be applied.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."atomic-primops" or (buildDepError "atomic-primops"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."http-types" or (buildDepError "http-types"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."warp" or (buildDepError "warp"))
          ];
        buildable = true;
        };
      };
    }