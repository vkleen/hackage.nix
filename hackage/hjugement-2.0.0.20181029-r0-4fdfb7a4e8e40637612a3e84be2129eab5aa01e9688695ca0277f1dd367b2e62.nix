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
      specVersion = "1.24";
      identifier = { name = "hjugement"; version = "2.0.0.20181029"; };
      license = "GPL-3.0-only";
      copyright = "";
      maintainer = "Julien Moutinho <julm+hjugement@autogeree.net>";
      author = "Julien Moutinho <julm+hjugement@autogeree.net>";
      homepage = "";
      url = "";
      synopsis = "Majority Judgment.";
      description = "A library for the <http://libgen.io/book/index.php?md5=BF67AA4298C1CE7633187546AA53E01D Majority Judgment>.\n\nThe Majority Judgment is <http://libgen.io/book/index.php?md5=BF67AA4298C1CE7633187546AA53E01D judged by its authors>\nto be “superior to any known method of voting\nand to any known method of judging competitions,\nin theory and in practice”.\n\nFor introductory explanations, you can read:\n\n* the accompanying README.md file (en),\n* Marjolaine Leray's comic: <https://www.lechoixcommun.fr/articles/Vous_reprendrez_bien_un_peu_de_democratie-2.html Vous reprendrez bien un peu de démocratie ?> (fr),\n* the dedicated web sites: <https://mieuxvoter.fr> (fr) and <https://lechoixcommun.fr> (fr),\n* a press article I've written: <http://autogeree.net/~julm/txt/jugement_majoritaire.pdf> (fr),\n* or watch: Rida Laraki's conference: <https://mixitconf.org/2017/majority-judgment Le Jugement Majoritaire> (fr).\n\nFor comprehensive studies, you can read Michel Balinski and Rida Laraki's:\n\n* textbook: <http://libgen.io/book/index.php?md5=BF67AA4298C1CE7633187546AA53E01D Majority Judgment: Measuring, Ranking, and Electing> (en)\n* cahier: <http://www.lamsade.dauphine.fr/sites/default/IMG/pdf/cahier_377.pdf Majority Judgment vs. Majority Rule> (en)\n* paper: <https://1007421605497013616-a-1802744773732722657-s-sites.googlegroups.com/site/ridalaraki/xfiles/BalinskiLarakiJudgeDontVotecahierderecherche2010-27.pdf Judge : Don't Vote!> (en)\n* article: <https://www.cairn.info/revue-francaise-d-economie-2012-4-page-11.htm Jugement majoritaire versus vote majoritaire (via les présidentielles 2011-2012)> (fr).\n\nAnd, if you do not mind to dive into a quick and poorly documented code,\nyou can also play around with a Python macro to Libre Office\nthat I've written and embedded into this spreadsheet:\n<http://autogeree.net/~julm/txt/jugements.ods>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          ];
        buildable = true;
        };
      tests = {
        "hjugement-test" = {
          depends = [
            (hsPkgs."hjugement" or (buildDepError "hjugement"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."hashable" or (buildDepError "hashable"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-quickcheck" or (buildDepError "tasty-quickcheck"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            ];
          buildable = true;
          };
        };
      };
    }