{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "groundhog";
          version = "0.8";
        };
        license = "BSD-3-Clause";
        copyright = "";
        maintainer = "Boris Lykah <lykahb@gmail.com>";
        author = "Boris Lykah <lykahb@gmail.com>";
        homepage = "http://github.com/lykahb/groundhog";
        url = "";
        synopsis = "Type-safe datatype-database mapping library.";
        description = "This library maps your datatypes to a relational model, in a way similar to what ORM libraries do in object-oriented programming. The mapping can be configured to work with almost any schema. Groundhog supports schema migrations, composite keys, advanced expressions in queries, and much more. See tutorial <https://www.fpcomplete.com/user/lykahb/groundhog> and examples <https://github.com/lykahb/groundhog/tree/master/examples> on GitHub.";
        buildType = "Simple";
      };
      components = {
        groundhog = {
          depends  = [
            hsPkgs.base
            hsPkgs.bytestring
            hsPkgs.base64-bytestring
            hsPkgs.transformers
            hsPkgs.mtl
            hsPkgs.time
            hsPkgs.attoparsec
            hsPkgs.aeson
            hsPkgs.scientific
            hsPkgs.text
            hsPkgs.blaze-builder
            hsPkgs.containers
            hsPkgs.monad-control
            hsPkgs.transformers-base
            hsPkgs.resourcet
          ];
        };
      };
    }