{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {
      dev = false;
    } // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "stache";
          version = "0.1.1";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Mark Karpov <markkarpov@openmailbox.org>";
        author = "Mark Karpov <markkarpov@openmailbox.org>";
        homepage = "https://github.com/stackbuilders/stache";
        url = "";
        synopsis = "Mustache templates for Haskell";
        description = "Mustache templates for Haskell.";
        buildType = "Simple";
      };
      components = {
        stache = {
          depends  = [
            hsPkgs.aeson
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.containers
            hsPkgs.deepseq
            hsPkgs.directory
            hsPkgs.exceptions
            hsPkgs.filepath
            hsPkgs.megaparsec
            hsPkgs.mtl
            hsPkgs.template-haskell
            hsPkgs.text
            hsPkgs.unordered-containers
            hsPkgs.vector
          ] ++ pkgs.lib.optional (!compiler.isGhc) hsPkgs.semigroups;
        };
        tests = {
          tests = {
            depends  = [
              hsPkgs.aeson
              hsPkgs.base
              hsPkgs.containers
              hsPkgs.hspec
              hsPkgs.hspec-megaparsec
              hsPkgs.megaparsec
              hsPkgs.stache
              hsPkgs.text
            ] ++ pkgs.lib.optional (!compiler.isGhc) hsPkgs.semigroups;
          };
          mustache-spec = {
            depends  = [
              hsPkgs.aeson
              hsPkgs.base
              hsPkgs.bytestring
              hsPkgs.containers
              hsPkgs.file-embed
              hsPkgs.hspec
              hsPkgs.megaparsec
              hsPkgs.stache
              hsPkgs.text
              hsPkgs.yaml
            ];
          };
        };
        benchmarks = {
          bench = {
            depends  = [
              hsPkgs.aeson
              hsPkgs.base
              hsPkgs.criterion
              hsPkgs.deepseq
              hsPkgs.megaparsec
              hsPkgs.stache
              hsPkgs.text
            ];
          };
        };
      };
    }