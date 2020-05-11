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
      specVersion = "1.12";
      identifier = { name = "mini-egison"; version = "0.1.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "Satoshi Egi <egi@egison.org>";
      author = "Mayuko Kori, Satoshi Egi";
      homepage = "https://github.com/egison/egison-haskell#readme";
      url = "";
      synopsis = "Template Haskell Implementation of Egison Pattern Matching";
      description = "This package provides the pattern-matching facility that fulfills the following three criteria for practical pattern matching for non-free data types\\: (i) non-linear pattern matching with backtracking; (ii) extensibility of pattern-matching algorithms; (iii) ad-hoc polymorphism of patterns.\nNon-free data types are data types whose data have no standard forms.\nFor example, multisets are non-free data types because the multiset '[a,b,b]' has two other equivalent but literally different forms '[b,a,b]' and '[b,b,a]'.\n\nThe design of the pattern-matching facility is originally proposed in <https://arxiv.org/abs/1808.10603 this paper> and implemented in <http://github.com/egison/egison/ the Egison programming language>.\n\n/Samples/\n\nWe can extract all twin primes from the list of prime numbers by pattern matching:\n\n> take 10 (matchAll primes (List Integer)\n>            [[mc| join _ (cons \$p (cons #(p+2) _)) => (p, p+2) |]])\n> -- [(3,5),(5,7),(11,13),(17,19),(29,31),(41,43),(59,61),(71,73),(101,103),(107,109)]\n\nWe can describe patterns for each poker hand utilizing pattern matching for a multiset:\n\n> poker cs =\n>   match cs (Multiset CardM)\n>     [[mc| cons (card \$s \$n)\n>            (cons (card #s #(n-1))\n>             (cons (card #s #(n-2))\n>              (cons (card #s #(n-3))\n>               (cons (card #s #(n-4))\n>                _)))) => \"Straight flush\" |],\n>      [mc| cons (card _ \$n)\n>            (cons (card _ #n)\n>             (cons (card _ #n)\n>              (cons (card _ #n)\n>               (cons _\n>                _)))) => \"Four of a kind\" |],\n>      [mc| cons (card _ \$m)\n>            (cons (card _ #m)\n>             (cons (card _ #m)\n>              (cons (card _ \$n)\n>               (cons (card _ #n)\n>                _)))) => \"Full house\" |],\n>      [mc| cons (card \$s _)\n>            (cons (card #s _)\n>             (cons (card #s _)\n>              (cons (card #s _)\n>               (cons (card #s _)\n>                _)))) => \"Flush\" |],\n>      [mc| cons (card _ \$n)\n>            (cons (card _ #(n-1))\n>             (cons (card _ #(n-2))\n>              (cons (card _ #(n-3))\n>               (cons (card _ #(n-4))\n>                _)))) => \"Straight\" |],\n>      [mc| cons (card _ \$n)\n>            (cons (card _ #n)\n>             (cons (card _ #n)\n>              (cons _\n>               (cons _\n>                _)))) => \"Three of a kind\" |],\n>      [mc| cons (card _ \$m)\n>            (cons (card _ #m)\n>             (cons (card _ \$n)\n>              (cons (card _ #n)\n>               (cons _\n>                _)))) => \"Two pair\" |],\n>      [mc| cons (card _ \$n)\n>            (cons (card _ #n)\n>             (cons _\n>              (cons _\n>               (cons _\n>                _)))) => \"One pair\" |],\n>      [mc| _ => \"Nothing\" |]]\n\nThe pattern-matching algorithms for 'List' and 'Multiset' can be defined by users.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."haskell-src-meta" or (buildDepError "haskell-src-meta"))
          (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          ];
        buildable = true;
        };
      tests = {
        "mini-egison-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mini-egison" or (buildDepError "mini-egison"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."primes" or (buildDepError "primes"))
            ];
          buildable = true;
          };
        };
      };
    }