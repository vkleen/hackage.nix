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
      identifier = { name = "yoko"; version = "2.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Nicolas Frisby <nicolas.frisby@gmail.com>";
      author = "Nicolas Frisby <nicolas.frisby@gmail.com>";
      homepage = "";
      url = "";
      synopsis = "Generic Programming with Disbanded Data Types";
      description = "Based off of the paper \\\"A Pattern for Almost Homomorphic Functions\\\"\nat <http://www.ittc.ku.edu/~nfrisby/frisby-wgp-2012.pdf>, presented at the\nWorkshop on Generic Programming 2012. Also, my\ndissertation <http://www.ittc.ku.edu/~nfrisby/frisby-dissertation.pdf>\n\n@yoko@ views a nominal datatype as a /band/ of constructors, each\na nominal type in its own right. Such datatypes can be disbanded via the\n@disband@ function into an anonymous sum of nominal constructors, and vice\nversa via the @band@ function. This library uses extensive type-level\nprogramming to enrich its @instant-generics@ foundation with capabilities\nderived from the constructor-centric perspective.\n\nFor example, consider the following /nominal datatype/.\n\n@\ndata Beatles = John ... | Paul ... | George ... | Ringo ...\n@\n\nThis type can of course be understood as a sum of the individual\n/fields types/.\n\n@\ndata John   = John   ...\ndata Paul   = Paul   ...\ndata George = George ...\ndata Ringo  = Ringo  ...\n@\n\n@yoko@'s conceptual foundations start there. In particular, this allows a\nconstructor, say @John@, to be used independently of its original range type\nand sibling constructors.\n\nAs a generic programming library, @yoko@ extends @instant-generics@ with\nsupport for constructor-centric generic programming. The\n@Examples\\/LambdaLift\\/LambdaLift.hs@ file distributed with the @yoko@ source\ndemonstrates defining a lambda-lifting conversion between the two types\n@ULC@, which has lambdas, and @Prog@, which has top-level function\ndeclarations instead.\n\n@\ndata ULC = Lam Type ULC | Var Int | Let [Decl] ULC | App ULC ULC\n\ndata Decl = Decl Type ULC\n\n\n\ndata Prog = Prog [FunDec] TLF\ntype FunDec = ([Type], [Type], Type, TLF)\n\ndata TLF = Top Int [Occ] | Occ Occ | App TLF TLF\ndata Occ = Par Int | Env Int\n@\n\nThese types are defined in separate modules, since they have constructors\nwith the same name. Indeed, the fact that they having matching constructors\nnamed @App@ is crucial for @yoko@'s automatic conversion from @ULC@'s @App@\nto @TLF@'s @App@. As written, the generic lambda-lifter would continue to\nwork for any new @ULC@ constructors (e.g. syntax for tuples or mutable\nreferences) as long as constructors with the same names and analogous fields\nwere added to @TLF@ and the semantics of those constructors doesn't involve\nbinding. This default /generic/ behavior of the lambda-lifter is specified in\nabout ten lines of user code.\n\nThe non-generic code is much more complicated. This is intentional: I wanted\nto show that sometimes shoehorning an algorithm into the requisite type (/ie/\n@a -> m a'@) can be difficult and require subtleties like backwards state.\n\nExisting generic libraries don't use constructor names to the degree that\n@yoko@ does, and so cannot accomodate generic /conversions/ as well.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."th-sccs" or (buildDepError "th-sccs"))
          (hsPkgs."invariant" or (buildDepError "invariant"))
          (hsPkgs."type-equality" or (buildDepError "type-equality"))
          (hsPkgs."bifunctors" or (buildDepError "bifunctors"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."kinds" or (buildDepError "kinds"))
          (hsPkgs."type-functions" or (buildDepError "type-functions"))
          (hsPkgs."records" or (buildDepError "records"))
          (hsPkgs."type-spine" or (buildDepError "type-spine"))
          (hsPkgs."type-digits" or (buildDepError "type-digits"))
          (hsPkgs."type-cereal" or (buildDepError "type-cereal"))
          (hsPkgs."type-ord" or (buildDepError "type-ord"))
          (hsPkgs."type-ord-spine-cereal" or (buildDepError "type-ord-spine-cereal"))
          ];
        buildable = true;
        };
      };
    }