{ pkgs, ... }:

{
    services.postgresql = {
        enable = true;
        package = pkgs.postgresql;
        dataDir = "/var/lib/postgresql/${config.services.postgresql.package.psqlSchema}";
        port = 5432;
    };
}