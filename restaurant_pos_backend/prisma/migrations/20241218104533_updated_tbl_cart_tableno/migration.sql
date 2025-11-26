/*
  Warnings:

  - A unique constraint covering the columns `[TableNo]` on the table `tblCart` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `TableNo` to the `tblCart` table without a default value. This is not possible if the table is not empty.

*/
BEGIN TRY

BEGIN TRAN;

-- DropIndex
ALTER TABLE [dbo].[tblCart] DROP CONSTRAINT [tblCart_Customer_key];

-- AlterTable
ALTER TABLE [dbo].[tblCart] ADD [TableNo] VARCHAR(25) NOT NULL;

-- CreateIndex
ALTER TABLE [dbo].[tblCart] ADD CONSTRAINT [tblCart_TableNo_key] UNIQUE NONCLUSTERED ([TableNo]);

-- AddForeignKey
ALTER TABLE [dbo].[tblCart] ADD CONSTRAINT [FK_Cart_TableNo] FOREIGN KEY ([TableNo]) REFERENCES [dbo].[tablemaster]([TableNo]) ON DELETE NO ACTION ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
