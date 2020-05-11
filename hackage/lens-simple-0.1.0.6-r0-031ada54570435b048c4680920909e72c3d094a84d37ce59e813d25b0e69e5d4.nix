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
      identifier = { name = "lens-simple"; version = "0.1.0.6"; };
      license = "BSD-3-Clause";
      copyright = "2012, 2013, 2014 Russell O'Connor; 2015 Michael Thompson";
      maintainer = "what_is_it_to_do_anything@yahoo.com";
      author = "michaelt";
      homepage = "https://github.com/michaelt/lens-simple";
      url = "";
      synopsis = "simplified import of elementary lens-family combinators";
      description = "This module, <http://hackage.haskell.org/package/lens-simple/docs/Lens-Simple.html Lens.Simple>,\njust re-exports the main modules from Russell O\\'Connor's\n<http://hackage.haskell.org/package/lens-family lens-family>\npackage, the original <http://r6.ca/blog/20120623T104901Z.html van Laarhoven lens> library.\n@Lens.Simple@ also re-exports @makeLenses@ and\nother TH incantations from Dan Burton's associated\n<http://hackage.haskell.org/package/lens-family-th lens-family-th>.\nThe idea is just to make a sort of low-powered, minimal-dependency @lens-family@ equivalent of\nthe 800 lb gorilla of lens library imports:\n\n> import Control.Lens\n\nto wit, the elegant and spritely:\n\n> import Lens.Simple\n\nCheck it out, it's even one character shorter!\n\nIf you are unfamiliar with the use of what O'Connor calls van Laarhoven\nlenses, you might take a\nlook at the excellent <http://www.serpentine.com/wreq/tutorial.html tutorial>\nfor the <http://hackage.haskell.org/package/wreq wreq>\nlibrary. All of the tutorial material will compile if you replace\n@import Control.Lens@ with the suave @import Lens.Simple@.\nThe error messages you get might be a little less opaque. But\nthe point is basically academic, of course: you have already weighed down your\nsandbox with the @lens@ library by installing @wreq@ and if you get\nany deeper into @wreq@ you will need it.\n\nAs another illustration of the simplicity of the\nfundamental van Laarhoven lens combinators, note that the gloss\n<https://github.com/michaelt/lens-family-simple/blob/master/examples/Pong.hs pong example>\nfrom the @lens@ library examples directory requires only this\nabbreviating change of imports.\nIf you care to make that program more complicated,\nyou might at some point need\nthe unfathomably more sophisticated material in @Control.Lens@.\nWithin its more limited sphere, @lens-family@ accords as\nfar as possible with @lens@, so this switch\nwill often be all that is necessary to begin using them.\n\nThis module was originally intended to simplify the use of packages that\nfollow the original promise of the van Laarhoven lenses. Correct practice is\nto export lenses without depending on a lens-library, where possible;\nin basic cases these use just familiar @Prelude@ types.\nExamples of best practices in this respect are\n<http://hackage.haskell.org/package/pipes-bytestring pipes-bytestring>\nand <http://hackage.haskell.org/package/pipes-group pipes-group>.\nBecause of the heavily monadic character of those libraries, the\nextra material in @Control.Lens@ is rarely of use anyway; one sticks largely\nto @view\\/(^.)@, @set\\/(.~)@, @over\\/(%~)@ and @zoom@.\n\nNote that many of the other lenses and combinators are a bit more\nspecialized than their @Control.Lens@ equivalents:\nfor example, _1 and _2 are here\nfamiliarly specialized to act just on real Haskell\npairs. With the loss of abstraction we also of course\nlose the concomitant opaque error messages\nabout @Field1 s t a b@ etc.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."lens-family" or (buildDepError "lens-family"))
          (hsPkgs."lens-family-core" or (buildDepError "lens-family-core"))
          (hsPkgs."lens-family-th" or (buildDepError "lens-family-th"))
          ];
        buildable = true;
        };
      };
    }