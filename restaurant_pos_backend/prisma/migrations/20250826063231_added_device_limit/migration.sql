BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[Company] ADD [DeviceLimit] INT CONSTRAINT [Company_DeviceLimit_df] DEFAULT 0;

-- CreateTable
CREATE TABLE [dbo].[RegisteredDevice] (
    [Id] NVARCHAR(1000) NOT NULL,
    [DeviceId] NVARCHAR(1000) NOT NULL,
    [CompanyName] VARCHAR(50) NOT NULL,
    [RegisteredAt] DATETIME2 NOT NULL CONSTRAINT [RegisteredDevice_RegisteredAt_df] DEFAULT CURRENT_TIMESTAMP,
    [LastAccess] DATETIME2 NOT NULL CONSTRAINT [RegisteredDevice_LastAccess_df] DEFAULT CURRENT_TIMESTAMP,
    [IsActive] BIT NOT NULL CONSTRAINT [RegisteredDevice_IsActive_df] DEFAULT 1,
    CONSTRAINT [RegisteredDevice_pkey] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [RegisteredDevice_DeviceId_key] UNIQUE NONCLUSTERED ([DeviceId]),
    CONSTRAINT [RegisteredDevice_CompanyName_DeviceId_key] UNIQUE NONCLUSTERED ([CompanyName],[DeviceId])
);

-- AddForeignKey
ALTER TABLE [dbo].[RegisteredDevice] ADD CONSTRAINT [RegisteredDevice_CompanyName_fkey] FOREIGN KEY ([CompanyName]) REFERENCES [dbo].[Company]([CompanyName]) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
