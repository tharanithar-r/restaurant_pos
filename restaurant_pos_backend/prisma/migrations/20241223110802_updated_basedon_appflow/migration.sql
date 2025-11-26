/*
  Warnings:

  - Added the required column `UpdatedAt` to the `CartItem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `UpdatedAt` to the `tblCart` table without a default value. This is not possible if the table is not empty.

*/
BEGIN TRY

BEGIN TRAN;

-- DropForeignKey
ALTER TABLE [dbo].[OrderMaster] DROP CONSTRAINT [FK_OM_IM];

-- DropForeignKey
ALTER TABLE [dbo].[OrderMaster] DROP CONSTRAINT [FK_OM_TM];

-- AlterTable
ALTER TABLE [dbo].[CartItem] ADD [CreatedAt] DATETIME2 NOT NULL CONSTRAINT [CartItem_CreatedAt_df] DEFAULT CURRENT_TIMESTAMP,
[UpdatedAt] DATETIME2 NOT NULL;

-- AlterTable
ALTER TABLE [dbo].[OrderMaster] ADD [CartId] NVARCHAR(1000),
[CreatedAt] DATETIME2 CONSTRAINT [OrderMaster_CreatedAt_df] DEFAULT CURRENT_TIMESTAMP,
[UpdatedAt] DATETIME2,
[tblCartCartId] NVARCHAR(1000);

-- AlterTable
ALTER TABLE [dbo].[tblCart] ADD [CreatedAt] DATETIME2 NOT NULL CONSTRAINT [tblCart_CreatedAt_df] DEFAULT CURRENT_TIMESTAMP,
[Status] NVARCHAR(1000) NOT NULL CONSTRAINT [tblCart_Status_df] DEFAULT 'ACTIVE',
[UpdatedAt] DATETIME2 NOT NULL;

-- AddForeignKey
ALTER TABLE [dbo].[OrderMaster] ADD CONSTRAINT [OrderMaster_ItemCode_fkey] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[OrderMaster] ADD CONSTRAINT [OrderMaster_TableNo_fkey] FOREIGN KEY ([TableNo]) REFERENCES [dbo].[tablemaster]([TableNo]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[OrderMaster] ADD CONSTRAINT [OrderMaster_tblCartCartId_fkey] FOREIGN KEY ([tblCartCartId]) REFERENCES [dbo].[tblCart]([CartId]) ON DELETE SET NULL ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
