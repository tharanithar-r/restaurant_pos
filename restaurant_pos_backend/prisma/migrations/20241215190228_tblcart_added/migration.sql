BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[tblCart] (
    [CartId] NVARCHAR(1000) NOT NULL,
    [Customer] BIGINT NOT NULL,
    CONSTRAINT [tblCart_pkey] PRIMARY KEY CLUSTERED ([CartId]),
    CONSTRAINT [tblCart_Customer_key] UNIQUE NONCLUSTERED ([Customer])
);

-- CreateTable
CREATE TABLE [dbo].[CartItem] (
    [id] BIGINT NOT NULL IDENTITY(1,1),
    [CartId] NVARCHAR(1000) NOT NULL,
    [ItemCode] BIGINT NOT NULL,
    [MaxRate] DECIMAL(19,4),
    [OrderQty] FLOAT(53),
    [Amount] DECIMAL(19,4),
    CONSTRAINT [CartItem_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- AddForeignKey
ALTER TABLE [dbo].[tblCart] ADD CONSTRAINT [FK_Cart_Customer] FOREIGN KEY ([Customer]) REFERENCES [dbo].[customermaster]([Customer]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[CartItem] ADD CONSTRAINT [FK_Cart_ItemCode] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[CartItem] ADD CONSTRAINT [FK_Cart_id] FOREIGN KEY ([CartId]) REFERENCES [dbo].[tblCart]([CartId]) ON DELETE NO ACTION ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
