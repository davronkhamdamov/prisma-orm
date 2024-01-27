/*
  Warnings:

  - You are about to drop the column `userId` on the `UserPrefence` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone_number" TEXT,
    "isAdmin" BOOLEAN NOT NULL,
    "blob" BLOB,
    "age" INTEGER NOT NULL,
    "userPreferenceId" TEXT,
    CONSTRAINT "User_userPreferenceId_fkey" FOREIGN KEY ("userPreferenceId") REFERENCES "UserPrefence" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_User" ("age", "blob", "email", "id", "isAdmin", "name", "phone_number") SELECT "age", "blob", "email", "id", "isAdmin", "name", "phone_number" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_userPreferenceId_key" ON "User"("userPreferenceId");
CREATE INDEX "User_email_name_idx" ON "User"("email", "name");
CREATE UNIQUE INDEX "User_age_name_key" ON "User"("age", "name");
CREATE TABLE "new_UserPrefence" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "emailUpdates" BOOLEAN NOT NULL
);
INSERT INTO "new_UserPrefence" ("emailUpdates", "id") SELECT "emailUpdates", "id" FROM "UserPrefence";
DROP TABLE "UserPrefence";
ALTER TABLE "new_UserPrefence" RENAME TO "UserPrefence";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
