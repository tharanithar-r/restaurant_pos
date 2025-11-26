/*
  Warnings:

  - You are about to drop the column `OrderQty` on the `CartItem` table. All the data in the column will be lost.

*/
BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[CartItem] DROP COLUMN [OrderQty];
ALTER TABLE [dbo].[CartItem] ADD [Qty] FLOAT(53);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
