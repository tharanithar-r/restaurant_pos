BEGIN TRY

BEGIN TRAN;

-- DropForeignKey
ALTER TABLE [dbo].[tblCart] DROP CONSTRAINT [FK_Cart_TableNo];

-- AlterTable
ALTER TABLE [dbo].[OrderMaster] ADD [TblgroupId] NVARCHAR(1000);

-- AlterTable
ALTER TABLE [dbo].[tblCart] ADD [TblgroupId] NVARCHAR(1000);

-- CreateTable
CREATE TABLE [dbo].[TableGroup] (
    [id] NVARCHAR(1000) NOT NULL,
    [tableNo] VARCHAR(25) NOT NULL,
    [groupNo] INT NOT NULL,
    [status] VARCHAR(25) NOT NULL CONSTRAINT [TableGroup_status_df] DEFAULT 'Active',
    [billNo] VARCHAR(25),
    [billAmount] DECIMAL(19,4),
    [billedAt] DATETIME2,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [TableGroup_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    [updatedAt] DATETIME2 NOT NULL,
    CONSTRAINT [TableGroup_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- AddForeignKey
ALTER TABLE [dbo].[OrderMaster] ADD CONSTRAINT [OrderMaster_TblgroupId_fkey] FOREIGN KEY ([TblgroupId]) REFERENCES [dbo].[TableGroup]([id]) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[TableGroup] ADD CONSTRAINT [TableGroup_tableNo_fkey] FOREIGN KEY ([tableNo]) REFERENCES [dbo].[tablemaster]([TableNo]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[tblCart] ADD CONSTRAINT [FK_Cart_TableNo] FOREIGN KEY ([TableNo]) REFERENCES [dbo].[tablemaster]([TableNo]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[tblCart] ADD CONSTRAINT [tblCart_TblgroupId_fkey] FOREIGN KEY ([TblgroupId]) REFERENCES [dbo].[TableGroup]([id]) ON DELETE SET NULL ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
