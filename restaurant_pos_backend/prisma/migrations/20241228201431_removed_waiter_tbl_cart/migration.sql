/*
  Warnings:

  - You are about to drop the column `WaiterName` on the `tblCart` table. All the data in the column will be lost.

*/
BEGIN TRY

BEGIN TRAN;

-- DropForeignKey
ALTER TABLE [dbo].[tblCart] DROP CONSTRAINT [FK_Cart_WaiterMaster];

-- AlterTable
ALTER TABLE [dbo].[tblCart] DROP COLUMN [WaiterName];

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
