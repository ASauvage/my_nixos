{ pkgs, ... }:

{
    services.mongodb = {
        enable = true;
        package = pkgs.mongodb;
        mongoshPackage = pkgs.mongosh;
        dbpath = "/var/db/mongodb";
    };
}