BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "users" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "image" text NOT NULL
);


--
-- MIGRATION VERSION FOR tbknd
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('tbknd', '20240206171738894', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240206171738894', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
