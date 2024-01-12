BEGIN;

-- Backfill `status` for historical entries
UPDATE
    subscriptions
SET
    STATUS = 'confirmed'
WHERE
    STATUS IS NULL;

-- Make status mandatory
ALTER TABLE
    subscriptions
ALTER COLUMN
    STATUS
SET
    NOT NULL;

COMMIT;
