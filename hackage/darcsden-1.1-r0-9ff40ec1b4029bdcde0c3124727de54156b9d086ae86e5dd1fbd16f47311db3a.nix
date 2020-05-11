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
      darcs28 = true;
      highlightingkate = true;
      highlighter = false;
      closing = true;
      ssh = true;
      };
    package = {
      specVersion = "1.6";
      identifier = { name = "darcsden"; version = "1.1"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Alex Suraci <suraci.alex@gmail.com>, Simon Michael <simon@joyful.com>";
      author = "Alex Suraci <suraci.alex@gmail.com>";
      homepage = "http://hackage.haskell.org/package/darcsden";
      url = "";
      synopsis = "Darcs repository UI and hosting/collaboration app (hub.darcs.net branch).";
      description = "A web application and SSH server for browsing and hosting darcs\nrepositories and collaborating with others.\n\nInstallation: http://hub.darcs.net/simon/darcsden/README.md\n\nRelease notes: http://hub.darcs.net/simon/darcsden/ANNOUNCE.md";
      buildType = "Simple";
      };
    components = {
      exes = {
        "darcsden" = {
          depends = (((([
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base64-string" or (buildDepError "base64-string"))
            (hsPkgs."blaze-builder" or (buildDepError "blaze-builder"))
            (hsPkgs."blaze-html" or (buildDepError "blaze-html"))
            (hsPkgs."blaze-markup" or (buildDepError "blaze-markup"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."CouchDB" or (buildDepError "CouchDB"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."harp" or (buildDepError "harp"))
            (hsPkgs."hashed-storage" or (buildDepError "hashed-storage"))
            (hsPkgs."HsOpenSSL" or (buildDepError "HsOpenSSL"))
            (hsPkgs."hsp" or (buildDepError "hsp"))
            (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
            (hsPkgs."json" or (buildDepError "json"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."mime-mail" or (buildDepError "mime-mail"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."pandoc" or (buildDepError "pandoc"))
            (hsPkgs."pureMD5" or (buildDepError "pureMD5"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."redis" or (buildDepError "redis"))
            (hsPkgs."safe" or (buildDepError "safe"))
            (hsPkgs."SHA" or (buildDepError "SHA"))
            (hsPkgs."snap-core" or (buildDepError "snap-core"))
            (hsPkgs."snap-server" or (buildDepError "snap-server"))
            (hsPkgs."system-uuid" or (buildDepError "system-uuid"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."xhtml" or (buildDepError "xhtml"))
            (hsPkgs."xml" or (buildDepError "xml"))
            ] ++ [
            (hsPkgs."darcs" or (buildDepError "darcs"))
            ]) ++ (pkgs.lib).optional (flags.highlightingkate) (hsPkgs."highlighting-kate" or (buildDepError "highlighting-kate"))) ++ (pkgs.lib).optional (flags.highlighter) (hsPkgs."highlighter" or (buildDepError "highlighter"))) ++ (pkgs.lib).optional (flags.ssh) (hsPkgs."ssh" or (buildDepError "ssh"))) ++ (pkgs.lib).optional (system.isWindows) (hsPkgs."Win32-services-wrapper" or (buildDepError "Win32-services-wrapper"));
          buildable = true;
          };
        "darcsden-ssh" = {
          depends = [
            (hsPkgs."darcs" or (buildDepError "darcs"))
            ] ++ (pkgs.lib).optional (flags.ssh) (hsPkgs."ssh" or (buildDepError "ssh"));
          buildable = true;
          };
        "darcsden-post-hook" = {
          depends = [
            (hsPkgs."darcs" or (buildDepError "darcs"))
            ] ++ (pkgs.lib).optional (flags.closing) (hsPkgs."pcre-light" or (buildDepError "pcre-light"));
          buildable = true;
          };
        "darcsden-test" = {
          depends = [
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."CouchDB" or (buildDepError "CouchDB"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."redis" or (buildDepError "redis"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."webdriver" or (buildDepError "webdriver"))
            ];
          buildable = true;
          };
        };
      };
    }