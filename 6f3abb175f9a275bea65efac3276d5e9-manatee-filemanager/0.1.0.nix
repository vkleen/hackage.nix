{ compiler, flags ? {}, hsPkgs, pkgconfPkgs, pkgs, system }:
let
    _flags = {} // flags;
    in {
      flags = _flags;
      package = {
        specVersion = "1.6";
        identifier = {
          name = "manatee-filemanager";
          version = "0.1.0";
        };
        license = "GPL-3.0-only";
        copyright = "(c) 2010 ~ 2011 Andy Stewart";
        maintainer = "Andy Stewart <lazycat.manatee@gmail.com>";
        author = "Andy Stewart";
        homepage = "";
        url = "";
        synopsis = "File manager extension for Manatee.";
        description = "manatee-filemanager is file manager extension for Manatee (Haskell/Gtk+ Integrated Live Environment)\n\nVideo (Select 720p HD) at : <http://www.youtube.com/watch?v=weS6zys3U8k> <http://www.youtube.com/watch?v=A3DgKDVkyeM> <http://v.youku.com/v_show/id_XMjI2MDMzODI4.html>\n\nScreenshots at : <http://goo.gl/MkVw>\n\nManual at : <http://haskell.org/haskellwiki/Manatee>\n\nIRC channel: irc.freenode.net 6667 <##manatee>\n\nMailing-List: manatee-user\\@googlegroups.com manatee-develop\\@googlegroups.com\n";
        buildType = "Custom";
      };
      components = {
        manatee-filemanager = {
          depends  = [
            hsPkgs.base
            hsPkgs.manatee-core
            hsPkgs.dbus-client
            hsPkgs.stm
            hsPkgs.containers
            hsPkgs.gtk
            hsPkgs.derive
            hsPkgs.binary
            hsPkgs.text
            hsPkgs.mtl
            hsPkgs.old-time
            hsPkgs.old-locale
            hsPkgs.glib
            hsPkgs.gio
            hsPkgs.filepath
            hsPkgs.utf8-string
          ];
        };
        exes = {
          manatee-filemanager = {};
        };
      };
    }