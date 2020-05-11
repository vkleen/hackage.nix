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
      specVersion = "1.8";
      identifier = { name = "stomp-patterns"; version = "0.0.1"; };
      license = "LicenseRef-LGPL";
      copyright = "Copyright (c) Tobias Schoofs, 2013";
      maintainer = "tobias dot schoofs at gmx dot net";
      author = "Tobias Schoofs";
      homepage = "http://github.com/toschoo/mom";
      url = "";
      synopsis = "Stompl MOM Stomp Patterns";
      description = "The Stomp Protocol specifies a reduced message broker\nwith queues usually read by one application and written\nby one or more applications.\nThe specification does not include other, more advanced,\ninteroperability patterns, where, for example,\na client requests a job from a server or\na publisher sends data to many subscribers.\nSuch communication patterns, apparantly,\nare left to be implemented by applications.\nPatterns like client-server, publish and subscribe\nand many others, however, are used over and over again\nin message-oriented applications.\n\nThis library implements a number of communication patterns\non top of the Stomp specification\nthat are often used and often described in the literature.\nThere is a set of /basic/ patterns,\n\n* client-server,\n\n* publish and subscribe and\n\n* pusher-worker (pipeline)\n\nas well as a set of derived patterns, namely:\n\n* Desk: A service to obtain the access point\n(/i.e./ queue name) of a specified provider;\n\n* Load balancers: Services to balance requests\namong a group of connected /workers/\n(a.k.a. /Majordomo/ pattern);\n\n* Bridge: Connections between brokers.\n\nMore information, examples and a test suite are available\non <http://github.com/toschoo/mom>.\nThe Stomp specification can be found at\n<http://stomp.github.com>.\n\nThe notion of /pattern/ and the related concepts,\nas they are presented here,\nrely heavily on\nPieter Hintjens, \\\"Code Connected\\\", O'Reilly, 2013\n(see also <http://hintjens.com/books>).\n\nRelease History:\n\n[0.0.1] Initial release";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."stomp-queue" or (buildDepError "stomp-queue"))
          (hsPkgs."stompl" or (buildDepError "stompl"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."mime" or (buildDepError "mime"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."split" or (buildDepError "split"))
          ];
        buildable = true;
        };
      };
    }