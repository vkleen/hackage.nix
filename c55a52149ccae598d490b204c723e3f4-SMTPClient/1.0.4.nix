{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "SMTPClient";
          version = "1.0.4";
        };
        license = "BSD-3-Clause";
        copyright = "(c) Stephen Blackheath 2008, (c) Matthew Elder 2009";
        maintainer = "http://blacksapphire.com/antispam/";
        author = "Stephen Blackheath, Matthew Elder, Jeremy Shaw";
        homepage = "";
        url = "";
        synopsis = "A simple SMTP client library";
        description = "A simple SMTP client library for applications that want to send emails.";
        buildType = "Simple";
      };
      components = {
        SMTPClient = {
          depends  = [
            hsPkgs.base
            hsPkgs.hsemail
            hsPkgs.network
            hsPkgs.old-time
            hsPkgs.old-locale
            hsPkgs.containers
            hsPkgs.extensible-exceptions
          ];
        };
      };
    }