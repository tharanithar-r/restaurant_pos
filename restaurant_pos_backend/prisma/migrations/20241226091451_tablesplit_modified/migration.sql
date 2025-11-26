/*
  Warnings:

  - You are about to drop the column `TblgroupId` on the `OrderMaster` table. All the data in the column will be lost.
  - You are about to drop the column `TblgroupId` on the `tblCart` table. All the data in the column will be lost.
  - You are about to drop the `TableGroup` table. If the table is not empty, all the data it contains will be lost.

*/
BEGIN TRY

BEGIN TRAN;

-- DropForeignKey
ALTER TABLE [dbo].[OrderMaster] DROP CONSTRAINT [OrderMaster_TblgroupId_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[TableGroup] DROP CONSTRAINT [TableGroup_tableNo_fkey];

-- DropForeignKey
ALTER TABLE [dbo].[tblCart] DROP CONSTRAINT [tblCart_TblgroupId_fkey];

-- AlterTable
ALTER TABLE [dbo].[OrderMaster] DROP COLUMN [TblgroupId];

-- AlterTable
ALTER TABLE [dbo].[tblCart] DROP COLUMN [TblgroupId];

-- DropTable
DROP TABLE [dbo].[TableGroup];

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
