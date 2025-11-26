/*
  Warnings:

  - You are about to drop the column `tblCartCartId` on the `OrderMaster` table. All the data in the column will be lost.

*/
BEGIN TRY

BEGIN TRAN;

-- DropForeignKey
ALTER TABLE [dbo].[OrderMaster] DROP CONSTRAINT [OrderMaster_tblCartCartId_fkey];

-- AlterTable
ALTER TABLE [dbo].[OrderMaster] DROP COLUMN [tblCartCartId];

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
