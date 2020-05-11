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
      mpich-debian = false;
      mpich-macports = false;
      mpich-ubuntu = false;
      openmpi-debian = false;
      openmpi-macports = false;
      openmpi-ubuntu = false;
      system-mpi = true;
      };
    package = {
      specVersion = "1.12";
      identifier = { name = "mpi-hs"; version = "0.7.1.2"; };
      license = "Apache-2.0";
      copyright = "2018, 2019, 2020 Erik Schnetter <schnetter@gmail.com>";
      maintainer = "Erik Schnetter <schnetter@gmail.com>";
      author = "Erik Schnetter <schnetter@gmail.com>";
      homepage = "https://github.com/eschnett/mpi-hs#readme";
      url = "";
      synopsis = "MPI bindings for Haskell";
      description = "MPI (the [Message Passinag Interface](https://www.mpi-forum.org)) is\na widely used standard for distributed-memory programming on HPC\n(High Performance Computing) systems. MPI allows exchanging data\n(_messages_) between programs running in parallel. There are several\nhigh-quality open source MPI implementations (e.g. MPICH, MVAPICH,\nOpenMPI) as well as a variety of closed-source implementations.\nThese libraries can typically make use of high-bandwidth low-latency\ncommunication hardware such as InfiniBand.\n\nThis library @mpi-hs@ provides Haskell bindings for MPI. It is based\non ideas taken from\n[haskell-mpi](https://github.com/bjpop/haskell-mpi),\n[Boost.MPI](https://www.boost.org/doc/libs/1_64_0/doc/html/mpi.html)\nfor C++, and [MPI for\nPython](https://mpi4py.readthedocs.io/en/stable/).\n\n@mpi-hs@ provides two API levels: A low-level API gives rather\ndirect access to the actual MPI API, apart from certain \"reasonable\"\nmappings from C to Haskell (e.g. output arguments that are in C\nstored via a pointer are in Haskell regular return values). A\nhigh-level API simplifies exchanging arbitrary values that can be\nserialized.\n\nNote that the automated builds on\n[Hackage](http://hackage.haskell.org) will currently always fail\nsince no system MPI library is present there. However, builds on\n[Stackage](https://www.stackage.org) should succeed -- if not, there\nis an error in this package.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."monad-loops" or (buildDepError "monad-loops"))
          ];
        libs = ((((((pkgs.lib).optional (flags.mpich-debian) (pkgs."mpich" or (sysDepError "mpich")) ++ (pkgs.lib).optional (flags.mpich-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-ubuntu) (pkgs."mpich" or (sysDepError "mpich"))) ++ (pkgs.lib).optional (flags.openmpi-debian) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-ubuntu) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optionals (flags.system-mpi) ((pkgs.lib).optionals (!flags.mpich-debian) ((pkgs.lib).optionals (!flags.mpich-macports) ((pkgs.lib).optionals (!flags.mpich-ubuntu) ((pkgs.lib).optionals (!flags.openmpi-debian) ((pkgs.lib).optionals (!flags.openmpi-macports) ((pkgs.lib).optional (!flags.openmpi-ubuntu) (pkgs."mpich" or (sysDepError "mpich"))))))));
        build-tools = [
          (hsPkgs.buildPackages.c2hs or (pkgs.buildPackages.c2hs or (buildToolDepError "c2hs")))
          ];
        buildable = true;
        };
      exes = {
        "example1" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mpi-hs" or (buildDepError "mpi-hs"))
            ];
          libs = ((((((pkgs.lib).optional (flags.mpich-debian) (pkgs."mpich" or (sysDepError "mpich")) ++ (pkgs.lib).optional (flags.mpich-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-ubuntu) (pkgs."mpich" or (sysDepError "mpich"))) ++ (pkgs.lib).optional (flags.openmpi-debian) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-ubuntu) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optionals (flags.system-mpi) ((pkgs.lib).optionals (!flags.mpich-debian) ((pkgs.lib).optionals (!flags.mpich-macports) ((pkgs.lib).optionals (!flags.mpich-ubuntu) ((pkgs.lib).optionals (!flags.openmpi-debian) ((pkgs.lib).optionals (!flags.openmpi-macports) ((pkgs.lib).optional (!flags.openmpi-ubuntu) (pkgs."mpich" or (sysDepError "mpich"))))))));
          buildable = true;
          };
        "example2" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mpi-hs" or (buildDepError "mpi-hs"))
            ];
          libs = ((((((pkgs.lib).optional (flags.mpich-debian) (pkgs."mpich" or (sysDepError "mpich")) ++ (pkgs.lib).optional (flags.mpich-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-ubuntu) (pkgs."mpich" or (sysDepError "mpich"))) ++ (pkgs.lib).optional (flags.openmpi-debian) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-ubuntu) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optionals (flags.system-mpi) ((pkgs.lib).optionals (!flags.mpich-debian) ((pkgs.lib).optionals (!flags.mpich-macports) ((pkgs.lib).optionals (!flags.mpich-ubuntu) ((pkgs.lib).optionals (!flags.openmpi-debian) ((pkgs.lib).optionals (!flags.openmpi-macports) ((pkgs.lib).optional (!flags.openmpi-ubuntu) (pkgs."mpich" or (sysDepError "mpich"))))))));
          buildable = true;
          };
        "version" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mpi-hs" or (buildDepError "mpi-hs"))
            ];
          libs = ((((((pkgs.lib).optional (flags.mpich-debian) (pkgs."mpich" or (sysDepError "mpich")) ++ (pkgs.lib).optional (flags.mpich-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-ubuntu) (pkgs."mpich" or (sysDepError "mpich"))) ++ (pkgs.lib).optional (flags.openmpi-debian) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-ubuntu) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optionals (flags.system-mpi) ((pkgs.lib).optionals (!flags.mpich-debian) ((pkgs.lib).optionals (!flags.mpich-macports) ((pkgs.lib).optionals (!flags.mpich-ubuntu) ((pkgs.lib).optionals (!flags.openmpi-debian) ((pkgs.lib).optionals (!flags.openmpi-macports) ((pkgs.lib).optional (!flags.openmpi-ubuntu) (pkgs."mpich" or (sysDepError "mpich"))))))));
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
          libs = ((((((pkgs.lib).optional (flags.mpich-debian) (pkgs."mpich" or (sysDepError "mpich")) ++ (pkgs.lib).optional (flags.mpich-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-ubuntu) (pkgs."mpich" or (sysDepError "mpich"))) ++ (pkgs.lib).optional (flags.openmpi-debian) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-ubuntu) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optionals (flags.system-mpi) ((pkgs.lib).optionals (!flags.mpich-debian) ((pkgs.lib).optionals (!flags.mpich-macports) ((pkgs.lib).optionals (!flags.mpich-ubuntu) ((pkgs.lib).optionals (!flags.openmpi-debian) ((pkgs.lib).optionals (!flags.openmpi-macports) ((pkgs.lib).optional (!flags.openmpi-ubuntu) (pkgs."mpich" or (sysDepError "mpich"))))))));
          buildable = true;
          };
        "mpi-test-storable" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mpi-hs" or (buildDepError "mpi-hs"))
            ];
          libs = ((((((pkgs.lib).optional (flags.mpich-debian) (pkgs."mpich" or (sysDepError "mpich")) ++ (pkgs.lib).optional (flags.mpich-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.mpich-ubuntu) (pkgs."mpich" or (sysDepError "mpich"))) ++ (pkgs.lib).optional (flags.openmpi-debian) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-macports) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optional (flags.openmpi-ubuntu) (pkgs."mpi" or (sysDepError "mpi"))) ++ (pkgs.lib).optionals (flags.system-mpi) ((pkgs.lib).optionals (!flags.mpich-debian) ((pkgs.lib).optionals (!flags.mpich-macports) ((pkgs.lib).optionals (!flags.mpich-ubuntu) ((pkgs.lib).optionals (!flags.openmpi-debian) ((pkgs.lib).optionals (!flags.openmpi-macports) ((pkgs.lib).optional (!flags.openmpi-ubuntu) (pkgs."mpich" or (sysDepError "mpich"))))))));
          buildable = true;
          };
        };
      };
    }