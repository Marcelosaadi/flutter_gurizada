/*
  Warnings:

  - You are about to drop the column `entrgue` on the `tabelacertinho` table. All the data in the column will be lost.
  - Added the required column `entregue` to the `tabelacertinho` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "tabelacertinho" DROP COLUMN "entrgue",
ADD COLUMN     "entregue" BOOLEAN NOT NULL;
