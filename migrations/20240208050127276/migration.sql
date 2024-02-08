BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "posts" (
    "id" serial PRIMARY KEY,
    "userId" integer NOT NULL,
    "text" text NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "posts"
    ADD CONSTRAINT "posts_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR tbknd
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('tbknd', '20240208050127276', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240208050127276', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;
