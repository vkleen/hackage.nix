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
    flags = { warn = false; };
    package = {
      specVersion = "1.8";
      identifier = { name = "cctools-workqueue"; version = "3.6.1.0.1.0.0"; };
      license = "GPL-2.0-only";
      copyright = "";
      maintainer = "abdulwahidc@gmail.com";
      author = "Badi' Abdul-Wahid";
      homepage = "http://bitbucket.org/badi/hs-cctools-workqueue";
      url = "";
      synopsis = "High-level interface to CCTools' WorkQueue library";
      description = "This package provides a high-level Haskell interface to the WorkQueue library:\n<http://www.nd.edu/~ccl/software/workqueue/>\n\n\nWork Queue is a framework for building large\nmaster-worker applications that span many\ncomputers including clusters, clouds, and\ngrids. Work Queue applications are written in C,\nPerl, or Python using a simple API that allows\nusers to define tasks, submit them to the queue,\nand wait for completion. Tasks are executed by a\nstandard worker process that can run on any\navailable machine. Each worker calls home to the\nmaster process, arranges for data transfer, and\nexecutes the tasks. Together, the master and\nworker handle a wide variety of failures,\nallowing for dynamically scalable and robust\napplications.\n\n<<http://www.nd.edu/~ccl/software/workqueue/wq-small.gif>>\n\n\nExample usage:\n\nBy default the master listens on 9123 on the localhost host.\nStart a worker:\n\n> \$ work_queue_worker -d all localhost 9123\n\nNow we can execute the following master program:\n\n> module Main where\n>\n> import Control.Distributed.CCTools.WorkQueue\n>\n> import Control.Applicative ((<\$>))\n> import qualified Data.ByteString.Char8 as BS (pack, putStrLn)\n> import Foreign.C.String (newCStringLen)\n> import Control.Monad (forM_)\n>\n>\n>\n> mktask :: Show a => a -> IO Task\n> mktask v = do\n>   let script = BS.pack . unlines \$ [\n>               \"t=\$(echo \$RANDOM % 10 | bc)\"\n>             , \"sleep \$t\"\n>             , \"echo \" ++ show v\n>             ]\n>   t <- task \$ cmd \"bash script.sh\"\n>   specifyBuffer t script (remote \"script.sh\") False\n>   specifyTag    t \$ show v\n>   return t\n>\n> printStats :: WorkQueue -> IO ()\n> printStats q = do\n>   s <- getStats q\n>   print \$ map (\$ s) [tasksRunning, tasksWaiting, tasksComplete]\n>\n> processResult :: WorkQueue -> Task -> IO ()\n> processResult q r = do\n>   putStrLn \$ \"Got: \" ++ show (tag r)\n>   BS.putStrLn . output \$ r\n>   delete r\n>\n> main = do\n>   setDebugFlags [All]\n>   q  <- workqueue defaultQParams\n>   ts <- mapM mktask [1..10]\n>   forM_ ts (submit q)\n>\n>   eventLoop q (seconds 1) printStats processResult\n>\n>   putStrLn \"Done!\"";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."bindings-cctools" or (buildDepError "bindings-cctools"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."monad-loops" or (buildDepError "monad-loops"))
          ] ++ (pkgs.lib).optional (compiler.isGhc && false) (hsPkgs."base" or (buildDepError "base"))) ++ (pkgs.lib).optional (compiler.isGhc && false) (hsPkgs."base" or (buildDepError "base"));
        libs = [ (pkgs."dttools" or (sysDepError "dttools")) ];
        buildable = true;
        };
      };
    }