{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.10";
        identifier = {
          name = "gogol-resourcemanager";
          version = "0.1.1";
        };
        license = "LicenseRef-OtherLicense";
        copyright = "Copyright (c) 2015-2016 Brendan Hay";
        maintainer = "Brendan Hay <brendan.g.hay@gmail.com>";
        author = "Brendan Hay";
        homepage = "https://github.com/brendanhay/gogol";
        url = "";
        synopsis = "Google Cloud Resource Manager SDK.";
        description = "The Google Cloud Resource Manager API provides methods for creating,\nreading, and updating project metadata.\n\n/Warning:/ This is an experimental prototype/preview release which is still\nunder exploratory development and not intended for public use, caveat emptor!\n\nThis library is compatible with version @v1@\nof the API.";
        buildType = "Simple";
      };
      components = {
        gogol-resourcemanager = {
          depends  = [
            hsPkgs.gogol-core
            hsPkgs.base
          ];
        };
      };
    }