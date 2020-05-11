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
    flags = {
      mpich-macports = false;
      mpich-ubuntu = false;
      openmpi-debian = true;
      openmpi-macports = true;
      openmpi-ubuntu = true;
      };
    package = {
      specVersion = "1.12";
      identifier = { name = "mpi-hs"; version = "0.5.3.0"; };
      license = "Apache-2.0";
      copyright = "";
      maintainer = "Erik Schnetter <schnetter@gmail.com>";
      author = "Erik Schnetter <schnetter@gmail.com>";
      homepage = "https://github.com/eschnett/mpi-hs#readme";
      url = "";
      synopsis = "MPI bindings for Haskell";
      description = "MPI (the [Message Passing Interface](https://www.mpi-forum.org)) is\nwidely used standard for distributed-memory programming on HPC (High\nPerformance Computing) systems. MPI allows exchanging data\n(_messages_) between programs running in parallel. There are several\nhigh-quality open source MPI implementations (e.g. MPICH, MVAPICH,\nOpenMPI) as well as a variety of closed-source implementations.\nThese libraries can typically make use of high-bandwidth low-latency\ncommunication hardware such as InfiniBand.\n\nThis library @mpi-hs@ provides Haskell bindings for MPI. It is based\non ideas taken from\n[haskell-mpi](https://github.com/bjpop/haskell-mpi),\n[Boost.MPI](https://www.boost.org/doc/libs/1_64_0/doc/html/mpi.html),\nand [MPI for Python](https://mpi4py.readthedocs.io/en/stable/).\n\n@mpi-hs@ provides two API levels: A low-level API gives rather\ndirect access to the MPI API, apart from certain \"reasonable\"\nmappings from C to Haskell (e.g. output arguments that are in C\nstored to a pointer are in Haskell regular return values). A\nhigh-level API simplifies exchanging arbitrary values that can be\nserialized.\n\nNote that the automated builds on\n[Hackage](http://hackage.haskell.org) will currently always fail\nsince no MPI library is present there. However, builds on\n[Stackage](https://www.stackage.org) should succeed -- if not, there\nis an error in this package.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."monad-loops" or (buildDepError "monad-loops"))
          (hsPkgs."store" or (buildDepError "store"))
          ];
        libs = ((((pkgs.lib).optional (flags.openmpi-debian) (pkgs."mpi" or (sysDepError "mpi")) ++ (pkgs.lib).optional (flags.openmpi-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-ubuntu) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-ubuntu) (pkgs."mpich" or (sysDepError "mpich"));
        build-tools = [
          (hsPkgs.buildPackages.c2hs or (pkgs.buildPackages.c2hs or (buildToolDepError "c2hs")))
          ];
        buildable = true;
        };
      exes = {
        "example" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."mpi-hs" or (buildDepError "mpi-hs"))
            ];
          libs = ((((pkgs.lib).optional (flags.openmpi-debian) (pkgs."mpi" or (sysDepError "mpi")) ++ (pkgs.lib).optional (flags.openmpi-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-ubuntu) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-ubuntu) (pkgs."mpich" or (sysDepError "mpich"));
          buildable = true;
          };
        };
      tests = {
        "mpi-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."monad-loops" or (buildDepError "monad-loops"))
            (hsPkgs."mpi-hs" or (buildDepError "mpi-hs"))
            ];
          libs = ((((pkgs.lib).optional (flags.openmpi-debian) (pkgs."mpi" or (sysDepError "mpi")) ++ (pkgs.lib).optional (flags.openmpi-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-ubuntu) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-ubuntu) (pkgs."mpich" or (sysDepError "mpich"));
          buildable = true;
          };
        "mpi-test-binary" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mpi-hs" or (buildDepError "mpi-hs"))
            ];
          libs = ((((pkgs.lib).optional (flags.openmpi-debian) (pkgs."mpi" or (sysDepError "mpi")) ++ (pkgs.lib).optional (flags.openmpi-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-ubuntu) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-ubuntu) (pkgs."mpich" or (sysDepError "mpich"));
          buildable = true;
          };
        "mpi-test-serialize" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mpi-hs" or (buildDepError "mpi-hs"))
            ];
          libs = ((((pkgs.lib).optional (flags.openmpi-debian) (pkgs."mpi" or (sysDepError "mpi")) ++ (pkgs.lib).optional (flags.openmpi-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-ubuntu) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-ubuntu) (pkgs."mpich" or (sysDepError "mpich"));
          buildable = true;
          };
        "mpi-test-storable" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mpi-hs" or (buildDepError "mpi-hs"))
            ];
          libs = ((((pkgs.lib).optional (flags.openmpi-debian) (pkgs."mpi" or (sysDepError "mpi")) ++ (pkgs.lib).optional (flags.openmpi-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-ubuntu) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-ubuntu) (pkgs."mpich" or (sysDepError "mpich"));
          buildable = true;
          };
        "mpi-test-store" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mpi-hs" or (buildDepError "mpi-hs"))
            ];
          libs = ((((pkgs.lib).optional (flags.openmpi-debian) (pkgs."mpi" or (sysDepError "mpi")) ++ (pkgs.lib).optional (flags.openmpi-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-ubuntu) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-ubuntu) (pkgs."mpich" or (sysDepError "mpich"));
          buildable = true;
          };
        };
      benchmarks = {
        "mpi-hs-benchmarks" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."mpi-hs" or (buildDepError "mpi-hs"))
            ];
          libs = ((((pkgs.lib).optional (flags.openmpi-debian) (pkgs."mpi" or (sysDepError "mpi")) ++ (pkgs.lib).optional (flags.openmpi-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-ubuntu) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-ubuntu) (pkgs."mpich" or (sysDepError "mpich"));
          buildable = true;
          };
        };
      };
    }