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
      small_base = false;
      use_sse2 = false;
      use_altivec = false;
      big_endian64 = false;
      };
    package = {
      specVersion = "1.2.0";
      identifier = { name = "mersenne-random"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2008. Don Stewart <dons@galois.com>";
      maintainer = "Don Stewart <dons@galois.com>";
      author = "Don Stewart";
      homepage = "http://code.haskell.org/~dons/code/mersenne-random";
      url = "";
      synopsis = "Generate high quality pseudorandom numbers using a SIMD Fast Mersenne Twister";
      description = "The Mersenne twister is a pseudorandom number generator developed by\nMakoto Matsumoto and Takuji Nishimura that is based on a matrix linear\nrecurrence over a finite binary field. It provides for fast generation\nof very high quality pseudorandom numbers\n\nThis library uses SFMT, the SIMD-oriented Fast Mersenne Twister, a\nvariant of Mersenne Twister that is much faster than the original.\nIt is designed to be fast when it runs on 128-bit SIMD. It can be\ncompiled with either SSE2 and PowerPC AltiVec support, to take\nadvantage of these instructions.\n\nBy default the period of the function is 2^19937-1, however, you can\ncompile in other defaults. Note that this algorithm on its own\nis not cryptographically secure.\n\nFor more information about the algorithm and implementation, see\nthe SFMT homepage,\n\n<http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/emt.html>\n\nand, Mutsuo Saito and Makoto Matsumoto,\n/SIMD-oriented Fast Mersenne Twister: a 128-bit Pseudorandom Number\nGenerator/, in the Proceedings of MCQMC2006, here:\n\n<http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/ARTICLES/sfmt.pdf>\n";
      buildType = "Configure";
      };
    components = {
      "library" = {
        depends = if flags.small_base
          then [ (hsPkgs."base" or (buildDepError "base")) ]
          else [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            ];
        libs = [ (pkgs."m" or (sysDepError "m")) ];
        buildable = true;
        };
      };
    }