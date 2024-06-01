-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ANONYMOUS', 'MEMBER', 'ADMIN');

-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "role" "Role" NOT NULL,
    "userCredentialsId" TEXT,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "userCredentials" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "hash" TEXT NOT NULL,

    CONSTRAINT "userCredentials_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "userCredentials_email_key" ON "userCredentials"("email");

-- CreateIndex
CREATE UNIQUE INDEX "userCredentials_hash_key" ON "userCredentials"("hash");

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_userCredentialsId_fkey" FOREIGN KEY ("userCredentialsId") REFERENCES "userCredentials"("id") ON DELETE SET NULL ON UPDATE CASCADE;
