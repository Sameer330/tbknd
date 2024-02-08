BEGIN;


--
-- MIGRATION VERSION FOR tbknd
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('tbknd', '20240208051709476', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240208051709476', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
