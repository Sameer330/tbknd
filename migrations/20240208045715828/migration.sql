BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "posts" CASCADE;


--
-- MIGRATION VERSION FOR tbknd
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('tbknd', '20240208045715828', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240208045715828', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
