BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "user_option" DROP COLUMN "environmentId";
ALTER TABLE "user_option" ADD COLUMN "byIndexEnv" bigint NOT NULL DEFAULT 0;

--
-- MIGRATION VERSION FOR chat
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('chat', '20250718175104457', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250718175104457', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_chat
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_chat', '20241219152420529', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241219152420529', "timestamp" = now();


COMMIT;
