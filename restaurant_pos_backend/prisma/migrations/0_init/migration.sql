BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[account_transaction] (
    [LedgerNo] INT,
    [Trans_Type] VARCHAR(25),
    [CounterName] VARCHAR(25),
    [Bill_Type] VARCHAR(25),
    [Trans_Date] DATETIME,
    [AccountName] VARCHAR(50),
    [BillNo] VARCHAR(50),
    [Code] VARCHAR(50),
    [Name] VARCHAR(50),
    [Memo] VARCHAR(150),
    [Split] VARCHAR(55),
    [Debit] MONEY CONSTRAINT [DF__account_t__Debit__0F975522] DEFAULT 0.00,
    [Credit] MONEY CONSTRAINT [DF__account_t__Credi__108B795B] DEFAULT 0.00,
    [PmtMode] VARCHAR(15),
    [CheckNo] VARCHAR(25),
    [Status] VARCHAR(10),
    [Login] VARCHAR(15),
    [LoginName] VARCHAR(30),
    [Due_Date] DATETIME,
    [SNo] INT,
    [Amount] MONEY CONSTRAINT [DF__account_t__Amoun__117F9D94] DEFAULT 0.00,
    [Balance] MONEY CONSTRAINT [DF__account_t__Balan__1273C1CD] DEFAULT 0.00,
    [Area] VARCHAR(50),
    [Onlinestatus] VARCHAR(25),
    [AccType] VARCHAR(10),
    [BranchName] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[accountmaster] (
    [GroupName] VARCHAR(25),
    [AccountName] VARCHAR(50) NOT NULL,
    [SubAc] VARCHAR(50) CONSTRAINT [DF__accountma__SubAc__15502E78] DEFAULT 'Nil',
    [BankAcctNo] VARCHAR(25),
    [ActiveStatus] VARCHAR(10) CONSTRAINT [DF__accountma__Activ__164452B1] DEFAULT 'Active',
    [LoginName] VARCHAR(25),
    [Type] VARCHAR(10),
    [Description] VARCHAR(50),
    [OrderBy] INT CONSTRAINT [DF__accountma__Order__173876EA] DEFAULT 0,
    [Entry_Type] VARCHAR(10),
    [Balance] DECIMAL(19,4) CONSTRAINT [DF__accountma__Balan__182C9B23] DEFAULT 0.00,
    [GST] FLOAT(53),
    CONSTRAINT [PK__accountm__406E0D2F141A46E6] PRIMARY KEY CLUSTERED ([AccountName])
);

-- CreateTable
CREATE TABLE [dbo].[Addressmaster] (
    [Customer] BIGINT NOT NULL,
    [CustomerName] VARCHAR(50),
    [Address] VARCHAR(50),
    [City] VARCHAR(50),
    [ResPhone] VARCHAR(25),
    [Phone] VARCHAR(25),
    [Mobile] VARCHAR(25),
    [Area] VARCHAR(50),
    [ImgPhoto] IMAGE,
    [Fax] VARCHAR(20),
    [EMail] VARCHAR(50),
    [Login] VARCHAR(25),
    [LoginName] VARCHAR(25),
    [Web] VARCHAR(50),
    [DOB] DATETIME,
    [DOW] DATETIME,
    CONSTRAINT [PK__Addressm__EC6FA1A1FA08469F] PRIMARY KEY CLUSTERED ([Customer])
);

-- CreateTable
CREATE TABLE [dbo].[Attendance] (
    [RecordNo] INT NOT NULL,
    [TransDate] DATETIME NOT NULL,
    [Sno] INT NOT NULL,
    [EmpNo] VARCHAR(25),
    [Present] INT CONSTRAINT [DF__Attendanc__Prese__3DE82FB7] DEFAULT 0,
    [Absent] INT CONSTRAINT [DF__Attendanc__Absen__3EDC53F0] DEFAULT 0,
    [TransType] VARCHAR(50),
    [LoginName] VARCHAR(25),
    [AccType] VARCHAR(25),
    [BranchName] VARCHAR(50),
    [Halfday] DECIMAL(18,2),
    [PaidStatus] VARCHAR(50) CONSTRAINT [DF__Attendanc__PaidS__3FD07829] DEFAULT 'Unpaid',
    CONSTRAINT [PK__Attendan__0B7DBFBDBF189C9C] PRIMARY KEY CLUSTERED ([TransDate],[Sno])
);

-- CreateTable
CREATE TABLE [dbo].[AttendanceEntry] (
    [RecdNo] INT NOT NULL,
    [Trans_Date] DATETIME NOT NULL,
    [Sno] INT NOT NULL,
    [EmpNo] VARCHAR(50) NOT NULL,
    [StartTime] VARCHAR(50),
    [EndTime] VARCHAR(50),
    [OverTime] VARCHAR(50),
    [Halfday] DECIMAL(18,1),
    [BasicSalary] DECIMAL(16,3),
    [OTSalary] DECIMAL(16,3),
    [TotalSalary] DECIMAL(16,3),
    [PaidStatus] VARCHAR(20),
    [BranchName] VARCHAR(50) NOT NULL,
    [AccType] VARCHAR(50) NOT NULL,
    CONSTRAINT [PK_AttendanceEntry] PRIMARY KEY CLUSTERED ([Trans_Date],[Sno],[EmpNo],[BranchName],[AccType])
);

-- CreateTable
CREATE TABLE [dbo].[barcodedetails] (
    [Columns] INT,
    [SNo] INT,
    [FormName] VARCHAR(50),
    [Description] VARCHAR(250),
    [Fieldsname] VARCHAR(50),
    [Conversion] VARCHAR(10),
    [Count] VARCHAR(5)
);

-- CreateTable
CREATE TABLE [dbo].[barcodefooter] (
    [Sno] INT,
    [FormName] VARCHAR(50),
    [Description] VARCHAR(250)
);

-- CreateTable
CREATE TABLE [dbo].[barcodeheader] (
    [Columns] INT,
    [FormName] VARCHAR(50),
    [Sno] INT,
    [Description] VARCHAR(250)
);

-- CreateTable
CREATE TABLE [dbo].[bartemp] (
    [ItemCode] VARCHAR(50),
    [Num] VARCHAR(5),
    [System] VARCHAR(50),
    [BestB] VARCHAR(5)
);

-- CreateTable
CREATE TABLE [dbo].[Batchwisestock] (
    [BatchStock] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[billcollection] (
    [Trans_Type] VARCHAR(20) NOT NULL,
    [CounterName] VARCHAR(25) NOT NULL,
    [BillNo] BIGINT NOT NULL CONSTRAINT [DF__billcolle__BillN__25869641] DEFAULT 0,
    [Trans_Date] DATETIME,
    [Customer] BIGINT,
    [WaiterName] VARCHAR(50),
    [BillAmount] DECIMAL(19,4) CONSTRAINT [DF__billcolle__BillA__267ABA7A] DEFAULT 0.0000,
    [Received] DECIMAL(19,4) CONSTRAINT [DF__billcolle__Recei__276EDEB3] DEFAULT 0.0000,
    [Balance] DECIMAL(19,4) CONSTRAINT [DF__billcolle__Balan__286302EC] DEFAULT 0.0000,
    [PaymentStatus] VARCHAR(8) CONSTRAINT [DF__billcolle__Payme__29572725] DEFAULT 'UnPaid',
    [Login] VARCHAR(15),
    [LoginName] VARCHAR(25),
    [Onlinestatus] VARCHAR(25),
    [AccType] VARCHAR(15) NOT NULL,
    [BranchName] VARCHAR(50) NOT NULL CONSTRAINT [DF__billcolle__Branc__2A4B4B5E] DEFAULT '',
    CONSTRAINT [PK__billcoll__CD6C848822DD55DF] PRIMARY KEY CLUSTERED ([Trans_Type],[CounterName],[BillNo],[AccType],[BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[billingcounter] (
    [CounterName] VARCHAR(25) NOT NULL CONSTRAINT [DF__billingco__Count__2D27B809] DEFAULT 'ShowRoom',
    [Login] VARCHAR(25),
    [LoginName] VARCHAR(50) CONSTRAINT [DF__billingco__Login__2E1BDC42] DEFAULT 'Admin',
    [Suffix] VARCHAR(25),
    [ActiveStatus] VARCHAR(3) CONSTRAINT [DF__billingco__Activ__2F10007B] DEFAULT 'Yes',
    CONSTRAINT [PK__billingc__CAA72873A8151A7A] PRIMARY KEY CLUSTERED ([CounterName])
);

-- CreateTable
CREATE TABLE [dbo].[BillType] (
    [Bill_Type] VARCHAR(25) NOT NULL,
    [AccountName] VARCHAR(50),
    [ServiceCharge] FLOAT(53),
    CONSTRAINT [PK__BillType__DA152C4F40AAB371] PRIMARY KEY CLUSTERED ([Bill_Type])
);

-- CreateTable
CREATE TABLE [dbo].[branchmaster] (
    [BranchName] VARCHAR(50) NOT NULL,
    [Dealer] VARCHAR(50),
    [Address] VARCHAR(50),
    [Address1] VARCHAR(50),
    [Address2] VARCHAR(50),
    [City] VARCHAR(50),
    [PhNo] VARCHAR(12),
    [MblNo] VARCHAR(15),
    [TinNo] VARCHAR(16),
    [PostalCode] VARCHAR(10),
    [StateCode] VARCHAR(5),
    [SMSNo] VARCHAR(55),
    [Iac] VARCHAR(15),
    [Email] VARCHAR(50),
    [WebSite] VARCHAR(50),
    [BarCode] VARCHAR(25),
    [State] VARCHAR(50),
    [BAcctName] VARCHAR(50),
    [BAcctNo] VARCHAR(50),
    [BBranchName] VARCHAR(50),
    [BIfcsCode] VARCHAR(50),
    [ComLogo] IMAGE,
    [ComSign] IMAGE,
    [Suffix] VARCHAR(15),
    CONSTRAINT [PK_branchmaster] PRIMARY KEY CLUSTERED ([BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[branchtransfer] (
    [TransType] VARCHAR(25) NOT NULL,
    [BillNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [Trans_Time] VARCHAR(15),
    [Customer] BIGINT CONSTRAINT [DF__branchtra__Custo__40C49C62] DEFAULT 0,
    [Sno] INT NOT NULL,
    [ItemCode] BIGINT CONSTRAINT [DF__branchtra__ItemC__41B8C09B] DEFAULT 0,
    [Qty] FLOAT(53),
    [Units] VARCHAR(10),
    [UnitPer] FLOAT(53) CONSTRAINT [DF__branchtra__UnitP__42ACE4D4] DEFAULT 0,
    [BQty] FLOAT(53) CONSTRAINT [DF__branchtran__BQty__43A1090D] DEFAULT 0,
    [Rate] DECIMAL(19,4) CONSTRAINT [DF__branchtran__Rate__44952D46] DEFAULT 0.0000,
    [SRate] DECIMAL(19,4) CONSTRAINT [DF__branchtra__SRate__4589517F] DEFAULT 0.0000,
    [LC] DECIMAL(19,4),
    [Amount] DECIMAL(19,4) CONSTRAINT [DF__branchtra__Amoun__467D75B8] DEFAULT 0.0000,
    [Discount] FLOAT(53) CONSTRAINT [DF__branchtra__Disco__477199F1] DEFAULT 0,
    [DisAmt] VARCHAR(50),
    [Tax] FLOAT(53) CONSTRAINT [DF__branchtrans__Tax__4865BE2A] DEFAULT 0,
    [PackingCharges] DECIMAL(19,4) CONSTRAINT [DF__branchtra__Packi__4959E263] DEFAULT 0.0000,
    [Labor] DECIMAL(19,4) CONSTRAINT [DF__branchtra__Labor__4A4E069C] DEFAULT 0.0000,
    [Convenience] DECIMAL(19,4) CONSTRAINT [DF__branchtra__Conve__4B422AD5] DEFAULT 0.0000,
    [RoundOff] DECIMAL(19,4),
    [LoginName] VARCHAR(25),
    [WaiterName] VARCHAR(50),
    [Delivery] VARCHAR(50),
    [EditMode] VARCHAR(3) CONSTRAINT [DF__branchtra__EditM__4C364F0E] DEFAULT 'No',
    [System] VARCHAR(25),
    [Color] VARCHAR(50),
    [AccType] VARCHAR(2) NOT NULL,
    [Location] VARCHAR(50),
    CONSTRAINT [PK__branchtr__167144EC7B04D3DD] PRIMARY KEY CLUSTERED ([TransType],[BillNo],[Sno],[AccType])
);

-- CreateTable
CREATE TABLE [dbo].[CaptanMaster] (
    [CaptanName] VARCHAR(50) NOT NULL,
    [ContactNo] VARCHAR(50),
    [Address] VARCHAR(50),
    [City] VARCHAR(25),
    [ActiveStatus] VARCHAR(15) CONSTRAINT [DF__CaptanMas__Activ__37A5467C] DEFAULT 'Active',
    [Imgphoto] VARCHAR(50),
    [AccountName] VARCHAR(25),
    [LoginName] VARCHAR(50) CONSTRAINT [DF__CaptanMas__Login__38996AB5] DEFAULT 'Administrator',
    CONSTRAINT [PK__CaptanMa__24A1AC3584707F9F] PRIMARY KEY CLUSTERED ([CaptanName])
);

-- CreateTable
CREATE TABLE [dbo].[Cashdenomination] (
    [Trans_Date] DATETIME,
    [BranchName] VARCHAR(50) NOT NULL CONSTRAINT [DF__Cashdenom__Branc__4D2A7347] DEFAULT '',
    [Trans_No] INT NOT NULL CONSTRAINT [DF__Cashdenom__Trans__4E1E9780] DEFAULT 0,
    [SNo] INT NOT NULL CONSTRAINT [DF__Cashdenomin__SNo__4F12BBB9] DEFAULT 0,
    [Trans_Time] DATETIME,
    [CurrencyValue] VARCHAR(50),
    [Qty] VARCHAR(25),
    [Amount] VARCHAR(25),
    [LockStatus] VARCHAR(10) CONSTRAINT [DF__Cashdenom__LockS__5006DFF2] DEFAULT 'Unlock',
    [LoginName] VARCHAR(50),
    [HandOver] VARCHAR(50),
    [TakeOver] VARCHAR(50),
    CONSTRAINT [PK__Cashdeno__A4F99989B44D8B17] PRIMARY KEY CLUSTERED ([Trans_No],[SNo],[BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[categorymaster] (
    [Category] VARCHAR(25) NOT NULL,
    [Comm_Code] VARCHAR(25),
    [Tax] FLOAT(53) CONSTRAINT [DF__categorymas__Tax__3D5E1FD2] DEFAULT 0,
    [Sgst] FLOAT(53) CONSTRAINT [DF__categoryma__Sgst__3E52440B] DEFAULT 0,
    [Cgst] FLOAT(53) CONSTRAINT [DF__categoryma__Cgst__3F466844] DEFAULT 0,
    [Login] VARCHAR(50) CONSTRAINT [DF__categorym__Login__403A8C7D] DEFAULT 'Admin',
    [LoginName] VARCHAR(50) CONSTRAINT [DF__categorym__Login__412EB0B6] DEFAULT 'Admin',
    CONSTRAINT [PK_Categorymaster] PRIMARY KEY CLUSTERED ([Category])
);

-- CreateTable
CREATE TABLE [dbo].[closingstock] (
    [ItemCode] BIGINT,
    [OQty] FLOAT(53) CONSTRAINT [DF__closingsto__OQty__50FB042B] DEFAULT 0,
    [PQty] FLOAT(53) CONSTRAINT [DF__closingsto__PQty__51EF2864] DEFAULT 0,
    [PRQty] FLOAT(53) CONSTRAINT [DF__closingst__PRQty__52E34C9D] DEFAULT 0,
    [SQty] FLOAT(53) CONSTRAINT [DF__closingsto__SQty__53D770D6] DEFAULT 0,
    [Free] FLOAT(53) CONSTRAINT [DF__closingsto__Free__54CB950F] DEFAULT 0,
    [SRQty] FLOAT(53) CONSTRAINT [DF__closingst__SRQty__55BFB948] DEFAULT 0,
    [LTQty] FLOAT(53) CONSTRAINT [DF__closingst__LTQty__56B3DD81] DEFAULT 0,
    [SCQty] FLOAT(53) CONSTRAINT [DF__closingst__SCQty__57A801BA] DEFAULT 0,
    [PMQty] FLOAT(53) CONSTRAINT [DF__closingst__PMQty__589C25F3] DEFAULT 0,
    [STQty] FLOAT(53) CONSTRAINT [DF__closingst__STQty__59904A2C] DEFAULT 0,
    [SIQty] FLOAT(53) CONSTRAINT [DF__closingst__SIQty__5A846E65] DEFAULT 0,
    [OLC] DECIMAL(19,4) CONSTRAINT [DF__closingstoc__OLC__5B78929E] DEFAULT 0,
    [CLC] DECIMAL(19,4) CONSTRAINT [DF__closingstoc__CLC__5C6CB6D7] DEFAULT 0,
    [ClosingStock] FLOAT(53) CONSTRAINT [DF__closingst__Closi__5D60DB10] DEFAULT 0,
    [LC] DECIMAL(19,4),
    [System] VARCHAR(50),
    [BranchName] VARCHAR(50),
    [Location] VARCHAR(50),
    [Disper] VARCHAR(50),
    [BatchNo] VARCHAR(50),
    [MRP] DECIMAL(16,2) CONSTRAINT [DF__closingstoc__MRP__5E54FF49] DEFAULT 0.00,
    [UnitPer] INT CONSTRAINT [DF__closingst__UnitP__5F492382] DEFAULT 1,
    [ClosingAmount] DECIMAL(16,2) CONSTRAINT [DF__closingst__Closi__603D47BB] DEFAULT 0.00
);

-- CreateTable
CREATE TABLE [dbo].[columnsettings] (
    [FormName] VARCHAR(20) NOT NULL,
    [Col] INT NOT NULL CONSTRAINT [DF__columnsetti__Col__61316BF4] DEFAULT 0,
    [Width] INT CONSTRAINT [DF__columnset__Width__6225902D] DEFAULT 0,
    [SystemName] VARCHAR(25),
    CONSTRAINT [PK__columnse__8DA86C9BB7AD1B28] PRIMARY KEY CLUSTERED ([FormName],[Col])
);

-- CreateTable
CREATE TABLE [dbo].[Company] (
    [CompanyName] VARCHAR(50) NOT NULL,
    [BusinessType] VARCHAR(60),
    [Address] VARCHAR(50),
    [Address1] VARCHAR(50),
    [City] VARCHAR(25),
    [State] VARCHAR(25),
    [Country] VARCHAR(25),
    [PostalCode] VARCHAR(25),
    [StateCode] VARCHAR(25),
    [Tngst] VARCHAR(25),
    [SMSNo] VARCHAR(55),
    [Iac] VARCHAR(25),
    [PhoneNo] VARCHAR(50),
    [MblNo] VARCHAR(15),
    [FaxNo] VARCHAR(50),
    [PassWord] VARCHAR(25),
    [Email] VARCHAR(100),
    [WebSite] VARCHAR(100),
    [BAcctName] VARCHAR(50),
    [BAcctNo] VARCHAR(50),
    [BBranchName] VARCHAR(50),
    [BIfcsCode] VARCHAR(50),
    [StartDate] DATETIME,
    [PassWordd] VARCHAR(25),
    [EndDate] DATETIME,
    [BarCode] VARCHAR(25),
    [ComLogo] IMAGE,
    [ComSign] IMAGE,
    [Dealer] VARCHAR(50),
    [ImgPhoto] VARCHAR(255),
    [DBName] VARCHAR(60),
    [BillOptn] VARCHAR(50),
    [salesper] INT CONSTRAINT [DF__Company__salespe__46E78A0C] DEFAULT 0,
    [BatchStock] VARCHAR(15),
    [FormTime] INT CONSTRAINT [DF__Company__FormTim__47DBAE45] DEFAULT 0,
    [Autoroundoff] VARCHAR(6) CONSTRAINT [DF__Company__Autorou__48CFD27E] DEFAULT 'true',
    [PrintSplMsg] VARCHAR(6) CONSTRAINT [DF__Company__PrintSp__49C3F6B7] DEFAULT 'true',
    [QtyDecimal] DECIMAL(19,3) CONSTRAINT [DF__Company__QtyDeci__4AB81AF0] DEFAULT 0,
    [RateDecimal] DECIMAL(19,3) CONSTRAINT [DF__Company__RateDec__4BAC3F29] DEFAULT 0,
    CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED ([CompanyName])
);

-- CreateTable
CREATE TABLE [dbo].[CompanyCheck] (
    [SysName] VARCHAR(50) NOT NULL,
    CONSTRAINT [PK_CompanyCheck] PRIMARY KEY CLUSTERED ([SysName])
);

-- CreateTable
CREATE TABLE [dbo].[costmaintanance] (
    [Trans_Date] DATETIME,
    [ItemCode] BIGINT CONSTRAINT [DF__costmaint__ItemC__6319B466] DEFAULT 0,
    [Cost] DECIMAL(19,4) CONSTRAINT [DF__costmainta__Cost__640DD89F] DEFAULT 0.0000
);

-- CreateTable
CREATE TABLE [dbo].[Costmaster] (
    [ItemCode] BIGINT,
    [Trans_Date] DATETIME,
    [LC] DECIMAL(19,4),
    [System] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[Costmaster1] (
    [ItemCode] INT,
    [Trans_Date] DATETIME,
    [LC] DECIMAL(19,4),
    [System] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[CreditNotes] (
    [Trans_Type] VARCHAR(50),
    [Trans_No] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [InvoiceNo] VARCHAR(25),
    [InvoiceDate] DATETIME,
    [CustomerType] VARCHAR(50),
    [DocumentType] VARCHAR(50),
    [Customer] BIGINT,
    [NoteType] VARCHAR(50),
    [SNo] BIGINT NOT NULL,
    [BillAmount] DECIMAL(16,2),
    [Gst] FLOAT(53),
    [Cess] FLOAT(53),
    [Sgst] FLOAT(53),
    [Cgst] FLOAT(53),
    [Igst] FLOAT(53),
    [SgstAmt] DECIMAL(16,2),
    [CgstAmt] DECIMAL(16,2),
    [IgstAmt] DECIMAL(16,2),
    [CessAmt] DECIMAL(16,2),
    [CreditAccount] VARCHAR(50),
    [DebitAccount] VARCHAR(50),
    [CounterName] VARCHAR(25) NOT NULL,
    [BranchName] VARCHAR(50) NOT NULL,
    [AccType] VARCHAR(3) NOT NULL,
    [InvoiceStatus] VARCHAR(50),
    [Amount] DECIMAL(16,2),
    [SalNo] VARCHAR(50),
    [RevdIssNo] VARCHAR(50),
    [Memo] VARCHAR(250),
    [RoundOff] DECIMAL(16,4) CONSTRAINT [DF__CreditNot__Round__6501FCD8] DEFAULT 0,
    CONSTRAINT [PK_CreditNotes] PRIMARY KEY CLUSTERED ([Trans_No],[SNo],[BranchName],[CounterName],[AccType])
);

-- CreateTable
CREATE TABLE [dbo].[customermaster] (
    [Customer] BIGINT NOT NULL,
    [CustomerName] VARCHAR(50),
    [Address] VARCHAR(75),
    [Address1] VARCHAR(75),
    [City] VARCHAR(50),
    [State] VARCHAR(50),
    [Postal] VARCHAR(20),
    [Country] VARCHAR(25),
    [ContactPerson] VARCHAR(50),
    [Phone] VARCHAR(25),
    [Mobile] VARCHAR(25),
    [Terms] INT,
    [Limit] DECIMAL(19,4),
    [ImgPhoto] IMAGE,
    [Fax] VARCHAR(20),
    [EMail] VARCHAR(50),
    [Login] VARCHAR(25),
    [LoginName] VARCHAR(25),
    [ActiveStatus] VARCHAR(15),
    [AccountName] VARCHAR(50),
    [TINNo] VARCHAR(25),
    [CST] VARCHAR(25),
    [IAC] VARCHAR(25),
    [Area] VARCHAR(25),
    [RateType] VARCHAR(15) CONSTRAINT [DF__customerm__RateT__5535A963] DEFAULT 'Maximum',
    [Web] VARCHAR(50),
    [DOB] DATETIME,
    [DOW] DATETIME,
    [DeliveryName] VARCHAR(50),
    [DeliveryAddress] VARCHAR(50),
    [DeliveryAddress1] VARCHAR(50),
    [DeliveryCity] VARCHAR(50),
    [InvoiceType] VARCHAR(50) CONSTRAINT [DF__customerm__Invoi__5629CD9C] DEFAULT 'F',
    [DiscountStatus] VARCHAR(25),
    [CustomerType] VARCHAR(25) CONSTRAINT [DF__customerm__Custo__571DF1D5] DEFAULT 'Customer',
    [Com_Person] VARCHAR(50),
    [TaxType] VARCHAR(15) CONSTRAINT [DF__customerm__TaxTy__5812160E] DEFAULT 'Full Tax',
    [PanNo] VARCHAR(50),
    [AdharNo] VARCHAR(50),
    [DState] VARCHAR(50),
    [DStateCode] VARCHAR(50),
    [StateCode] VARCHAR(50),
    [EcommNo] VARCHAR(25),
    [DCExpdays] INT,
    [Address2] VARCHAR(50),
    [DeliveryAddress2] VARCHAR(50),
    [DPin] VARCHAR(8),
    [DGSTNo] VARCHAR(25),
    [BankName] VARCHAR(50),
    [BBranchName] VARCHAR(50),
    [WhatsApp] VARCHAR(25),
    [TCS] FLOAT(53) CONSTRAINT [DF__customermas__TCS__59063A47] DEFAULT 0,
    CONSTRAINT [PK__customer__EC6FA1A1ADA93FD3] PRIMARY KEY CLUSTERED ([Customer])
);

-- CreateTable
CREATE TABLE [dbo].[DebitNotes] (
    [Trans_Type] VARCHAR(10),
    [Trans_No] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [InvoiceNo] VARCHAR(25),
    [InvoiceDate] DATETIME,
    [CustomerType] VARCHAR(25),
    [DocumentType] VARCHAR(50),
    [Vendor] INT,
    [NoteType] VARCHAR(25),
    [SNo] BIGINT NOT NULL,
    [BillAmount] MONEY CONSTRAINT [DF__DebitNote__BillA__65F62111] DEFAULT 0,
    [Gst] FLOAT(53),
    [Cess] FLOAT(53),
    [Sgst] FLOAT(53),
    [Cgst] FLOAT(53),
    [Igst] FLOAT(53),
    [SgstAmt] MONEY CONSTRAINT [DF__DebitNote__SgstA__66EA454A] DEFAULT 0,
    [CgstAmt] MONEY CONSTRAINT [DF__DebitNote__CgstA__67DE6983] DEFAULT 0,
    [IgstAmt] MONEY CONSTRAINT [DF__DebitNote__IgstA__68D28DBC] DEFAULT 0,
    [CessAmt] MONEY CONSTRAINT [DF__DebitNote__CessA__69C6B1F5] DEFAULT 0,
    [CreditAccount] VARCHAR(50),
    [DebitAccount] VARCHAR(50),
    [BranchName] VARCHAR(50) NOT NULL,
    [CounterName] VARCHAR(25) NOT NULL,
    [AccType] VARCHAR(3) NOT NULL,
    [DebitNo] VARCHAR(50),
    [InvoiceStatus] VARCHAR(50),
    [Amount] MONEY CONSTRAINT [DF__DebitNote__Amoun__6ABAD62E] DEFAULT 0,
    [RoundOff] MONEY CONSTRAINT [DF__DebitNote__Round__6BAEFA67] DEFAULT 0,
    [SalNo] VARCHAR(25),
    [RevdIssNo] VARCHAR(25),
    [Memo] VARCHAR(250),
    CONSTRAINT [DebitNotes_pk] PRIMARY KEY CLUSTERED ([Trans_No],[SNo],[BranchName],[CounterName],[AccType])
);

-- CreateTable
CREATE TABLE [dbo].[defaultvalues] (
    [FormName] VARCHAR(50) NOT NULL,
    [ControlName] VARCHAR(50) NOT NULL,
    [val] VARCHAR(50),
    [SysNamee] VARCHAR(50) NOT NULL,
    [AccType] VARCHAR(50) NOT NULL CONSTRAINT [DF__defaultva__AccTy__5DCAEF64] DEFAULT '~',
    CONSTRAINT [PK__defaultv__C94771AD5D485714] PRIMARY KEY CLUSTERED ([FormName],[ControlName],[SysNamee],[AccType])
);

-- CreateTable
CREATE TABLE [dbo].[deleterecord] (
    [Trans_Type] VARCHAR(20),
    [Trans_Date] DATETIME,
    [Trans_Time] DATETIME,
    [BillNo] BIGINT,
    [Amount] DECIMAL(19,4),
    [LoginName] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[Deletesales] (
    [Trans_Type] VARCHAR(25),
    [CounterName] VARCHAR(25) NOT NULL,
    [BillNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [Trans_Time] VARCHAR(10),
    [Bill_Type] VARCHAR(10),
    [Customer] BIGINT,
    [Sno] INT NOT NULL,
    [ItemCode] BIGINT,
    [Qty] FLOAT(53),
    [Units] VARCHAR(10),
    [UPer] FLOAT(53),
    [SQty] FLOAT(53),
    [Rate] DECIMAL(19,4),
    [SRate] DECIMAL(19,4),
    [LC] DECIMAL(19,4),
    [Amount] DECIMAL(19,4),
    [Discount] FLOAT(53),
    [DisAmt] MONEY,
    [Tax] FLOAT(53),
    [VatAmt] DECIMAL(19,4),
    [PackingCharges] DECIMAL(19,4),
    [RoundOff] DECIMAL(19,4),
    [Labor] DECIMAL(19,4),
    [Convenience] DECIMAL(19,4),
    [Login] VARCHAR(25),
    [EditMode] VARCHAR(25),
    [LoginName] VARCHAR(25),
    [AccountName] VARCHAR(50),
    [WaiterName] VARCHAR(50),
    [CaptanName] VARCHAR(50),
    [Delivery] VARCHAR(50),
    [ComPerson] VARCHAR(50),
    [InvoiceType] VARCHAR(2),
    [Rate_Type] VARCHAR(20),
    [DCNo] INT,
    [EstNo] VARCHAR(15),
    [ComPer] FLOAT(53),
    [ComRs] DECIMAL(19,4),
    [System] VARCHAR(25),
    [Color] VARCHAR(50),
    [AccType] VARCHAR(20) NOT NULL,
    [Location] VARCHAR(50),
    [MRP] DECIMAL(19,4),
    [Documents] VARCHAR(100),
    [NoOfQty] VARCHAR(20),
    [BranchName] VARCHAR(50) NOT NULL,
    [AQty] FLOAT(53),
    [SMPer] DECIMAL(16,3),
    [SRPer] DECIMAL(16,3),
    [BillDis] DECIMAL(16,3),
    [BillDisAmt] DECIMAL(16,2),
    [GSPrint] VARCHAR(4),
    [salesno] VARCHAR(50),
    [Onlinestatus] VARCHAR(25),
    [S.P] DECIMAL(16,2),
    [PONum] VARCHAR(50),
    [ServiceChrg] FLOAT(53),
    [SalOrdNo] BIGINT,
    [BatchNo] VARCHAR(25),
    [SerChrgper] FLOAT(53),
    [Psupply] VARCHAR(50),
    [QtyDis] DECIMAL(16,4),
    [QtyDisAmt] DECIMAL(16,4),
    [Sgst] FLOAT(53),
    [Cgst] FLOAT(53),
    [Igst] FLOAT(53),
    [SgstAmt] DECIMAL(16,4),
    [CgstAmt] DECIMAL(16,4),
    [IgstAmt] DECIMAL(16,4),
    [FormName] VARCHAR(50),
    [DeleteDate] DATETIME,
    [Deletetime] VARCHAR(50),
    [TaxStatus] VARCHAR(15),
    [CessP] DECIMAL(19,4) CONSTRAINT [DF__Deletesal__CessP__6CA31EA0] DEFAULT 0.00,
    [CessAmt] DECIMAL(19,3) CONSTRAINT [DF__Deletesal__CessA__6D9742D9] DEFAULT 0.00,
    [Free] FLOAT(53) CONSTRAINT [DF__Deletesale__Free__6E8B6712] DEFAULT 0
);

-- CreateTable
CREATE TABLE [dbo].[DeliveryAddress] (
    [CounterName] VARCHAR(25) NOT NULL,
    [BillNo] BIGINT NOT NULL,
    [DeliveryName] VARCHAR(50),
    [DeliveryAddress] VARCHAR(75),
    [DeliveryAddress1] VARCHAR(75),
    [DeliveryCity] VARCHAR(50),
    [DState] VARCHAR(50),
    [DStateCode] VARCHAR(10),
    [AccType] VARCHAR(20) NOT NULL,
    CONSTRAINT [PK__Delivery__4B317DC1D39A9425] PRIMARY KEY CLUSTERED ([CounterName],[BillNo],[AccType])
);

-- CreateTable
CREATE TABLE [dbo].[deliverychelan] (
    [Trans_Type] VARCHAR(25) NOT NULL,
    [BillNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [Customer] BIGINT CONSTRAINT [DF__deliveryc__Custo__6F7F8B4B] DEFAULT 0,
    [Sno] INT NOT NULL,
    [ItemCode] BIGINT CONSTRAINT [DF__deliveryc__ItemC__7073AF84] DEFAULT 0,
    [Qty] FLOAT(53),
    [Units] VARCHAR(10),
    [UnitPer] FLOAT(53) CONSTRAINT [DF__deliveryc__UnitP__7167D3BD] DEFAULT 0,
    [DQty] FLOAT(53) CONSTRAINT [DF__deliverych__DQty__725BF7F6] DEFAULT 0,
    [SQty] FLOAT(53) CONSTRAINT [DF__deliverych__SQty__73501C2F] DEFAULT 0,
    [RemQty] FLOAT(53) CONSTRAINT [DF__deliveryc__RemQt__74444068] DEFAULT 0,
    [Rate] DECIMAL(19,4) CONSTRAINT [DF__deliverych__Rate__753864A1] DEFAULT 0.0000,
    [SRate] DECIMAL(19,4) CONSTRAINT [DF__deliveryc__SRate__762C88DA] DEFAULT 0.0000,
    [LC] DECIMAL(19,4),
    [Amount] DECIMAL(19,4) CONSTRAINT [DF__deliveryc__Amoun__7720AD13] DEFAULT 0.0000,
    [Discount] FLOAT(53) CONSTRAINT [DF__deliveryc__Disco__7814D14C] DEFAULT 0,
    [DisAmt] DECIMAL(16,4),
    [Tax] FLOAT(53) CONSTRAINT [DF__deliveryche__Tax__7908F585] DEFAULT 0,
    [AQty] DECIMAL(16,3),
    [SMPer] DECIMAL(16,3),
    [SRPer] DECIMAL(16,3),
    [NoOfQty] VARCHAR(20),
    [Labor] DECIMAL(19,4) CONSTRAINT [DF__deliveryc__Labor__79FD19BE] DEFAULT 0.0000,
    [Convenience] DECIMAL(19,4) CONSTRAINT [DF__deliveryc__Conve__7AF13DF7] DEFAULT 0.0000,
    [RoundOff] DECIMAL(19,4),
    [Login] VARCHAR(15),
    [LoginName] VARCHAR(25),
    [Waiter] VARCHAR(50),
    [CaptanName] VARCHAR(50),
    [Delivery] VARCHAR(50),
    [Documents] VARCHAR(50),
    [ComPerson] VARCHAR(50),
    [ComPer] FLOAT(53),
    [ComRs] DECIMAL(19,4),
    [System] VARCHAR(25),
    [Color] VARCHAR(50),
    [Status] VARCHAR(8) CONSTRAINT [DF__deliveryc__Statu__7BE56230] DEFAULT 'DC',
    [AccType] VARCHAR(20) NOT NULL,
    [Location] VARCHAR(50),
    [BranchName] VARCHAR(50) NOT NULL CONSTRAINT [DF__deliveryc__Branc__7CD98669] DEFAULT '',
    [MRP] DECIMAL(16,2) CONSTRAINT [DF__deliveryche__MRP__7DCDAAA2] DEFAULT 0.00,
    [InvoiceNo] VARCHAR(25),
    [PONo] VARCHAR(25),
    [BatchNo] VARCHAR(25),
    [TransportName] VARCHAR(50),
    [VehicleNo] VARCHAR(50),
    [DDate] DATETIME,
    [DLocation] VARCHAR(50),
    [Trans_Time] VARCHAR(10),
    [ImportStatus] VARCHAR(25) CONSTRAINT [DF__deliveryc__Impor__7EC1CEDB] DEFAULT 'Nil',
    [SOrderNo] BIGINT,
    [PurNo] BIGINT,
    [TaxStatus] VARCHAR(15),
    CONSTRAINT [PK__delivery__FDE9979113851CF4] PRIMARY KEY CLUSTERED ([BillNo],[Sno],[AccType],[BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[DiscountMaster] (
    [ItemCode] BIGINT NOT NULL,
    [SNo] INT NOT NULL,
    [Qty] INT NOT NULL,
    [Discount] FLOAT(53),
    CONSTRAINT [PK__Discount__E26DE1EFFA244B2F] PRIMARY KEY CLUSTERED ([ItemCode],[SNo])
);

-- CreateTable
CREATE TABLE [dbo].[editrecord] (
    [Trans_Type] VARCHAR(20),
    [Trans_Date] DATETIME,
    [Trans_Time] DATETIME,
    [BillNo] BIGINT,
    [Amount] DECIMAL(19,4),
    [LoginName] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[Editsales] (
    [Trans_Type] VARCHAR(25),
    [CounterName] VARCHAR(25) NOT NULL,
    [BillNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [Trans_Time] VARCHAR(10),
    [Bill_Type] VARCHAR(10),
    [Customer] BIGINT,
    [Sno] INT NOT NULL,
    [ItemCode] BIGINT,
    [Qty] FLOAT(53),
    [Units] VARCHAR(10),
    [UPer] FLOAT(53),
    [SQty] FLOAT(53),
    [Rate] DECIMAL(19,4),
    [SRate] DECIMAL(19,4),
    [LC] DECIMAL(19,4),
    [Amount] DECIMAL(19,4),
    [Discount] FLOAT(53),
    [DisAmt] MONEY,
    [Tax] FLOAT(53),
    [VatAmt] DECIMAL(19,4),
    [PackingCharges] DECIMAL(19,4),
    [RoundOff] DECIMAL(19,4),
    [Labor] DECIMAL(19,4),
    [Convenience] DECIMAL(19,4),
    [Login] VARCHAR(25),
    [EditMode] VARCHAR(25),
    [LoginName] VARCHAR(25),
    [AccountName] VARCHAR(50),
    [Waiter] VARCHAR(50),
    [CaptanName] VARCHAR(50),
    [Delivery] VARCHAR(50),
    [ComPerson] VARCHAR(50),
    [InvoiceType] VARCHAR(2),
    [Rate_Type] VARCHAR(20),
    [DCNo] INT,
    [EstNo] VARCHAR(15),
    [ComPer] FLOAT(53),
    [ComRs] DECIMAL(19,4),
    [System] VARCHAR(25),
    [Color] VARCHAR(50),
    [AccType] VARCHAR(20) NOT NULL,
    [Location] VARCHAR(50),
    [MRP] DECIMAL(19,4),
    [Documents] VARCHAR(100),
    [NoOfQty] VARCHAR(20),
    [BranchName] VARCHAR(50) NOT NULL,
    [AQty] FLOAT(53),
    [SMPer] DECIMAL(16,3),
    [SRPer] DECIMAL(16,3),
    [BillDis] DECIMAL(16,3),
    [BillDisAmt] DECIMAL(16,2),
    [GSPrint] VARCHAR(4),
    [salesno] VARCHAR(50),
    [Onlinestatus] VARCHAR(25),
    [S.P] DECIMAL(16,2),
    [PONum] VARCHAR(50),
    [ServiceChrg] FLOAT(53),
    [SalOrdNo] BIGINT,
    [BatchNo] VARCHAR(25),
    [SerChrgper] FLOAT(53),
    [Psupply] VARCHAR(50),
    [QtyDis] DECIMAL(16,4),
    [QtyDisAmt] DECIMAL(16,4),
    [Sgst] FLOAT(53),
    [Cgst] FLOAT(53),
    [Igst] FLOAT(53),
    [SgstAmt] DECIMAL(16,4),
    [CgstAmt] DECIMAL(16,4),
    [IgstAmt] DECIMAL(16,4),
    [FormName] VARCHAR(50),
    [EditDate] DATETIME,
    [Edittime] VARCHAR(50),
    [TaxStatus] VARCHAR(15),
    [CessP] DECIMAL(19,4) CONSTRAINT [DF__Editsales__CessP__7FB5F314] DEFAULT 0.00,
    [CessAmt] DECIMAL(19,3) CONSTRAINT [DF__Editsales__CessA__00AA174D] DEFAULT 0.00,
    [Free] FLOAT(53) CONSTRAINT [DF__Editsales__Free__019E3B86] DEFAULT 0
);

-- CreateTable
CREATE TABLE [dbo].[EmployeeMaster] (
    [EmpNo] VARCHAR(25) NOT NULL,
    [EmpName] VARCHAR(50) NOT NULL,
    [Address] VARCHAR(50),
    [Address1] VARCHAR(50),
    [City] VARCHAR(50),
    [PinCode] VARCHAR(25),
    [Mobile] VARCHAR(25),
    [DOB] DATETIME,
    [ContactPerson] VARCHAR(50),
    [CPMobile] VARCHAR(25),
    [DOJ] DATETIME,
    [ImgPhoto] IMAGE,
    [Designation] VARCHAR(50),
    [BasicSalary] DECIMAL(16,3) NOT NULL,
    [LeaveSalary] DECIMAL(16,3),
    [Bonus] DECIMAL(16,3),
    [OTSalary] DECIMAL(16,3),
    [AccountName] VARCHAR(50),
    [WorkingStatus] VARCHAR(15),
    [BranchName] VARCHAR(50),
    [PF] DECIMAL(16,3),
    CONSTRAINT [PK__Employee__AF2D66D37998DCDF] PRIMARY KEY CLUSTERED ([EmpNo])
);

-- CreateTable
CREATE TABLE [dbo].[Esales] (
    [Trans_Type] VARCHAR(50),
    [BranchName] VARCHAR(50) NOT NULL,
    [BillNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [Customer] INT,
    [ComPerson] VARCHAR(50),
    [ServiceType] VARCHAR(50) NOT NULL,
    [Sno] INT NOT NULL,
    [Itemcode] BIGINT,
    [Qty] FLOAT(53),
    [Units] VARCHAR(16),
    [Rate] DECIMAL(19,3),
    [Amount] DECIMAL(19,3),
    [DisCount] DECIMAL(19,3),
    [Advance] DECIMAL(19,3),
    [ToPay] DECIMAL(19,3),
    [Paid] DECIMAL(19,3),
    [LoginName] VARCHAR(50),
    [Remarks] VARCHAR(250),
    [DeliveryStatus] VARCHAR(50),
    [AccType] VARCHAR(50) NOT NULL,
    [PersonCheck] VARCHAR(50),
    [EstDate] DATETIME,
    [MDesc] VARCHAR(200),
    CONSTRAINT [PK_ESales] PRIMARY KEY CLUSTERED ([BranchName],[BillNo],[ServiceType],[Sno],[AccType])
);

-- CreateTable
CREATE TABLE [dbo].[fieldssetting] (
    [ReportName] VARCHAR(100) NOT NULL CONSTRAINT [DF__fieldsset__Repor__6E01572D] DEFAULT '',
    [Sno] DECIMAL(16,2) NOT NULL CONSTRAINT [DF__fieldssetti__Sno__6EF57B66] DEFAULT 0,
    [TableName] VARCHAR(100),
    [FieldsName] VARCHAR(150),
    [Description] VARCHAR(250) NOT NULL CONSTRAINT [DF__fieldsset__Descr__6FE99F9F] DEFAULT '',
    [DataType] VARCHAR(15),
    CONSTRAINT [PK__fieldsse__07E6E74AAAE87F2F] PRIMARY KEY CLUSTERED ([ReportName],[Description])
);

-- CreateTable
CREATE TABLE [dbo].[filter] (
    [ReportType] VARCHAR(20),
    [ReportName] VARCHAR(50),
    [FilterName] VARCHAR(25),
    [Description] VARCHAR(100),
    [FilterNames] VARCHAR(50),
    [Operator] VARCHAR(50),
    [System] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[filtertable] (
    [SNo] INT,
    [FilterName] VARCHAR(255),
    [TableName] VARCHAR(50),
    [Description] VARCHAR(50),
    [DataType] VARCHAR(25),
    [ReportName] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[finalLC] (
    [itemcode] VARCHAR(50),
    [rn] INT,
    [lc] FLOAT(53),
    [Qty] DECIMAL(16,3),
    [location] VARCHAR(50),
    [BranchName] VARCHAR(50),
    [Acctype] VARCHAR(50),
    [SystemName] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[formsize] (
    [FormName] VARCHAR(50) NOT NULL,
    [SysNamee] VARCHAR(50) NOT NULL,
    [topValue] DECIMAL(18,0) NOT NULL CONSTRAINT [DF__formsize__topVal__75A278F5] DEFAULT 0,
    [leftValue] DECIMAL(18,0) CONSTRAINT [DF__formsize__leftVa__76969D2E] DEFAULT 0,
    [widthValue] DECIMAL(18,0) CONSTRAINT [DF__formsize__widthV__778AC167] DEFAULT 0,
    [heightValue] DECIMAL(18,0) CONSTRAINT [DF__formsize__height__787EE5A0] DEFAULT 0,
    CONSTRAINT [PK__formsize__BCED39DFCFB7FC50] PRIMARY KEY CLUSTERED ([FormName],[SysNamee])
);

-- CreateTable
CREATE TABLE [dbo].[FreeMaster] (
    [ItemCode] BIGINT NOT NULL,
    [HwQty] FLOAT(53) NOT NULL,
    [FQty] FLOAT(53) NOT NULL,
    [Frm_Date] DATETIME,
    [To_Date] DATETIME,
    [ActiveStatus] VARCHAR(9),
    CONSTRAINT [PK__FreeMast__3ECC0FEB5F20F8FB] PRIMARY KEY CLUSTERED ([ItemCode])
);

-- CreateTable
CREATE TABLE [dbo].[itemmaster] (
    [Category] VARCHAR(25) NOT NULL,
    [ItemCode] BIGINT NOT NULL CONSTRAINT [DF__itemmaste__ItemC__7D439ABD] DEFAULT 0,
    [BarCode] VARCHAR(30),
    [Make] VARCHAR(25),
    [Description] VARCHAR(100),
    [TDescription] VARCHAR(100),
    [Sizes] VARCHAR(20),
    [RackName] VARCHAR(25),
    [Plat] VARCHAR(50),
    [DealerName] VARCHAR(40),
    [RQty] INT CONSTRAINT [DF__itemmaster__RQty__7E37BEF6] DEFAULT 0,
    [Unit] VARCHAR(5) CONSTRAINT [DF__itemmaster__Unit__7F2BE32F] DEFAULT 'Pcs',
    [Packing] INT CONSTRAINT [DF__itemmaste__Packi__00200768] DEFAULT 1,
    [AltUnit] VARCHAR(5) CONSTRAINT [DF__itemmaste__AltUn__01142BA1] DEFAULT 'Pcs',
    [UnitPer] FLOAT(53) CONSTRAINT [DF__itemmaste__UnitP__02084FDA] DEFAULT 1,
    [Cost] DECIMAL(19,4) CONSTRAINT [DF__itemmaster__Cost__02FC7413] DEFAULT 0.0000,
    [Cost1] DECIMAL(19,4) CONSTRAINT [DF__itemmaste__Cost1__03F0984C] DEFAULT 0.0000,
    [PRate] DECIMAL(19,4) CONSTRAINT [DF__itemmaste__PRate__04E4BC85] DEFAULT 0.0000,
    [RateStatus] VARCHAR(8) CONSTRAINT [DF__itemmaste__RateS__05D8E0BE] DEFAULT 'Rate',
    [MaxRate] DECIMAL(19,4) CONSTRAINT [DF__itemmaste__MaxRa__06CD04F7] DEFAULT 0.0000,
    [MinRate] DECIMAL(19,4) CONSTRAINT [DF__itemmaste__MinRa__07C12930] DEFAULT 0.0000,
    [BulkRate] DECIMAL(19,4) CONSTRAINT [DF__itemmaste__BulkR__08B54D69] DEFAULT 0.0000,
    [MRP] DECIMAL(19,4) CONSTRAINT [DF__itemmaster__MRP__09A971A2] DEFAULT 0.0000,
    [TaxStatus] VARCHAR(10) CONSTRAINT [DF__itemmaste__TaxSt__0A9D95DB] DEFAULT 'Extra',
    [Tax] FLOAT(53) CONSTRAINT [DF__itemmaster__Tax__0B91BA14] DEFAULT 0,
    [Sgst] FLOAT(53) CONSTRAINT [DF__itemmaster__Sgst__0C85DE4D] DEFAULT 0,
    [Cgst] FLOAT(53) CONSTRAINT [DF__itemmaster__Cgst__0D7A0286] DEFAULT 0,
    [MaxDis] FLOAT(53) CONSTRAINT [DF__itemmaste__MaxDi__0E6E26BF] DEFAULT 0,
    [IncPer] FLOAT(53) CONSTRAINT [DF__itemmaste__IncPe__0F624AF8] DEFAULT 0,
    [ComsIncPer] FLOAT(53) CONSTRAINT [DF__itemmaste__ComsI__10566F31] DEFAULT 0.000,
    [IncRs] DECIMAL(19,4) CONSTRAINT [DF__itemmaste__IncRs__114A936A] DEFAULT 0.0000,
    [SpecialMessage] VARCHAR(8) CONSTRAINT [DF__itemmaste__Speci__123EB7A3] DEFAULT 'No',
    [Stockmaintenance] VARCHAR(4) CONSTRAINT [DF__itemmaste__Stock__1332DBDC] DEFAULT 'Yes',
    [Ratealtration] VARCHAR(4) CONSTRAINT [DF__itemmaste__Ratea__14270015] DEFAULT 'No',
    [DefaultUnit] VARCHAR(5) CONSTRAINT [DF__itemmaste__Defau__151B244E] DEFAULT 'Yes',
    [ActiveStatus] VARCHAR(9) CONSTRAINT [DF__itemmaste__Activ__160F4887] DEFAULT 'Yes',
    [Login] VARCHAR(15) CONSTRAINT [DF__itemmaste__Login__17036CC0] DEFAULT 'Admin',
    [LoginName] VARCHAR(35) CONSTRAINT [DF__itemmaste__Login__17F790F9] DEFAULT 'Admin',
    [StockCorrection] VARCHAR(10) CONSTRAINT [DF__itemmaste__Stock__18EBB532] DEFAULT 'Yes',
    [WaiterPer] DECIMAL(16,3) CONSTRAINT [DF__itemmaste__Waite__19DFD96B] DEFAULT 0.000,
    [SalesRefPer] DECIMAL(16,3) CONSTRAINT [DF__itemmaste__Sales__1AD3FDA4] DEFAULT 0.000,
    [PDis] DECIMAL(16,3) CONSTRAINT [DF__itemmaster__PDis__1BC821DD] DEFAULT 0.000,
    [Grade] VARCHAR(50),
    [Memo] VARCHAR(1000),
    [SP] DECIMAL(16,2) CONSTRAINT [DF__itemmaster__SP__1CBC4616] DEFAULT 0.00,
    [AliasName] VARCHAR(25),
    [HsnCode] VARCHAR(25),
    [AccountName] VARCHAR(50),
    [Cess] FLOAT(53),
    [ItemImage] IMAGE,
    [AltRate] DECIMAL(19,4) CONSTRAINT [DF__itemmaste__AltRa__1DB06A4F] DEFAULT 0.0000,
    [AdiCess] DECIMAL(19,2) CONSTRAINT [DF__itemmaste__AdiCe__1EA48E88] DEFAULT 0.00,
    [TMPSIZES] VARCHAR(20),
    [MOQty] INT,
    [UpdateDate] DATETIME,
    [UpdateTime] VARCHAR(12),
    CONSTRAINT [PK_itemmaster] PRIMARY KEY CLUSTERED ([ItemCode])
);

-- CreateTable
CREATE TABLE [dbo].[jointable] (
    [TableName] VARCHAR(50) NOT NULL,
    [FieldsName] VARCHAR(25) NOT NULL,
    [ReportName] VARCHAR(50) NOT NULL CONSTRAINT [DF__jointable__Repor__02925FBF] DEFAULT '',
    CONSTRAINT [PK__jointabl__CBA5FCF20C4DCF60] PRIMARY KEY CLUSTERED ([TableName],[FieldsName],[ReportName])
);

-- CreateTable
CREATE TABLE [dbo].[locationmaster] (
    [Location] VARCHAR(50) NOT NULL,
    [Login] VARCHAR(25),
    [LoginName] VARCHAR(50) CONSTRAINT [DF__locationm__Login__236943A5] DEFAULT 'Admin',
    CONSTRAINT [PK__location__E55D3B116C427240] PRIMARY KEY CLUSTERED ([Location])
);

-- CreateTable
CREATE TABLE [dbo].[locationtransfer] (
    [Trans_Type] VARCHAR(25) NOT NULL,
    [BillNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [Sno] INT NOT NULL,
    [ItemCode] BIGINT,
    [Location] VARCHAR(50),
    [Cost] DECIMAL(19,4) CONSTRAINT [DF__locationtr__Cost__038683F8] DEFAULT 0.0000,
    [APQty] FLOAT(53) CONSTRAINT [DF__locationt__APQty__047AA831] DEFAULT 0,
    [ALQty] FLOAT(53) CONSTRAINT [DF__locationt__ALQty__056ECC6A] DEFAULT 0,
    [AvailQty] FLOAT(53),
    [System] VARCHAR(50),
    [LoginName] VARCHAR(50),
    [AccType] VARCHAR(50) NOT NULL,
    [BranchName] VARCHAR(50) NOT NULL CONSTRAINT [DF__locationt__Branc__0662F0A3] DEFAULT '',
    [Memo] VARCHAR(250),
    [MRP] DECIMAL(16,2) CONSTRAINT [DF__locationtra__MRP__075714DC] DEFAULT 0.00,
    [BatchNo] VARCHAR(25),
    [LC] DECIMAL(19,4) CONSTRAINT [DF__locationtran__LC__084B3915] DEFAULT 0,
    CONSTRAINT [PK__location__1D02332E56B08645] PRIMARY KEY CLUSTERED ([Trans_Type],[BillNo],[Sno],[AccType],[BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[MakeEntry] (
    [EntryNo] INT NOT NULL,
    [Trans_Type] VARCHAR(15),
    [Trans_Date] DATETIME,
    [SNo] INT NOT NULL,
    [Debit] DECIMAL(16,3) CONSTRAINT [DF__MakeEntry__Debit__093F5D4E] DEFAULT 0,
    [Memo] VARCHAR(75),
    [Name] VARCHAR(50),
    [Login] VARCHAR(15),
    [LoginName] VARCHAR(35),
    [Credit] DECIMAL(16,3) CONSTRAINT [DF__MakeEntry__Credi__0A338187] DEFAULT 0,
    [BillNo] VARCHAR(50),
    [AccType] VARCHAR(15) NOT NULL,
    [BranchName] VARCHAR(50) NOT NULL,
    CONSTRAINT [PK__MakeEntr__99619E37B3DEEBD3] PRIMARY KEY CLUSTERED ([EntryNo],[SNo],[AccType],[BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[memorize] (
    [ReportType] VARCHAR(25),
    [ReportName] VARCHAR(50),
    [TableName] VARCHAR(25),
    [TransType] VARCHAR(25)
);

-- CreateTable
CREATE TABLE [dbo].[OnlineCnctn] (
    [Dataconnt] VARCHAR(50) NOT NULL
);

-- CreateTable
CREATE TABLE [dbo].[Openingstock] (
    [Trans_Type] VARCHAR(25) NOT NULL,
    [Vendor] BIGINT CONSTRAINT [DF__Openingst__Vendo__0B27A5C0] DEFAULT 0,
    [BillNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [Sno] INT NOT NULL,
    [ItemCode] BIGINT CONSTRAINT [DF__Openingst__ItemC__0C1BC9F9] DEFAULT 0,
    [Qty] FLOAT(53) CONSTRAINT [DF__Openingstoc__Qty__0D0FEE32] DEFAULT 0,
    [Units] VARCHAR(5),
    [PRate] DECIMAL(19,4) CONSTRAINT [DF__Openingst__PRate__0E04126B] DEFAULT 0.0000,
    [Amount] DECIMAL(19,2) CONSTRAINT [DF__Openingst__Amoun__0EF836A4] DEFAULT 0.00,
    [Discount] FLOAT(53) CONSTRAINT [DF__Openingst__Disco__0FEC5ADD] DEFAULT 0,
    [DisAmt] DECIMAL(19,2) CONSTRAINT [DF__Openingst__DisAm__10E07F16] DEFAULT 0.00,
    [Tax] FLOAT(53) CONSTRAINT [DF__Openingstoc__Tax__11D4A34F] DEFAULT 0,
    [CGST] FLOAT(53) CONSTRAINT [DF__Openingsto__CGST__12C8C788] DEFAULT 0,
    [SGST] FLOAT(53) CONSTRAINT [DF__Openingsto__SGST__13BCEBC1] DEFAULT 0,
    [IGST] FLOAT(53) CONSTRAINT [DF__Openingsto__IGST__14B10FFA] DEFAULT 0,
    [SGSTAmt] DECIMAL(19,2) CONSTRAINT [DF__Openingst__SGSTA__15A53433] DEFAULT 0.00,
    [CGSTAmt] DECIMAL(19,2) CONSTRAINT [DF__Openingst__CGSTA__1699586C] DEFAULT 0.00,
    [IGSTAmt] DECIMAL(19,2) CONSTRAINT [DF__Openingst__IGSTA__178D7CA5] DEFAULT 0.00,
    [LoginName] VARCHAR(25) CONSTRAINT [DF__Openingst__Login__1881A0DE] DEFAULT 'Admin',
    [Account] VARCHAR(50) CONSTRAINT [DF__Openingst__Accou__1975C517] DEFAULT '0',
    [System] VARCHAR(50),
    [OQty] FLOAT(53) CONSTRAINT [DF__Openingsto__OQty__1A69E950] DEFAULT 0,
    [AccType] VARCHAR(20) NOT NULL,
    [LC] DECIMAL(19,4),
    [Location] VARCHAR(50),
    [BranchName] VARCHAR(50) NOT NULL CONSTRAINT [DF__Openingst__Branc__1B5E0D89] DEFAULT '',
    [BatchNo] VARCHAR(25),
    [MRP] DECIMAL(16,2) CONSTRAINT [DF__Openingstoc__MRP__1C5231C2] DEFAULT 0.00,
    [VatAmt] DECIMAL(19,2) CONSTRAINT [DF__Openingst__VatAm__1D4655FB] DEFAULT 0.00,
    [Margin] DECIMAL(19,2) CONSTRAINT [DF__Openingst__Margi__1E3A7A34] DEFAULT 0.00,
    [MaxRate] DECIMAL(19,4) CONSTRAINT [DF__Openingst__MaxRa__1F2E9E6D] DEFAULT 0.0000,
    CONSTRAINT [PK__Openings__1D02332E5F04E810] PRIMARY KEY CLUSTERED ([Trans_Type],[BillNo],[Sno],[AccType],[BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[OrderMaster] (
    [OrderNO] BIGINT NOT NULL,
    [OrderDate] DATETIME,
    [Customer] BIGINT,
    [Sno] INT NOT NULL,
    [TableNo] VARCHAR(25) NOT NULL,
    [WaiterName] VARCHAR(50) NOT NULL,
    [RateType] VARCHAR(25) NOT NULL,
    [ItemCode] BIGINT,
    [Qty] FLOAT(53),
    [Rate] DECIMAL(19,4) CONSTRAINT [DF__OrderMaste__Rate__2DE6D218] DEFAULT 0,
    [Amount] DECIMAL(19,4) CONSTRAINT [DF__OrderMast__Amoun__2EDAF651] DEFAULT 0,
    [Status] VARCHAR(25),
    [LoginName] VARCHAR(25),
    CONSTRAINT [PK__OrderMas__9F3182121B1D43AA] PRIMARY KEY CLUSTERED ([OrderNO],[Sno])
);

-- CreateTable
CREATE TABLE [dbo].[OutdoorOrder] (
    [Trans_Type] VARCHAR(25),
    [OrderNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [Customer] BIGINT,
    [Sno] INT NOT NULL,
    [ItemCode] BIGINT,
    [DeliveryDate] DATETIME,
    [DStatus] VARCHAR(20),
    [DTime] VARCHAR(10),
    [Remarks] VARCHAR(300),
    [Qty] FLOAT(53),
    [Rate] MONEY,
    [SRate] DECIMAL(19,4),
    [Amount] DECIMAL(19,4),
    [Discount] FLOAT(53),
    [DisAmt] MONEY,
    [GST] FLOAT(53),
    [CGST] FLOAT(53),
    [SGST] FLOAT(53),
    [IGST] FLOAT(53),
    [CGSTAmt] DECIMAL(19,4),
    [SGSTAmt] DECIMAL(19,4),
    [IGSTAmt] DECIMAL(19,4),
    [PreparationCharge] DECIMAL(19,4),
    [MemberCharge] DECIMAL(19,4),
    [WaterCharge] DECIMAL(19,4),
    [RoundOff] DECIMAL(19,4),
    [WaiterName] VARCHAR(50),
    [DeliveryMode] VARCHAR(50),
    [ServiceMode] VARCHAR(50),
    [LoginName] VARCHAR(25),
    [System] VARCHAR(25),
    [BranchName] VARCHAR(50) NOT NULL,
    CONSTRAINT [PK__OutdoorO__9C0881E95B987B72] PRIMARY KEY CLUSTERED ([OrderNo],[Sno],[BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[packingmaterial] (
    [Trans_Type] VARCHAR(25) NOT NULL,
    [BillNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [Sno] INT NOT NULL,
    [ItemCode] BIGINT CONSTRAINT [DF__packingma__ItemC__2022C2A6] DEFAULT 0,
    [Amount] DECIMAL(19,4) CONSTRAINT [DF__packingma__Amoun__2116E6DF] DEFAULT 0.0000,
    [LoginName] VARCHAR(25),
    [System] VARCHAR(50),
    [APQty] FLOAT(53) CONSTRAINT [DF__packingma__APQty__220B0B18] DEFAULT 0,
    [ALQty] FLOAT(53) CONSTRAINT [DF__packingma__ALQty__22FF2F51] DEFAULT 0,
    [LC] DECIMAL(19,4) CONSTRAINT [DF__packingmater__LC__23F3538A] DEFAULT 0.0000,
    [EditMode] VARCHAR(3) CONSTRAINT [DF__packingma__EditM__24E777C3] DEFAULT 'No',
    [AccType] VARCHAR(20) NOT NULL,
    [Location] VARCHAR(50),
    [BranchName] VARCHAR(50) NOT NULL CONSTRAINT [DF__packingma__Branc__25DB9BFC] DEFAULT '',
    [Memo] VARCHAR(250),
    [MRP] DECIMAL(16,2) CONSTRAINT [DF__packingmate__MRP__26CFC035] DEFAULT 0.00,
    [BatchNo] VARCHAR(25),
    CONSTRAINT [PK__packingm__1D02332EE1F1ACA1] PRIMARY KEY CLUSTERED ([Trans_Type],[BillNo],[Sno],[AccType],[BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[paybills] (
    [Trans_Type] VARCHAR(25),
    [Trans_No] INT NOT NULL CONSTRAINT [DF__paybills__Trans___27C3E46E] DEFAULT 0,
    [Trans_Date] DATETIME,
    [Vendor] INT,
    [PaymentMode] VARCHAR(50),
    [ChequeNo] VARCHAR(50),
    [Amount] DECIMAL(16,3),
    [Memo] VARCHAR(250),
    [CreditAccount] VARCHAR(50),
    [DebitAccount] VARCHAR(50),
    [LoginName] VARCHAR(50),
    [AccType] VARCHAR(2) NOT NULL CONSTRAINT [DF__paybills__AccTyp__28B808A7] DEFAULT '',
    [BranchName] VARCHAR(50) NOT NULL CONSTRAINT [DF__paybills__Branch__29AC2CE0] DEFAULT '',
    [BillNo] VARCHAR(30),
    [BDate] DATETIME,
    [Due_Date] DATETIME,
    [Balance] DECIMAL(16,3) CONSTRAINT [DF__paybills__Balanc__2AA05119] DEFAULT 0,
    [Days] INT,
    [DueAmt] DECIMAL(16,3),
    [Login] VARCHAR(25),
    [Locked] VARCHAR(25),
    [Payment] DECIMAL(16,3),
    [PaidStatus] VARCHAR(10),
    [SNo] INT NOT NULL CONSTRAINT [DF__paybills__SNo__2B947552] DEFAULT 0,
    [Interest] DECIMAL(16,3),
    [Discount] DECIMAL(16,3),
    CONSTRAINT [paybill_pk] PRIMARY KEY CLUSTERED ([Trans_No],[AccType],[BranchName],[SNo])
);

-- CreateTable
CREATE TABLE [dbo].[payments] (
    [Trans_Type] VARCHAR(25),
    [Trans_No] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [SNo] INT NOT NULL CONSTRAINT [DF__payments__SNo__2C88998B] DEFAULT 0,
    [Vendor] INT,
    [DebitAccount] VARCHAR(50),
    [PayMode] VARCHAR(50),
    [CheckNo] VARCHAR(50),
    [CreditAccount] VARCHAR(50),
    [Amount] DECIMAL(16,3),
    [Memo] VARCHAR(250),
    [AccType] VARCHAR(2) NOT NULL CONSTRAINT [DF__payments__AccTyp__2D7CBDC4] DEFAULT '~',
    [LoginName] VARCHAR(50),
    [BranchName] VARCHAR(50) NOT NULL,
    [PRemarks] VARCHAR(300),
    CONSTRAINT [payments_pk] PRIMARY KEY CLUSTERED ([Trans_No],[SNo],[AccType],[BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[pendinglist] (
    [CounterName] VARCHAR(25),
    [AccountsType] VARCHAR(25),
    [AccountName] VARCHAR(50),
    [TransType] VARCHAR(20),
    [BillNo] VARCHAR(25),
    [Trans_Date] DATETIME,
    [Due_Date] DATETIME,
    [Balance] DECIMAL(19,4) CONSTRAINT [DF__pendingli__Balan__2E70E1FD] DEFAULT 0.0000,
    [BillAmount] DECIMAL(19,4) CONSTRAINT [DF__pendingli__BillA__2F650636] DEFAULT 0.0000,
    [PaidStatus] VARCHAR(8),
    [AccType] VARCHAR(10),
    [Onlinestatus] VARCHAR(50),
    [BranchName] VARCHAR(50),
    [RefNo] VARCHAR(150),
    [Days] INT CONSTRAINT [DF__pendinglis__Days__30592A6F] DEFAULT 0,
    [Customer] BIGINT
);

-- CreateTable
CREATE TABLE [dbo].[pendingtemp] (
    [CounterName] VARCHAR(25),
    [AccountName] VARCHAR(50),
    [TransType] VARCHAR(20),
    [BillNo] VARCHAR(25),
    [ReturnNo] VARCHAR(25),
    [Trans_Date] DATETIME,
    [Balance] DECIMAL(19,4) CONSTRAINT [DF__pendingte__Balan__314D4EA8] DEFAULT 0.0000,
    [AccType] VARCHAR(10),
    [BranchName] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[Perfoma] (
    [Trans_Type] VARCHAR(25) NOT NULL,
    [BillNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [AccType] VARCHAR(15) NOT NULL CONSTRAINT [DF__Perfoma__AccType__324172E1] DEFAULT '',
    [Customer] BIGINT,
    [Trans_Time] VARCHAR(15),
    [Sno] INT NOT NULL,
    [BranchName] VARCHAR(50) NOT NULL,
    [ItemCode] BIGINT CONSTRAINT [DF__Perfoma__ItemCod__3335971A] DEFAULT 0,
    [Qty] FLOAT(53),
    [Units] VARCHAR(10),
    [UnitPer] FLOAT(53) CONSTRAINT [DF__Perfoma__UnitPer__3429BB53] DEFAULT 0,
    [SQty] FLOAT(53) CONSTRAINT [DF__Perfoma__SQty__351DDF8C] DEFAULT 0,
    [AQty] FLOAT(53),
    [Rate] DECIMAL(19,4) CONSTRAINT [DF__Perfoma__Rate__361203C5] DEFAULT 0.0000,
    [SRate] DECIMAL(19,4) CONSTRAINT [DF__Perfoma__SRate__370627FE] DEFAULT 0.0000,
    [LC] DECIMAL(19,4),
    [Amount] DECIMAL(19,4) CONSTRAINT [DF__Perfoma__Amount__37FA4C37] DEFAULT 0.0000,
    [Discount] FLOAT(53) CONSTRAINT [DF__Perfoma__Discoun__38EE7070] DEFAULT 0,
    [DisAmt] DECIMAL(16,4),
    [Tax] FLOAT(53) CONSTRAINT [DF__Perfoma__Tax__39E294A9] DEFAULT 0,
    [Labor] DECIMAL(19,4) CONSTRAINT [DF__Perfoma__Labor__3AD6B8E2] DEFAULT 0.0000,
    [Convenience] DECIMAL(19,4) CONSTRAINT [DF__Perfoma__Conveni__3BCADD1B] DEFAULT 0.0000,
    [RoundOff] DECIMAL(19,4),
    [Login] VARCHAR(25),
    [LoginName] VARCHAR(25),
    [WaiterName] VARCHAR(50),
    [CaptanName] VARCHAR(50),
    [SMPer] DECIMAL(16,3),
    [SRPer] DECIMAL(16,3),
    [Delivery] VARCHAR(50),
    [ComPerson] VARCHAR(max),
    [EditMode] VARCHAR(3) CONSTRAINT [DF__Perfoma__EditMod__3CBF0154] DEFAULT 'No',
    [ComPer] FLOAT(53),
    [ComRs] DECIMAL(19,4),
    [System] VARCHAR(25),
    [Color] VARCHAR(50),
    [TableNo] VARCHAR(25),
    [NoOfQty] VARCHAR(20),
    [Memo] VARCHAR(500),
    [SONo] BIGINT,
    [SalesNo] BIGINT,
    [Sgst] FLOAT(53) CONSTRAINT [DF__Perfoma__Sgst__3DB3258D] DEFAULT 0,
    [Cgst] FLOAT(53) CONSTRAINT [DF__Perfoma__Cgst__3EA749C6] DEFAULT 0,
    [Igst] FLOAT(53) CONSTRAINT [DF__Perfoma__Igst__3F9B6DFF] DEFAULT 0,
    [SgstAmt] DECIMAL(16,4) CONSTRAINT [DF__Perfoma__SgstAmt__408F9238] DEFAULT 0.00,
    [CgstAmt] DECIMAL(16,4) CONSTRAINT [DF__Perfoma__CgstAmt__4183B671] DEFAULT 0.00,
    [IgstAmt] DECIMAL(16,4) CONSTRAINT [DF__Perfoma__IgstAmt__4277DAAA] DEFAULT 0.00,
    CONSTRAINT [PK__Perfoma__7E62EE5B93BC85F2] PRIMARY KEY CLUSTERED ([BillNo],[Sno],[BranchName],[AccType])
);

-- CreateTable
CREATE TABLE [dbo].[printerdetails] (
    [FormName] VARCHAR(50),
    [PrinterName] VARCHAR(50),
    [System] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[printset] (
    [Form] VARCHAR(50) NOT NULL,
    [Style] VARCHAR(50) NOT NULL CONSTRAINT [DF__printset__Style__3E1D39E1] DEFAULT '',
    [Type] VARCHAR(50) NOT NULL CONSTRAINT [DF__printset__Type__3F115E1A] DEFAULT '',
    [PrintType] VARCHAR(20) CONSTRAINT [DF__printset__PrintT__40058253] DEFAULT 'Format',
    [ControlName] VARCHAR(200) NOT NULL,
    [ControlValue] VARCHAR(200) NOT NULL CONSTRAINT [DF__printset__Contro__40F9A68C] DEFAULT '',
    [xPos] INT,
    [yPos] INT,
    [systemname] VARCHAR(50),
    [loginName] VARCHAR(50),
    [Color] VARCHAR(50),
    [sizes] VARCHAR(50),
    [fontName] VARCHAR(50),
    [FontStyle] VARCHAR(50),
    [Grid] VARCHAR(10),
    [width] INT,
    [height] INT,
    [Summary] VARCHAR(10) CONSTRAINT [DF__printset__Summar__41EDCAC5] DEFAULT 'False',
    [AccType] VARCHAR(25) NOT NULL,
    [Linespace] INT,
    [ItemLine] VARCHAR(6),
    [Sno] INT NOT NULL IDENTITY(1,1),
    CONSTRAINT [PK__printset__92234E21BE4AECF0] PRIMARY KEY CLUSTERED ([Form],[ControlName],[Style],[Type],[ControlValue],[AccType])
);

-- CreateTable
CREATE TABLE [dbo].[PrintTbl] (
    [OrderNo] BIGINT NOT NULL,
    [PrintStatus] VARCHAR(5) CONSTRAINT [DF__PrintTbl__PrintS__436BFEE3] DEFAULT 'No',
    CONSTRAINT [PK_PrintTbl] PRIMARY KEY CLUSTERED ([OrderNo])
);

-- CreateTable
CREATE TABLE [dbo].[purchase] (
    [Trans_Type] VARCHAR(50),
    [BranchName] VARCHAR(50) NOT NULL,
    [BillNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [Vendor] INT CONSTRAINT [DF__purchase__Vendor__4460231C] DEFAULT 0,
    [PONo] BIGINT CONSTRAINT [DF__purchase__PONo__45544755] DEFAULT 0,
    [Sno] INT NOT NULL,
    [ItemCode] BIGINT CONSTRAINT [DF__purchase__ItemCo__46486B8E] DEFAULT 0,
    [PRate] DECIMAL(19,4) CONSTRAINT [DF__purchase__PRate__473C8FC7] DEFAULT 0.0000,
    [Amount] DECIMAL(19,4) CONSTRAINT [DF__purchase__Amount__4830B400] DEFAULT 0.0000,
    [InvoiceNo] VARCHAR(25),
    [Discount] FLOAT(53) CONSTRAINT [DF__purchase__Discou__4924D839] DEFAULT 0,
    [SPDiscount] FLOAT(53) CONSTRAINT [DF__purchase__SPDisc__4A18FC72] DEFAULT 0,
    [DisAmt] DECIMAL(19,4) CONSTRAINT [DF__purchase__DisAmt__4B0D20AB] DEFAULT 0.0000,
    [SPDisAmt] DECIMAL(19,4) CONSTRAINT [DF__purchase__SPDisA__4C0144E4] DEFAULT 0.0000,
    [OtherPer] FLOAT(53),
    [OtherAmt] DECIMAL(19,4),
    [LC] DECIMAL(19,4),
    [DueDate] DATETIME,
    [UnitPer] FLOAT(53) CONSTRAINT [DF__purchase__UnitPe__4CF5691D] DEFAULT 0,
    [PurDate] DATETIME,
    [LoginName] VARCHAR(25),
    [Account] VARCHAR(50),
    [Bill_Type] VARCHAR(10),
    [System] VARCHAR(50),
    [PQty] FLOAT(53) CONSTRAINT [DF__purchase__PQty__4DE98D56] DEFAULT 0,
    [Tax] FLOAT(53) CONSTRAINT [DF__purchase__Tax__4EDDB18F] DEFAULT 0,
    [Sgst] FLOAT(53) CONSTRAINT [DF__purchase__Sgst__4FD1D5C8] DEFAULT 0,
    [Cgst] FLOAT(53) CONSTRAINT [DF__purchase__Cgst__50C5FA01] DEFAULT 0,
    [Igst] FLOAT(53) CONSTRAINT [DF__purchase__Igst__51BA1E3A] DEFAULT 0,
    [RoundOff] DECIMAL(19,4) CONSTRAINT [DF__purchase__RoundO__52AE4273] DEFAULT 0.0000,
    [FW] DECIMAL(19,4) CONSTRAINT [DF__purchase__FW__53A266AC] DEFAULT 0.0000,
    [SgstAmt] DECIMAL(19,4) CONSTRAINT [DF__purchase__SgstAm__54968AE5] DEFAULT 0.0000,
    [CgstAmt] DECIMAL(19,4) CONSTRAINT [DF__purchase__CgstAm__558AAF1E] DEFAULT 0.0000,
    [IgstAmt] DECIMAL(19,4) CONSTRAINT [DF__purchase__IgstAm__567ED357] DEFAULT 0.0000,
    [InvoiceType] VARCHAR(25),
    [EditMode] VARCHAR(3) CONSTRAINT [DF__purchase__EditMo__5772F790] DEFAULT 'No',
    [AccType] VARCHAR(10) NOT NULL,
    [Qty] FLOAT(53),
    [Units] VARCHAR(10),
    [Exp] FLOAT(53) CONSTRAINT [DF__purchase__Exp__58671BC9] DEFAULT 0,
    [Location] VARCHAR(50),
    [TransportName] VARCHAR(50),
    [DeliveryDate] DATETIME,
    [DeliveryFrom] VARCHAR(50),
    [OtherCharge] VARCHAR(50),
    [Margin] DECIMAL(16,2),
    [Max_Rate] MONEY,
    [NoOflable] INT,
    [DisRec] DECIMAL(16,3) CONSTRAINT [DF__purchase__DisRec__595B4002] DEFAULT 0.00,
    [BatchNo] VARCHAR(25),
    [MRP] DECIMAL(16,2) CONSTRAINT [DF__purchase__MRP__5A4F643B] DEFAULT 0.00,
    [AdiCess] DECIMAL(19,2) CONSTRAINT [DF__purchase__AdiCes__5B438874] DEFAULT 0.00,
    [CessP] DECIMAL(19,4) CONSTRAINT [DF__purchase__CessP__5C37ACAD] DEFAULT 0.00,
    [CessAmt] DECIMAL(19,3) CONSTRAINT [DF__purchase__CessAm__5D2BD0E6] DEFAULT 0.00,
    [TCSAmt] DECIMAL(19,3) CONSTRAINT [DF__purchase__TCSAmt__5E1FF51F] DEFAULT 0.00,
    [TCSP] DECIMAL(19,4) CONSTRAINT [DF__purchase__TCSP__5F141958] DEFAULT 0.00,
    [Salesman] VARCHAR(50),
    [ExcRate] DECIMAL(16,4) CONSTRAINT [DF__purchase__ExcRat__60083D91] DEFAULT 0,
    [JobCardNo] BIGINT,
    [SalOrdNo] BIGINT CONSTRAINT [DF__purchase__SalOrd__60FC61CA] DEFAULT 0,
    [CustomerAccountName] VARCHAR(70),
    [SalesNo] BIGINT,
    [DCNo] BIGINT,
    [Color] VARCHAR(25),
    CONSTRAINT [Purchse_pk] PRIMARY KEY CLUSTERED ([BillNo],[Sno],[AccType],[BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[purchaseOrder] (
    [Trans_Type] VARCHAR(50),
    [TransportName] VARCHAR(50),
    [BillNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [Vendor] INT CONSTRAINT [DF__purchaseO__Vendo__61F08603] DEFAULT 0,
    [Sno] INT NOT NULL,
    [ItemCode] BIGINT CONSTRAINT [DF__purchaseO__ItemC__62E4AA3C] DEFAULT 0,
    [PRate] DECIMAL(19,4) CONSTRAINT [DF__purchaseO__PRate__63D8CE75] DEFAULT 0.0000,
    [Amount] DECIMAL(19,4) CONSTRAINT [DF__purchaseO__Amoun__64CCF2AE] DEFAULT 0.0000,
    [RefNo] VARCHAR(25),
    [Discount] FLOAT(53) CONSTRAINT [DF__purchaseO__Disco__65C116E7] DEFAULT 0,
    [SPDiscount] FLOAT(53) CONSTRAINT [DF__purchaseO__SPDis__66B53B20] DEFAULT 0,
    [DisAmt] DECIMAL(19,4) CONSTRAINT [DF__purchaseO__DisAm__67A95F59] DEFAULT 0.0000,
    [SPDisAmt] DECIMAL(19,4) CONSTRAINT [DF__purchaseO__SPDis__689D8392] DEFAULT 0.0000,
    [OtherPer] FLOAT(53),
    [OtherAmt] DECIMAL(19,4),
    [LC] DECIMAL(19,4),
    [DueDate] DATETIME,
    [UnitPer] FLOAT(53) CONSTRAINT [DF__purchaseO__UnitP__6991A7CB] DEFAULT 0,
    [PurDate] DATETIME,
    [LoginName] VARCHAR(25),
    [System] VARCHAR(50),
    [PQty] FLOAT(53) CONSTRAINT [DF__purchaseOr__PQty__6A85CC04] DEFAULT 0,
    [Tax] FLOAT(53) CONSTRAINT [DF__purchaseOrd__Tax__6B79F03D] DEFAULT 0,
    [RoundOff] DECIMAL(19,4) CONSTRAINT [DF__purchaseO__Round__6C6E1476] DEFAULT 0.0000,
    [FW] DECIMAL(19,4) CONSTRAINT [DF__purchaseOrde__FW__6D6238AF] DEFAULT 0.0000,
    [EditMode] VARCHAR(3) CONSTRAINT [DF__purchaseO__EditM__6E565CE8] DEFAULT 'No',
    [AccType] VARCHAR(10) NOT NULL,
    [Qty] FLOAT(53),
    [Units] VARCHAR(10),
    [Exp] FLOAT(53) CONSTRAINT [DF__purchaseOrd__Exp__6F4A8121] DEFAULT 0,
    [Location] VARCHAR(50),
    [DeliveryDate] DATETIME,
    [DeliveryFrom] VARCHAR(50),
    [BranchName] VARCHAR(50) NOT NULL CONSTRAINT [DF__purchaseO__Branc__703EA55A] DEFAULT '',
    [OtherCharge] VARCHAR(50),
    [Margin] DECIMAL(16,2),
    [Max_Rate] MONEY,
    [NoOflable] INT,
    [NetAmount] DECIMAL(16,3) CONSTRAINT [DF__purchaseO__NetAm__7132C993] DEFAULT 0.000,
    [Login] VARCHAR(25),
    [BatchNo] VARCHAR(50),
    [MRP] DECIMAL(16,2) CONSTRAINT [DF__purchaseOrd__MRP__7226EDCC] DEFAULT 0.00,
    [SalOrdNo] BIGINT CONSTRAINT [DF__purchaseO__SalOr__731B1205] DEFAULT 0,
    [ReceiveQty] FLOAT(53) CONSTRAINT [DF__purchaseO__Recei__740F363E] DEFAULT 0,
    [InvoiceNo] VARCHAR(25),
    [PurQty] FLOAT(53) CONSTRAINT [DF__purchaseO__PurQt__75035A77] DEFAULT 0,
    [RemQty] FLOAT(53) CONSTRAINT [DF__purchaseO__RemQt__75F77EB0] DEFAULT 0,
    [CustomerAccountNames] VARCHAR(70),
    [Color] VARCHAR(50),
    CONSTRAINT [PK__purchase__FDE99791F3FBF9E5] PRIMARY KEY CLUSTERED ([BillNo],[Sno],[AccType],[BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[purchasereturn] (
    [Trans_Type] VARCHAR(25) NOT NULL,
    [BillNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [Sno] INT NOT NULL,
    [ItemCode] BIGINT CONSTRAINT [DF__purchaser__ItemC__76EBA2E9] DEFAULT 0,
    [Qty] FLOAT(53),
    [Units] VARCHAR(10),
    [UnitPer] FLOAT(53) CONSTRAINT [DF__purchaser__UnitP__77DFC722] DEFAULT 0,
    [PRQty] FLOAT(53) CONSTRAINT [DF__purchaser__PRQty__78D3EB5B] DEFAULT 0,
    [PRate] DECIMAL(19,4) CONSTRAINT [DF__purchaser__PRate__79C80F94] DEFAULT 0.0000,
    [Amount] DECIMAL(19,3) CONSTRAINT [DF__purchaser__Amoun__7ABC33CD] DEFAULT 0.000,
    [Vendor] INT CONSTRAINT [DF__purchaser__Vendo__7BB05806] DEFAULT 0,
    [InvoiceNo] INT CONSTRAINT [DF__purchaser__Invoi__7CA47C3F] DEFAULT 0,
    [Discount] FLOAT(53) CONSTRAINT [DF__purchaser__Disco__7D98A078] DEFAULT 0,
    [Sgst] FLOAT(53) CONSTRAINT [DF__purchasere__Sgst__7E8CC4B1] DEFAULT 0,
    [Cgst] FLOAT(53) CONSTRAINT [DF__purchasere__Cgst__7F80E8EA] DEFAULT 0,
    [Igst] FLOAT(53) CONSTRAINT [DF__purchasere__Igst__00750D23] DEFAULT 0,
    [DisAmt] DECIMAL(19,4) CONSTRAINT [DF__purchaser__DisAm__0169315C] DEFAULT 0.0000,
    [SgstAmt] DECIMAL(19,4) CONSTRAINT [DF__purchaser__SgstA__025D5595] DEFAULT 0.0000,
    [CgstAmt] DECIMAL(19,4) CONSTRAINT [DF__purchaser__CgstA__035179CE] DEFAULT 0.0000,
    [IgstAmt] DECIMAL(19,4) CONSTRAINT [DF__purchaser__IgstA__04459E07] DEFAULT 0.0000,
    [SPDiscount] FLOAT(53),
    [SPDisAmt] DECIMAL(19,4) CONSTRAINT [DF__purchaser__SPDis__0539C240] DEFAULT 0.0000,
    [NetAmount] DECIMAL(19,4) CONSTRAINT [DF__purchaser__NetAm__062DE679] DEFAULT 0.0000,
    [LoginName] VARCHAR(25),
    [Account] VARCHAR(50),
    [Bill_Type] VARCHAR(10),
    [System] VARCHAR(50),
    [Tax] FLOAT(53) CONSTRAINT [DF__purchaseret__Tax__07220AB2] DEFAULT 0,
    [RoundOff] MONEY CONSTRAINT [DF__purchaser__Round__08162EEB] DEFAULT 0.00,
    [FW] MONEY CONSTRAINT [DF__purchaseretu__FW__090A5324] DEFAULT 0.00,
    [LC] DECIMAL(16,3),
    [InvoiceType] VARCHAR(25),
    [AccType] VARCHAR(20) NOT NULL,
    [Location] VARCHAR(50),
    [BranchName] VARCHAR(50) NOT NULL CONSTRAINT [DF__purchaser__Branc__09FE775D] DEFAULT '',
    [MRP] DECIMAL(16,2) CONSTRAINT [DF__purchaseret__MRP__0AF29B96] DEFAULT 0.00,
    [BatchNo] VARCHAR(25),
    [TCSP] DECIMAL(19,4) CONSTRAINT [DF__purchasere__TCSP__0BE6BFCF] DEFAULT 0.00,
    [TcsAmt] DECIMAL(19,3) CONSTRAINT [DF__purchaser__TcsAm__0CDAE408] DEFAULT 0.00,
    [ReasonIssueNote] VARCHAR(25),
    [NoteType] VARCHAR(25),
    [CessAmt] DECIMAL(16,2) CONSTRAINT [DF__purchaser__CessA__0DCF0841] DEFAULT 0,
    [DCNoteNo] VARCHAR(25),
    [DCNoteDate] VARCHAR(11),
    [InvoiceDate] DATE,
    CONSTRAINT [purRT_pk] PRIMARY KEY CLUSTERED ([Trans_Type],[BillNo],[Sno],[AccType],[BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[quickshow] (
    [Formname] VARCHAR(50),
    [Showstatus] VARCHAR(50),
    [Trans_Types] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[quotation] (
    [Trans_Type] VARCHAR(25) NOT NULL,
    [BillNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [AccType] VARCHAR(15) NOT NULL CONSTRAINT [DF__quotation__AccTy__0EC32C7A] DEFAULT '',
    [Customer] BIGINT CONSTRAINT [DF__quotation__Custo__0FB750B3] DEFAULT 0,
    [Trans_Time] VARCHAR(15),
    [Sno] INT NOT NULL,
    [CounterName] VARCHAR(25) NOT NULL,
    [BranchName] VARCHAR(50) NOT NULL CONSTRAINT [DF__quotation__Branc__10AB74EC] DEFAULT '',
    [ItemCode] BIGINT CONSTRAINT [DF__quotation__ItemC__119F9925] DEFAULT 0,
    [Qty] FLOAT(53),
    [Units] VARCHAR(10),
    [UnitPer] FLOAT(53) CONSTRAINT [DF__quotation__UnitP__1293BD5E] DEFAULT 0,
    [SQty] FLOAT(53) CONSTRAINT [DF__quotation__SQty__1387E197] DEFAULT 0,
    [AQty] FLOAT(53),
    [Rate] DECIMAL(19,4) CONSTRAINT [DF__quotation__Rate__147C05D0] DEFAULT 0.0000,
    [SRate] DECIMAL(19,4) CONSTRAINT [DF__quotation__SRate__15702A09] DEFAULT 0.0000,
    [LC] DECIMAL(19,4),
    [Amount] DECIMAL(19,4) CONSTRAINT [DF__quotation__Amoun__16644E42] DEFAULT 0.0000,
    [Discount] FLOAT(53) CONSTRAINT [DF__quotation__Disco__1758727B] DEFAULT 0,
    [DisAmt] DECIMAL(16,3),
    [Tax] FLOAT(53) CONSTRAINT [DF__quotation__Tax__184C96B4] DEFAULT 0,
    [PackingCharges] DECIMAL(19,4) CONSTRAINT [DF__quotation__Packi__1940BAED] DEFAULT 0.0000,
    [Labor] DECIMAL(19,4) CONSTRAINT [DF__quotation__Labor__1A34DF26] DEFAULT 0.0000,
    [Convenience] DECIMAL(19,4) CONSTRAINT [DF__quotation__Conve__1B29035F] DEFAULT 0.0000,
    [RoundOff] DECIMAL(19,4),
    [Margin] DECIMAL(16,3),
    [Login] VARCHAR(25),
    [LoginName] VARCHAR(25),
    [WaiterName] VARCHAR(50),
    [CaptanName] VARCHAR(50),
    [SMPer] DECIMAL(16,3),
    [Sgst] FLOAT(53) CONSTRAINT [DF__quotation__Sgst__1C1D2798] DEFAULT 0,
    [Cgst] FLOAT(53) CONSTRAINT [DF__quotation__Cgst__1D114BD1] DEFAULT 0,
    [Igst] FLOAT(53) CONSTRAINT [DF__quotation__Igst__1E05700A] DEFAULT 0,
    [SgstAmt] DECIMAL(16,4) CONSTRAINT [DF__quotation__SgstA__1EF99443] DEFAULT 0.00,
    [CgstAmt] DECIMAL(16,4) CONSTRAINT [DF__quotation__CgstA__1FEDB87C] DEFAULT 0.00,
    [IgstAmt] DECIMAL(16,4) CONSTRAINT [DF__quotation__IgstA__20E1DCB5] DEFAULT 0.00,
    [SRPer] DECIMAL(16,3),
    [Delivery] VARCHAR(50),
    [ComPerson] VARCHAR(250),
    [EditMode] VARCHAR(3) CONSTRAINT [DF__quotation__EditM__21D600EE] DEFAULT 'No',
    [ComPer] FLOAT(53),
    [ComRs] DECIMAL(19,4),
    [System] VARCHAR(25),
    [Color] VARCHAR(50),
    [TableNo] VARCHAR(25),
    [NoOfQty] VARCHAR(20),
    [InvoiceNo] BIGINT,
    [Nos] VARCHAR(25),
    [SlNo] VARCHAR(5),
    [Received] DECIMAL(16,2) CONSTRAINT [DF__quotation__Recei__22CA2527] DEFAULT 0,
    [SalesMan] VARCHAR(50),
    [SalesRepName] VARCHAR(50),
    [TaxStatus] VARCHAR(15),
    [MRP] DECIMAL(16,4) CONSTRAINT [DF__quotation__MRP__23BE4960] DEFAULT 0.00,
    [Memo] VARCHAR(500),
    CONSTRAINT [quot_pk] PRIMARY KEY CLUSTERED ([BillNo],[Sno],[BranchName],[AccType])
);

-- CreateTable
CREATE TABLE [dbo].[QuotationTerms] (
    [BillNo] BIGINT NOT NULL,
    [Terms] VARCHAR(1000),
    [BranchName] VARCHAR(50) NOT NULL CONSTRAINT [DF__Quotation__Branc__24B26D99] DEFAULT '',
    [CounterName] VARCHAR(25) NOT NULL,
    CONSTRAINT [QuotTerms_pk] PRIMARY KEY CLUSTERED ([BillNo],[BranchName],[CounterName])
);

-- CreateTable
CREATE TABLE [dbo].[ratecode] (
    [Num] VARCHAR(5),
    [Chars] VARCHAR(5) NOT NULL,
    CONSTRAINT [PK__ratecode__97A46CE90EF0FB38] PRIMARY KEY CLUSTERED ([Chars])
);

-- CreateTable
CREATE TABLE [dbo].[ReceivePayment] (
    [Trans_Type] VARCHAR(25),
    [Trans_No] INT NOT NULL,
    [Trans_Date] DATETIME,
    [Customer] BIGINT,
    [PaymentMode] VARCHAR(50),
    [ChequeNo] VARCHAR(50),
    [Amount] DECIMAL(16,3),
    [Memo] VARCHAR(350),
    [DebitAccount] VARCHAR(50),
    [CreditAccount] VARCHAR(50),
    [LoginName] VARCHAR(50),
    [Login] VARCHAR(25),
    [Locked] VARCHAR(25),
    [AccType] VARCHAR(15) NOT NULL CONSTRAINT [DF__ReceivePa__AccTy__25A691D2] DEFAULT '~',
    [BranchName] VARCHAR(50) NOT NULL CONSTRAINT [DF__ReceivePa__Branc__269AB60B] DEFAULT 'Main',
    [BillNo] VARCHAR(20),
    [BDate] DATETIME,
    [Due_Date] DATETIME,
    [Balance] DECIMAL(16,3) CONSTRAINT [DF__ReceivePa__Balan__278EDA44] DEFAULT 0,
    [Days] INT,
    [DueAmt] DECIMAL(16,3),
    [Payment] DECIMAL(16,3),
    [PaidStatus] VARCHAR(10),
    [SNo] INT NOT NULL CONSTRAINT [DF__ReceivePaym__SNo__2882FE7D] DEFAULT 0,
    [CounterName] VARCHAR(25) NOT NULL,
    [IssueDate] VARCHAR(15),
    [Customer_Bank_BranchName] VARCHAR(250),
    [Customer_BankName] VARCHAR(250),
    [TDS] DECIMAL(16,3),
    [Discount] DECIMAL(16,3),
    CONSTRAINT [Recipay_pk] PRIMARY KEY CLUSTERED ([Trans_No],[AccType],[BranchName],[SNo])
);

-- CreateTable
CREATE TABLE [dbo].[relationtable] (
    [ReportName] VARCHAR(50) NOT NULL,
    [TableName] VARCHAR(25) NOT NULL,
    CONSTRAINT [PK__relation__743E39C81258FE07] PRIMARY KEY CLUSTERED ([ReportName],[TableName])
);

-- CreateTable
CREATE TABLE [dbo].[remind] (
    [RemindNo] INT NOT NULL CONSTRAINT [DF__remind__RemindNo__297722B6] DEFAULT 0,
    [Subject] VARCHAR(50),
    [Remind_Date] DATETIME,
    [StartFrom] INT CONSTRAINT [DF__remind__StartFro__2A6B46EF] DEFAULT 0,
    [Status] VARCHAR(25) CONSTRAINT [DF__remind__Status__2B5F6B28] DEFAULT 'Remind',
    [Login] VARCHAR(15),
    [LoginName] VARCHAR(25),
    CONSTRAINT [PK__remind__C087AD617831B941] PRIMARY KEY CLUSTERED ([RemindNo])
);

-- CreateTable
CREATE TABLE [dbo].[reorderqty] (
    [ItemCode] BIGINT,
    [ItemName] VARCHAR(50),
    [description] VARCHAR(50),
    [Sizee] VARCHAR(50),
    [Rqty] INT,
    [AQty] INT,
    [Branchname] VARCHAR(50),
    [Sysnamee] VARCHAR(50),
    [Loginname] VARCHAR(50),
    [Trans_Types] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[rt] (
    [AccountName] VARCHAR(50),
    [Type] VARCHAR(15),
    [Location] VARCHAR(50),
    [Route] VARCHAR(50),
    [DSR] VARCHAR(50),
    [Balance] DECIMAL(19,4) CONSTRAINT [DF__rt__Balance__2C538F61] DEFAULT 0.0000
);

-- CreateTable
CREATE TABLE [dbo].[SalaryGenerate] (
    [RecdNo] INT NOT NULL,
    [StartDate] DATETIME,
    [EndDate] DATETIME,
    [Sno] INT NOT NULL,
    [EmpNo] VARCHAR(50),
    [BasicSalary] DECIMAL(16,3),
    [OTSalary] DECIMAL(16,3),
    [advance] DECIMAL(16,3),
    [BranchName] VARCHAR(50) NOT NULL,
    [AccType] VARCHAR(50) NOT NULL,
    [Present] DECIMAL(18,2) CONSTRAINT [DF__SalaryGen__Prese__2D47B39A] DEFAULT 0,
    [Absent] DECIMAL(18,2) CONSTRAINT [DF__SalaryGen__Absen__2E3BD7D3] DEFAULT 0,
    [TotalSalary] DECIMAL(16,2) CONSTRAINT [DF__SalaryGen__Total__2F2FFC0C] DEFAULT 0.00,
    [Bonus] DECIMAL(16,2) CONSTRAINT [DF__SalaryGen__Bonus__30242045] DEFAULT 0.00,
    [PF] DECIMAL(16,2) CONSTRAINT [DF__SalaryGenera__PF__3118447E] DEFAULT 0.00,
    CONSTRAINT [PK_SalaryGenerate] PRIMARY KEY CLUSTERED ([RecdNo],[Sno],[BranchName],[AccType])
);

-- CreateTable
CREATE TABLE [dbo].[sales] (
    [Trans_Type] VARCHAR(25),
    [CounterName] VARCHAR(25) NOT NULL,
    [BillNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [Trans_Time] VARCHAR(15),
    [Bill_Type] VARCHAR(10),
    [Customer] BIGINT,
    [Sno] INT NOT NULL,
    [ItemCode] BIGINT,
    [Qty] FLOAT(53) CONSTRAINT [DF__sales__Qty__5CA1C101] DEFAULT 0,
    [Units] VARCHAR(10),
    [UPer] FLOAT(53) CONSTRAINT [DF__sales__UPer__5D95E53A] DEFAULT 0,
    [SQty] FLOAT(53) CONSTRAINT [DF__sales__SQty__5E8A0973] DEFAULT 0,
    [Free] FLOAT(53) CONSTRAINT [DF__sales__Free__5F7E2DAC] DEFAULT 0,
    [Rate] DECIMAL(19,4) CONSTRAINT [DF__sales__Rate__607251E5] DEFAULT 0.0000,
    [SRate] DECIMAL(19,4) CONSTRAINT [DF__sales__SRate__6166761E] DEFAULT 0.0000,
    [LC] DECIMAL(19,4),
    [Amount] DECIMAL(19,3) CONSTRAINT [DF__sales__Amount__625A9A57] DEFAULT 0.000,
    [Discount] FLOAT(53) CONSTRAINT [DF__sales__Discount__634EBE90] DEFAULT 0,
    [DisAmt] MONEY CONSTRAINT [DF__sales__DisAmt__6442E2C9] DEFAULT 0,
    [Tax] FLOAT(53) CONSTRAINT [DF__sales__Tax__65370702] DEFAULT 0,
    [Sgst] FLOAT(53) CONSTRAINT [DF__sales__Sgst__662B2B3B] DEFAULT 0,
    [Cgst] FLOAT(53) CONSTRAINT [DF__sales__Cgst__671F4F74] DEFAULT 0,
    [Igst] FLOAT(53) CONSTRAINT [DF__sales__Igst__681373AD] DEFAULT 0,
    [SgstAmt] DECIMAL(19,4) CONSTRAINT [DF__sales__SgstAmt__690797E6] DEFAULT 0.0000,
    [CgstAmt] DECIMAL(19,4) CONSTRAINT [DF__sales__CgstAmt__69FBBC1F] DEFAULT 0.0000,
    [IgstAmt] DECIMAL(19,4) CONSTRAINT [DF__sales__IgstAmt__6AEFE058] DEFAULT 0.0000,
    [PackingCharges] DECIMAL(19,4) CONSTRAINT [DF__sales__PackingCh__6BE40491] DEFAULT 0.0000,
    [RoundOff] DECIMAL(19,4),
    [Labor] DECIMAL(19,4) CONSTRAINT [DF__sales__Labor__6CD828CA] DEFAULT 0.0000,
    [Convenience] DECIMAL(19,4) CONSTRAINT [DF__sales__Convenien__6DCC4D03] DEFAULT 0.0000,
    [Login] VARCHAR(25),
    [EditMode] VARCHAR(25),
    [LoginName] VARCHAR(25),
    [AccountName] VARCHAR(50),
    [WaiterName] VARCHAR(50),
    [CaptanName] VARCHAR(50),
    [Delivery] VARCHAR(50),
    [ComPerson] VARCHAR(50),
    [InvoiceType] VARCHAR(2),
    [Rate_Type] VARCHAR(20) CONSTRAINT [DF__sales__Rate_Type__6EC0713C] DEFAULT 'Maximum',
    [DCNo] BIGINT,
    [EstNo] VARCHAR(15),
    [ComPer] FLOAT(53),
    [SerChrgper] FLOAT(53),
    [ServiceChrg] FLOAT(53),
    [SalOrdNo] BIGINT,
    [EWayBill] VARCHAR(25),
    [System] VARCHAR(25),
    [Color] VARCHAR(300),
    [AccType] VARCHAR(20) NOT NULL,
    [Location] VARCHAR(50),
    [MRP] DECIMAL(19,4) CONSTRAINT [DF__sales__MRP__6FB49575] DEFAULT 0.0000,
    [QtyDis] DECIMAL(19,4) CONSTRAINT [DF__sales__QtyDis__70A8B9AE] DEFAULT 0.0000,
    [QtyDisAmt] DECIMAL(19,4) CONSTRAINT [DF__sales__QtyDisAmt__719CDDE7] DEFAULT 0.0000,
    [TableNo] VARCHAR(25),
    [BranchName] VARCHAR(50) NOT NULL CONSTRAINT [DF__sales__BranchNam__72910220] DEFAULT '',
    [AQty] FLOAT(53) CONSTRAINT [DF__sales__AQty__73852659] DEFAULT 0.000,
    [SMPer] DECIMAL(16,3) CONSTRAINT [DF__sales__SMPer__74794A92] DEFAULT 0.000,
    [SRPer] DECIMAL(16,3) CONSTRAINT [DF__sales__SRPer__756D6ECB] DEFAULT 0.000,
    [BillDis] DECIMAL(16,3) CONSTRAINT [DF__sales__BillDis__76619304] DEFAULT 0.000,
    [BillDisAmt] DECIMAL(16,2) CONSTRAINT [DF__sales__BillDisAm__7755B73D] DEFAULT 0.00,
    [GSPrint] VARCHAR(4) CONSTRAINT [DF__sales__GSPrint__7849DB76] DEFAULT 'No',
    [salesno] VARCHAR(50),
    [Onlinestatus] VARCHAR(25),
    [Psupply] VARCHAR(50),
    [S.P] DECIMAL(16,2) CONSTRAINT [DF__sales__S.P__793DFFAF] DEFAULT 0.00,
    [TaxStatus] VARCHAR(15),
    [Importstatus] VARCHAR(50),
    [BatchNo] VARCHAR(25),
    [NetValue] MONEY CONSTRAINT [DF__sales__NetValue__7A3223E8] DEFAULT 0,
    [IssueNo] BIGINT,
    [AdiCess] DECIMAL(19,2) CONSTRAINT [DF__sales__AdiCess__7B264821] DEFAULT 0.00,
    [CessP] DECIMAL(19,4) CONSTRAINT [DF__sales__CessP__7C1A6C5A] DEFAULT 0.00,
    [CessAmt] DECIMAL(19,3) CONSTRAINT [DF__sales__CessAmt__7D0E9093] DEFAULT 0.00,
    [Nos] VARCHAR(25),
    [TcsAmt] DECIMAL(19,3) CONSTRAINT [DF__sales__TcsAmt__7E02B4CC] DEFAULT 0.00,
    [TCSP] DECIMAL(19,4) CONSTRAINT [DF__sales__TCSP__7EF6D905] DEFAULT 0.00,
    [DeliveryDate] DATE,
    [JobCardNo] BIGINT,
    [QNo] BIGINT,
    [PurNo] BIGINT,
    [PerfomaNo] BIGINT,
    [FormName] VARCHAR(50),
    [PONum] VARCHAR(100),
    CONSTRAINT [PK__sales__C579B10AA4FFD00B] PRIMARY KEY CLUSTERED ([CounterName],[BillNo],[Sno],[AccType],[BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[SalesOrder] (
    [Trans_Type] VARCHAR(25),
    [SONo] BIGINT NOT NULL,
    [QNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [SO_Date] DATETIME,
    [Customer] BIGINT,
    [Sno] INT NOT NULL,
    [ItemCode] BIGINT,
    [Qty] FLOAT(53),
    [PQty] FLOAT(53),
    [Units] VARCHAR(10),
    [UPer] FLOAT(53),
    [SOQty] FLOAT(53),
    [Rate] MONEY,
    [SRate] DECIMAL(19,4),
    [LC] DECIMAL(19,4),
    [Amount] DECIMAL(19,4),
    [Discount] FLOAT(53),
    [DisAmt] MONEY,
    [Tax] FLOAT(53),
    [VatAmt] DECIMAL(19,4),
    [PackingCharges] DECIMAL(19,4),
    [RoundOff] DECIMAL(19,4),
    [Labor] DECIMAL(19,4),
    [Convenience] DECIMAL(19,4),
    [Login] VARCHAR(25),
    [EditMode] VARCHAR(25),
    [LoginName] VARCHAR(25),
    [WaiterName] VARCHAR(50),
    [CaptanName] VARCHAR(50),
    [Delivery] VARCHAR(50),
    [System] VARCHAR(25),
    [Color] VARCHAR(50),
    [AccType] VARCHAR(20) NOT NULL,
    [Location] VARCHAR(50),
    [MRP] DECIMAL(19,4),
    [Documents] VARCHAR(100),
    [NoOfQty] VARCHAR(20),
    [BranchName] VARCHAR(50) NOT NULL,
    [AQty] FLOAT(53),
    [SMPer] DECIMAL(16,3),
    [SRPer] DECIMAL(16,3),
    [BillDis] DECIMAL(16,3),
    [BillDisAmt] DECIMAL(16,2),
    [GSPrint] VARCHAR(4),
    [InvoiceNo] BIGINT,
    [Onlinestatus] VARCHAR(25),
    [PONO] VARCHAR(25) CONSTRAINT [DF__SalesOrder__PONO__320C68B7] DEFAULT 'NIL',
    [PurNO] VARCHAR(25) CONSTRAINT [DF__SalesOrde__PurNO__33008CF0] DEFAULT 'NIL',
    [SalesNO] VARCHAR(50) CONSTRAINT [DF__SalesOrde__Sales__33F4B129] DEFAULT 'NIL',
    [DCNO] VARCHAR(25) CONSTRAINT [DF__SalesOrder__DCNO__34E8D562] DEFAULT 'NIL',
    [DCQty] FLOAT(53) CONSTRAINT [DF__SalesOrde__DCQty__35DCF99B] DEFAULT 0,
    [RemQty] FLOAT(53) CONSTRAINT [DF__SalesOrde__RemQt__36D11DD4] DEFAULT 0,
    [CPoNo] VARCHAR(100),
    [VPoNo] BIGINT,
    [MobSONo] VARCHAR(15),
    [BatchNo] VARCHAR(50),
    [ReminQty] FLOAT(53) CONSTRAINT [DF__SalesOrde__Remin__37C5420D] DEFAULT 0,
    CONSTRAINT [PK__SalesOrd__4BE438A52D48E504] PRIMARY KEY CLUSTERED ([SONo],[Sno],[AccType],[BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[salesreturn] (
    [Trans_Type] VARCHAR(25),
    [BillNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [Trans_Time] VARCHAR(15),
    [Sno] INT NOT NULL,
    [InvoiceType] VARCHAR(2),
    [Bill_Type] VARCHAR(10),
    [Customer] BIGINT CONSTRAINT [DF__salesretu__Custo__38B96646] DEFAULT 0,
    [ItemCode] BIGINT CONSTRAINT [DF__salesretu__ItemC__39AD8A7F] DEFAULT 0,
    [Qty] FLOAT(53),
    [Units] VARCHAR(10),
    [UnitPer] FLOAT(53) CONSTRAINT [DF__salesretu__UnitP__3AA1AEB8] DEFAULT 0,
    [SRQty] DECIMAL(16,3) CONSTRAINT [DF__salesretu__SRQty__3B95D2F1] DEFAULT 0.000,
    [Rate] DECIMAL(16,3),
    [SRate] DECIMAL(19,4) CONSTRAINT [DF__salesretu__SRate__3C89F72A] DEFAULT 0.0000,
    [DCNo] INT,
    [Amount] DECIMAL(19,4) CONSTRAINT [DF__salesretu__Amoun__3D7E1B63] DEFAULT 0.0000,
    [Discount] FLOAT(53) CONSTRAINT [DF__salesretu__Disco__3E723F9C] DEFAULT 0,
    [DisAmt] DECIMAL(19,4) CONSTRAINT [DF__salesretu__DisAm__3F6663D5] DEFAULT 0.0000,
    [Tax] FLOAT(53) CONSTRAINT [DF__salesreturn__Tax__405A880E] DEFAULT 0,
    [Sgst] FLOAT(53) CONSTRAINT [DF__salesretur__Sgst__414EAC47] DEFAULT 0,
    [Cgst] FLOAT(53) CONSTRAINT [DF__salesretur__Cgst__4242D080] DEFAULT 0,
    [Igst] FLOAT(53) CONSTRAINT [DF__salesretur__Igst__4336F4B9] DEFAULT 0,
    [AQty] DECIMAL(16,3),
    [LC] DECIMAL(16,3),
    [SgstAmt] DECIMAL(19,4) CONSTRAINT [DF__salesretu__SgstA__442B18F2] DEFAULT 0.0000,
    [CgstAmt] DECIMAL(19,4) CONSTRAINT [DF__salesretu__CgstA__451F3D2B] DEFAULT 0.0000,
    [IgstAmt] DECIMAL(19,4) CONSTRAINT [DF__salesretu__IgstA__46136164] DEFAULT 0.0000,
    [Account] VARCHAR(50) CONSTRAINT [DF__salesretu__Accou__4707859D] DEFAULT '0',
    [PackingCharges] DECIMAL(19,4) CONSTRAINT [DF__salesretu__Packi__47FBA9D6] DEFAULT 0.0000,
    [RoundOff] DECIMAL(19,4) CONSTRAINT [DF__salesretu__Round__48EFCE0F] DEFAULT 0.0000,
    [WaiterName] VARCHAR(50),
    [CaptanName] VARCHAR(50),
    [Comperson] VARCHAR(50),
    [Color] VARCHAR(50),
    [Comper] FLOAT(53),
    [ComRs] DECIMAL(19,4),
    [SalesNo] INT,
    [SMPer] DECIMAL(16,3),
    [SRPer] DECIMAL(16,3),
    [Labor] DECIMAL(16,3),
    [Convenience] DECIMAL(16,3),
    [Delivery] VARCHAR(50),
    [Documents] VARCHAR(50),
    [NoOfQty] VARCHAR(20),
    [System] VARCHAR(50),
    [Login] VARCHAR(25),
    [EditMode] VARCHAR(25),
    [LoginName] VARCHAR(25),
    [AccType] VARCHAR(20) NOT NULL,
    [Location] VARCHAR(50),
    [CounterName] VARCHAR(25) NOT NULL,
    [BranchName] VARCHAR(50) NOT NULL CONSTRAINT [DF__salesretu__Branc__49E3F248] DEFAULT '',
    [MRP] DECIMAL(16,2) CONSTRAINT [DF__salesreturn__MRP__4AD81681] DEFAULT 0.00,
    [BatchNo] VARCHAR(25),
    [CessAmt] DECIMAL(16,2) CONSTRAINT [DF__salesretu__CessA__4BCC3ABA] DEFAULT 0,
    [InvoiceNo] VARCHAR(25),
    [InvoiceDate] DATE,
    [ReasonIssueNote] VARCHAR(25),
    [NoteType] VARCHAR(25),
    [SalesRepName] VARCHAR(50),
    CONSTRAINT [salesret_pk] PRIMARY KEY CLUSTERED ([BillNo],[Sno],[AccType],[BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[SearchColumn] (
    [FieldsName] VARCHAR(50),
    [FieldsWidth] FLOAT(53)
);

-- CreateTable
CREATE TABLE [dbo].[selecte] (
    [ReportType] VARCHAR(20),
    [ReportName] VARCHAR(50),
    [SelectFields] VARCHAR(50),
    [Selectfieldss] VARCHAR(50),
    [TableName] VARCHAR(50),
    [SNo] INT
);

-- CreateTable
CREATE TABLE [dbo].[selecttable] (
    [FieldsName] VARCHAR(255),
    [TableName] VARCHAR(50),
    [Description] VARCHAR(50),
    [ReportName] VARCHAR(50),
    [Relationship] VARCHAR(100),
    [Sno] FLOAT(53) CONSTRAINT [DF__selecttable__Sno__0697FACD] DEFAULT 0
);

-- CreateTable
CREATE TABLE [dbo].[showcolumn] (
    [FormName] VARCHAR(50) NOT NULL CONSTRAINT [DF__showcolum__FormN__4CC05EF3] DEFAULT '',
    [ColumnName] VARCHAR(50) NOT NULL CONSTRAINT [DF__showcolum__Colum__4DB4832C] DEFAULT '',
    [isTrue] VARCHAR(50),
    [System] VARCHAR(50) NOT NULL CONSTRAINT [DF__showcolum__Syste__4EA8A765] DEFAULT '',
    [ColumnWidth] VARCHAR(10),
    CONSTRAINT [PK__showcolu__6B86EABE25481F16] PRIMARY KEY CLUSTERED ([FormName],[ColumnName],[System])
);

-- CreateTable
CREATE TABLE [dbo].[showcolumns] (
    [FormName] VARCHAR(50) NOT NULL,
    [SysNamee] VARCHAR(50) NOT NULL,
    [ColName] VARCHAR(50) NOT NULL,
    [ColWidth] VARCHAR(50),
    [SNo] INT CONSTRAINT [DF__showcolumns__SNo__0B5CAFEA] DEFAULT 0,
    CONSTRAINT [PK__showcolu__83774BE9A365D04E] PRIMARY KEY CLUSTERED ([FormName],[SysNamee],[ColName])
);

-- CreateTable
CREATE TABLE [dbo].[stock] (
    [BranchName] VARCHAR(50) NOT NULL CONSTRAINT [DF__stock__BranchNam__0D44F85C] DEFAULT '',
    [Location] VARCHAR(50) NOT NULL CONSTRAINT [DF__stock__Location__0E391C95] DEFAULT '',
    [ItemCode] BIGINT NOT NULL CONSTRAINT [DF__stock__ItemCode__0F2D40CE] DEFAULT 0,
    [OQty] FLOAT(53) CONSTRAINT [DF__stock__OQty__10216507] DEFAULT 0,
    [PQty] FLOAT(53) CONSTRAINT [DF__stock__PQty__11158940] DEFAULT 0,
    [PRQty] FLOAT(53) CONSTRAINT [DF__stock__PRQty__1209AD79] DEFAULT 0,
    [SQty] FLOAT(53) CONSTRAINT [DF__stock__SQty__12FDD1B2] DEFAULT 0,
    [Free] FLOAT(53) CONSTRAINT [DF__stock__Free__13F1F5EB] DEFAULT 0,
    [SRQty] FLOAT(53) CONSTRAINT [DF__stock__SRQty__14E61A24] DEFAULT 0,
    [SCQty] FLOAT(53) CONSTRAINT [DF__stock__SCQty__15DA3E5D] DEFAULT 0,
    [SIQty] FLOAT(53) CONSTRAINT [DF__stock__SIQty__16CE6296] DEFAULT 0,
    [STQty] FLOAT(53) CONSTRAINT [DF__stock__STQty__17C286CF] DEFAULT 0,
    [LTQty] FLOAT(53) CONSTRAINT [DF__stock__LTQty__18B6AB08] DEFAULT 0,
    [AQty] FLOAT(53) CONSTRAINT [DF__stock__AQty__19AACF41] DEFAULT 0,
    [LC] FLOAT(53) CONSTRAINT [DF__stock__LC__1A9EF37A] DEFAULT 0,
    [SystemName] VARCHAR(50) NOT NULL CONSTRAINT [DF__stock__SystemNam__1B9317B3] DEFAULT '',
    [Disper] VARCHAR(50),
    [BatchNo] VARCHAR(50),
    [MRP] DECIMAL(16,2) CONSTRAINT [DF__stock__MRP__1C873BEC] DEFAULT 0.00
);

-- CreateTable
CREATE TABLE [dbo].[StockCorrection] (
    [Trans_Type] VARCHAR(25) NOT NULL,
    [BillNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [Sno] INT NOT NULL,
    [ItemCode] BIGINT CONSTRAINT [DF__StockCorr__ItemC__4F9CCB9E] DEFAULT 0,
    [Amount] DECIMAL(19,4) CONSTRAINT [DF__StockCorr__Amoun__5090EFD7] DEFAULT 0.0000,
    [Login] VARCHAR(15),
    [LoginName] VARCHAR(25),
    [System] VARCHAR(50),
    [PhQty] FLOAT(53),
    [APQty] FLOAT(53) CONSTRAINT [DF__StockCorr__APQty__51851410] DEFAULT 0,
    [ALQty] FLOAT(53) CONSTRAINT [DF__StockCorr__ALQty__52793849] DEFAULT 0,
    [LC] DECIMAL(19,4) CONSTRAINT [DF__StockCorrect__LC__536D5C82] DEFAULT 0.0000,
    [EditMode] VARCHAR(3) CONSTRAINT [DF__StockCorr__EditM__546180BB] DEFAULT 'No',
    [AccType] VARCHAR(20) NOT NULL,
    [Location] VARCHAR(50),
    [BranchName] VARCHAR(50) NOT NULL CONSTRAINT [DF__StockCorr__Branc__5555A4F4] DEFAULT '',
    [MRP] DECIMAL(16,2) CONSTRAINT [DF__StockCorrec__MRP__5649C92D] DEFAULT 0.00,
    [BatchNo] VARCHAR(25),
    CONSTRAINT [PK__StockCor__FDE99791863FF917] PRIMARY KEY CLUSTERED ([BillNo],[Sno],[AccType],[BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[StockIssue] (
    [IssueNo] BIGINT NOT NULL,
    [Trans_Date] DATETIME,
    [JobCardNo] VARCHAR(25),
    [Remarks] VARCHAR(50),
    [Sno] INT NOT NULL,
    [ItemCode] BIGINT,
    [SIQty] FLOAT(53) CONSTRAINT [DF__StockIssu__SIQty__573DED66] DEFAULT 0,
    [SQty] FLOAT(53) CONSTRAINT [DF__StockIssue__SQty__5832119F] DEFAULT 0,
    [ReminQty] FLOAT(53) CONSTRAINT [DF__StockIssu__Remin__592635D8] DEFAULT 0,
    [Units] VARCHAR(10),
    [Rate] DECIMAL(19,4) CONSTRAINT [DF__StockIssue__Rate__5A1A5A11] DEFAULT 0.0000,
    [Amount] DECIMAL(19,4) CONSTRAINT [DF__StockIssu__Amoun__5B0E7E4A] DEFAULT 0.0000,
    [AvailQty] DECIMAL(16,3),
    [Color] VARCHAR(50),
    [UnitPer] FLOAT(53) CONSTRAINT [DF__StockIssu__UnitP__5C02A283] DEFAULT 0,
    [BatchNo] VARCHAR(25),
    [WaiterName] VARCHAR(50),
    [LC] DECIMAL(19,4),
    [MRP] DECIMAL(19,4),
    [Location] VARCHAR(50),
    [BranchName] VARCHAR(50) NOT NULL,
    [AccType] VARCHAR(20) NOT NULL,
    [PBillNo] BIGINT,
    [SalesMan] VARCHAR(50),
    [SRate] MONEY,
    [GST] FLOAT(53),
    [GSTAmt] MONEY,
    [TaxStatus] VARCHAR(10),
    [TechnicianName] VARCHAR(50),
    [Qty] FLOAT(53),
    CONSTRAINT [PK__StockIss__809DDC7EDC463F64] PRIMARY KEY CLUSTERED ([IssueNo],[Sno],[AccType],[BranchName])
);

-- CreateTable
CREATE TABLE [dbo].[stockleadger] (
    [TransDate] DATETIME,
    [Trans_Type] VARCHAR(50),
    [Particulars] VARCHAR(100),
    [Inward] FLOAT(53) CONSTRAINT [DF__stocklead__Inwar__5CF6C6BC] DEFAULT 0,
    [Outward] FLOAT(53) CONSTRAINT [DF__stocklead__Outwa__5DEAEAF5] DEFAULT 0,
    [ClosingStock] FLOAT(53) CONSTRAINT [DF__stocklead__Closi__5EDF0F2E] DEFAULT 0,
    [System] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[tablemaster] (
    [TableNo] VARCHAR(25) NOT NULL,
    [TableStatus] VARCHAR(25),
    [Tableavailabilty] VARCHAR(25),
    [createddate] DATETIME,
    [section] VARCHAR(25),
    [sno] INT,
    [RateType] VARCHAR(20),
    [NoOfPrint] INT CONSTRAINT [DF__tablemast__NoOfP__24285DB4] DEFAULT 0,
    [LoginName] VARCHAR(25),
    CONSTRAINT [PK__tablemas__7D5F09DD8F1BB818] PRIMARY KEY CLUSTERED ([TableNo])
);

-- CreateTable
CREATE TABLE [dbo].[tempshowcols] (
    [SystemName] VARCHAR(50) NOT NULL,
    [FormName] VARCHAR(50) NOT NULL,
    [ColName] VARCHAR(50),
    [Colwidth] INT CONSTRAINT [DF__tempshowc__Colwi__5FD33367] DEFAULT 0,
    CONSTRAINT [PK__tempshow__4C180F0B97A8899E] PRIMARY KEY CLUSTERED ([SystemName],[FormName])
);

-- CreateTable
CREATE TABLE [dbo].[tempshowcolss] (
    [SystemName] VARCHAR(50) NOT NULL,
    [FormName] VARCHAR(50) NOT NULL,
    [ColName] VARCHAR(50),
    [Colwidth] INT CONSTRAINT [DF__tempshowc__Colwi__60C757A0] DEFAULT 0,
    CONSTRAINT [PK__tempshow__4C180F0BF48D553A] PRIMARY KEY CLUSTERED ([SystemName],[FormName])
);

-- CreateTable
CREATE TABLE [dbo].[terms] (
    [FormName] VARCHAR(50) NOT NULL,
    [Terms] VARCHAR(50),
    [Alignment] VARCHAR(2),
    [LoginName] VARCHAR(50),
    CONSTRAINT [PK__terms__81B78A2E8E687415] PRIMARY KEY CLUSTERED ([FormName])
);

-- CreateTable
CREATE TABLE [dbo].[TermsCondition] (
    [RecdNo] BIGINT NOT NULL,
    [Category] VARCHAR(50),
    [TermsCon] VARCHAR(500),
    CONSTRAINT [PK_TermsCondition] PRIMARY KEY CLUSTERED ([RecdNo])
);

-- CreateTable
CREATE TABLE [dbo].[testsum] (
    [itemcode] BIGINT,
    [Qty] DECIMAL(16,3),
    [LC] DECIMAL(16,3),
    [totqty] DECIMAL(16,3),
    [TRANS_DATE] DATETIME,
    [location] VARCHAR(50),
    [BranchName] VARCHAR(50),
    [Acctype] VARCHAR(50),
    [SystemName] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[TmpSales] (
    [BillNo] BIGINT,
    [Customer] BIGINT,
    [IgstAmt] DECIMAL(16,2),
    [CgstAmt] DECIMAL(16,2),
    [SgstAmt] DECIMAL(16,2),
    [NetAmt] DECIMAL(16,2),
    [Trans_Date] DATETIME,
    [GST] FLOAT(53),
    [TaxValue] DECIMAL(16,2),
    [CessAmt] DECIMAL(19,2) CONSTRAINT [DF__TmpSales__CessAm__61BB7BD9] DEFAULT 0.00
);

-- CreateTable
CREATE TABLE [dbo].[tmpstock] (
    [Location] VARCHAR(50),
    [ItemCode] BIGINT CONSTRAINT [DF__tmpstock__ItemCo__62AFA012] DEFAULT 0,
    [Qty] FLOAT(53) CONSTRAINT [DF__tmpstock__Qty__63A3C44B] DEFAULT 0,
    [SystemName] VARCHAR(50),
    [BranchName] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[tradestock] (
    [BranchName] VARCHAR(50),
    [Location] VARCHAR(50),
    [ItemCode] BIGINT CONSTRAINT [DF__tradestoc__ItemC__6497E884] DEFAULT 0,
    [UnitPer] FLOAT(53) CONSTRAINT [DF__tradestoc__UnitP__658C0CBD] DEFAULT 0,
    [Cost] DECIMAL(16,3),
    [Type] VARCHAR(50),
    [InWgt] DECIMAL(16,3) CONSTRAINT [DF__tradestoc__InWgt__668030F6] DEFAULT 0.000,
    [OutWgt] DECIMAL(16,3) CONSTRAINT [DF__tradestoc__OutWg__6774552F] DEFAULT 0.000,
    [Tot] DECIMAL(16,3),
    [SystemName] VARCHAR(50),
    [AccType] VARCHAR(25)
);

-- CreateTable
CREATE TABLE [dbo].[trs] (
    [AccountName] VARCHAR(50),
    [Type] VARCHAR(8),
    [Balance] DECIMAL(19,4) CONSTRAINT [DF__trs__Balance__68687968] DEFAULT 0.0000,
    [OrderBy] INT CONSTRAINT [DF__trs__OrderBy__695C9DA1] DEFAULT 0
);

-- CreateTable
CREATE TABLE [dbo].[typeofaccounts] (
    [GroupName] VARCHAR(50) NOT NULL,
    [Location] VARCHAR(25),
    [Type] VARCHAR(7),
    [OrderBy] INT CONSTRAINT [DF__typeofacc__Order__336AA144] DEFAULT 0,
    CONSTRAINT [PK__typeofac__6EFCD43502856B7D] PRIMARY KEY CLUSTERED ([GroupName])
);

-- CreateTable
CREATE TABLE [dbo].[user_details] (
    [Uname] VARCHAR(25),
    [MName] VARCHAR(50),
    [WMenu] VARCHAR(100),
    [View] VARCHAR(5),
    [New] VARCHAR(5),
    [Edit] VARCHAR(5),
    [Delete] VARCHAR(5),
    [Deleted] VARCHAR(50)
);

-- CreateTable
CREATE TABLE [dbo].[userslist] (
    [Uname] VARCHAR(25) NOT NULL,
    [PW] VARCHAR(50),
    [MobilePWD] VARCHAR(50),
    [Photo] IMAGE,
    [Status] VARCHAR(10),
    [LoginStatus] VARCHAR(15) CONSTRAINT [DF__userslist__Login__373B3228] DEFAULT 'Logout',
    [SystemName] VARCHAR(50),
    [BranchName] VARCHAR(50),
    CONSTRAINT [PK__userslis__9C5CAF9B34809B16] PRIMARY KEY CLUSTERED ([Uname])
);

-- CreateTable
CREATE TABLE [dbo].[Vendormaster] (
    [Vendor] INT NOT NULL CONSTRAINT [DF__Vendormas__Vendo__6A50C1DA] DEFAULT 0,
    [VendorName] VARCHAR(50),
    [Address] VARCHAR(50),
    [Address1] VARCHAR(50),
    [City] VARCHAR(50),
    [State] VARCHAR(25),
    [Postal] VARCHAR(20),
    [Country] VARCHAR(25),
    [ContactPerson] VARCHAR(50),
    [Phone] VARCHAR(25),
    [Mobile] VARCHAR(25),
    [Terms] INT,
    [Limit] DECIMAL(19,4),
    [ImgPhoto] IMAGE,
    [Fax] VARCHAR(20),
    [EMail] VARCHAR(50),
    [Login] VARCHAR(25),
    [LoginName] VARCHAR(25),
    [ActiveStatus] VARCHAR(15),
    [AccountName] VARCHAR(50),
    [TINNo] VARCHAR(25),
    [CST] VARCHAR(25),
    [IAC] VARCHAR(25),
    [Area] VARCHAR(25),
    [RateType] VARCHAR(15),
    [Web] VARCHAR(50),
    [DOB] DATETIME,
    [DOW] DATETIME,
    [InvoiceType] VARCHAR(50) CONSTRAINT [DF__Vendormas__Invoi__6B44E613] DEFAULT 'R',
    [BankAcctName] VARCHAR(50),
    [AcctNo] VARCHAR(50),
    [BankName] VARCHAR(50),
    [IFSCCode] VARCHAR(20),
    [DelDays] BIGINT CONSTRAINT [DF__Vendormas__DelDa__6C390A4C] DEFAULT 0,
    [BBranchName] VARCHAR(50),
    [TCS] FLOAT(53) CONSTRAINT [DF__Vendormaste__TCS__6D2D2E85] DEFAULT 0,
    CONSTRAINT [PK__Vendorma__42A527B3B82E9E51] PRIMARY KEY CLUSTERED ([Vendor])
);

-- CreateTable
CREATE TABLE [dbo].[WaiterMaster] (
    [WaiterName] VARCHAR(50) NOT NULL,
    [ContactNo] VARCHAR(50),
    [Address] VARCHAR(50),
    [City] VARCHAR(50),
    [AccountName] VARCHAR(50),
    [ActiveStatus] VARCHAR(15) CONSTRAINT [DF__WaiterMas__Activ__3BFFE745] DEFAULT 'Active',
    [Imgphoto] VARCHAR(50),
    [Login] VARCHAR(25),
    [LoginName] VARCHAR(50) CONSTRAINT [DF__WaiterMas__Login__3CF40B7E] DEFAULT 'Administrator',
    [MPin] VARCHAR(5),
    CONSTRAINT [PK__WaiterMa__D2078AB5DE1704B5] PRIMARY KEY CLUSTERED ([WaiterName])
);

-- AddForeignKey
ALTER TABLE [dbo].[account_transaction] ADD CONSTRAINT [FK_ACC_counter] FOREIGN KEY ([CounterName]) REFERENCES [dbo].[billingcounter]([CounterName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[account_transaction] ADD CONSTRAINT [FK_Act_ActNm] FOREIGN KEY ([AccountName]) REFERENCES [dbo].[accountmaster]([AccountName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[account_transaction] ADD CONSTRAINT [FK_users_role_map] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Attendance] ADD CONSTRAINT [FK_ATT_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Attendance] ADD CONSTRAINT [FK_Att_Emp] FOREIGN KEY ([EmpNo]) REFERENCES [dbo].[EmployeeMaster]([EmpNo]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[billcollection] ADD CONSTRAINT [FK_billc_cust] FOREIGN KEY ([Customer]) REFERENCES [dbo].[customermaster]([Customer]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[billcollection] ADD CONSTRAINT [FK_billCollt_counter] FOREIGN KEY ([CounterName]) REFERENCES [dbo].[billingcounter]([CounterName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[billcollection] ADD CONSTRAINT [FK_SALES_man] FOREIGN KEY ([WaiterName]) REFERENCES [dbo].[WaiterMaster]([WaiterName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[CreditNotes] ADD CONSTRAINT [FK_Credit_counter] FOREIGN KEY ([CounterName]) REFERENCES [dbo].[billingcounter]([CounterName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[DebitNotes] ADD CONSTRAINT [FK_DebitNote_counter] FOREIGN KEY ([CounterName]) REFERENCES [dbo].[billingcounter]([CounterName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[deliverychelan] ADD CONSTRAINT [FK_delCha_cust] FOREIGN KEY ([Customer]) REFERENCES [dbo].[customermaster]([Customer]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[deliverychelan] ADD CONSTRAINT [FK_delCha_item] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[deliverychelan] ADD CONSTRAINT [FK_delChellan_branch] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[deliverychelan] ADD CONSTRAINT [FK_delChellan_loc] FOREIGN KEY ([Location]) REFERENCES [dbo].[locationmaster]([Location]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[DiscountMaster] ADD CONSTRAINT [FK_ItemDisM] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Esales] ADD CONSTRAINT [FK_ESales_map] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[itemmaster] ADD CONSTRAINT [FK_ItemMaterCategory] FOREIGN KEY ([Category]) REFERENCES [dbo].[categorymaster]([Category]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[locationtransfer] ADD CONSTRAINT [FK_locTrans_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[locationtransfer] ADD CONSTRAINT [FK_locTrans_item] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[locationtransfer] ADD CONSTRAINT [FK_locTrans_loc] FOREIGN KEY ([Location]) REFERENCES [dbo].[locationmaster]([Location]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[MakeEntry] ADD CONSTRAINT [FK_MakeEntry_accmaster] FOREIGN KEY ([Name]) REFERENCES [dbo].[accountmaster]([AccountName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Openingstock] ADD CONSTRAINT [FK_op_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Openingstock] ADD CONSTRAINT [FK_opStk_ActNam] FOREIGN KEY ([Account]) REFERENCES [dbo].[accountmaster]([AccountName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Openingstock] ADD CONSTRAINT [FK_opStk_item] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Openingstock] ADD CONSTRAINT [FK_opStk_loc] FOREIGN KEY ([Location]) REFERENCES [dbo].[locationmaster]([Location]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[OrderMaster] ADD CONSTRAINT [FK_OM_IM] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[OrderMaster] ADD CONSTRAINT [FK_OM_TM] FOREIGN KEY ([TableNo]) REFERENCES [dbo].[tablemaster]([TableNo]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[OutdoorOrder] ADD CONSTRAINT [FK_OOrder_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[OutdoorOrder] ADD CONSTRAINT [FK_OOrder_Customer] FOREIGN KEY ([Customer]) REFERENCES [dbo].[customermaster]([Customer]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[OutdoorOrder] ADD CONSTRAINT [FK_OOrder_item] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[OutdoorOrder] ADD CONSTRAINT [FK_OOrder_Waiter] FOREIGN KEY ([WaiterName]) REFERENCES [dbo].[WaiterMaster]([WaiterName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[packingmaterial] ADD CONSTRAINT [FK_pak_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[packingmaterial] ADD CONSTRAINT [FK_pkMat_item] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[packingmaterial] ADD CONSTRAINT [FK_pkMat_loc] FOREIGN KEY ([Location]) REFERENCES [dbo].[locationmaster]([Location]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[paybills] ADD CONSTRAINT [FK_pBill_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[paybills] ADD CONSTRAINT [FK_pBill_cust] FOREIGN KEY ([Vendor]) REFERENCES [dbo].[Vendormaster]([Vendor]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[payments] ADD CONSTRAINT [FK_pay_ActNamFrm] FOREIGN KEY ([DebitAccount]) REFERENCES [dbo].[accountmaster]([AccountName]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[payments] ADD CONSTRAINT [FK_pay_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[payments] ADD CONSTRAINT [FK_payActNamTo] FOREIGN KEY ([CreditAccount]) REFERENCES [dbo].[accountmaster]([AccountName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[payments] ADD CONSTRAINT [FK_paym_Ven] FOREIGN KEY ([Vendor]) REFERENCES [dbo].[Vendormaster]([Vendor]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[pendinglist] ADD CONSTRAINT [FK_pay_ActNam] FOREIGN KEY ([AccountName]) REFERENCES [dbo].[accountmaster]([AccountName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[pendinglist] ADD CONSTRAINT [FK_pend_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[pendingtemp] ADD CONSTRAINT [FK_pendTemp_ActNam] FOREIGN KEY ([AccountName]) REFERENCES [dbo].[accountmaster]([AccountName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[pendingtemp] ADD CONSTRAINT [FK_pendTemp_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Perfoma] ADD CONSTRAINT [FK_per_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Perfoma] ADD CONSTRAINT [FK_per_cust] FOREIGN KEY ([Customer]) REFERENCES [dbo].[customermaster]([Customer]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Perfoma] ADD CONSTRAINT [FK_per_item] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[purchase] ADD CONSTRAINT [FK_pur_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[purchase] ADD CONSTRAINT [FK_pur_item] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[purchase] ADD CONSTRAINT [FK_pur_loc] FOREIGN KEY ([Location]) REFERENCES [dbo].[locationmaster]([Location]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[purchase] ADD CONSTRAINT [FK_pur_Ven] FOREIGN KEY ([Vendor]) REFERENCES [dbo].[Vendormaster]([Vendor]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[purchase] ADD CONSTRAINT [FK_purc_ActNam] FOREIGN KEY ([Account]) REFERENCES [dbo].[accountmaster]([AccountName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[purchaseOrder] ADD CONSTRAINT [FK_purord_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[purchaseOrder] ADD CONSTRAINT [FK_purord_item] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[purchaseOrder] ADD CONSTRAINT [FK_purord_loc] FOREIGN KEY ([Location]) REFERENCES [dbo].[locationmaster]([Location]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[purchaseOrder] ADD CONSTRAINT [FK_purord_Ven] FOREIGN KEY ([Vendor]) REFERENCES [dbo].[Vendormaster]([Vendor]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[purchasereturn] ADD CONSTRAINT [FK_purcRet_ActNam] FOREIGN KEY ([Account]) REFERENCES [dbo].[accountmaster]([AccountName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[purchasereturn] ADD CONSTRAINT [FK_purRet_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[purchasereturn] ADD CONSTRAINT [FK_purRET_item] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[purchasereturn] ADD CONSTRAINT [FK_purRET_loc] FOREIGN KEY ([Location]) REFERENCES [dbo].[locationmaster]([Location]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[purchasereturn] ADD CONSTRAINT [FK_purRET_Ven] FOREIGN KEY ([Vendor]) REFERENCES [dbo].[Vendormaster]([Vendor]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[quotation] ADD CONSTRAINT [FK_quo_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[quotation] ADD CONSTRAINT [FK_quo_item] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[quotation] ADD CONSTRAINT [FK_quot_counter] FOREIGN KEY ([CounterName]) REFERENCES [dbo].[billingcounter]([CounterName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[quotation] ADD CONSTRAINT [FK_quot_cust] FOREIGN KEY ([Customer]) REFERENCES [dbo].[customermaster]([Customer]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[QuotationTerms] ADD CONSTRAINT [FK_Term_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[QuotationTerms] ADD CONSTRAINT [FK_Term_counter] FOREIGN KEY ([CounterName]) REFERENCES [dbo].[billingcounter]([CounterName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[ReceivePayment] ADD CONSTRAINT [FK_rec_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[ReceivePayment] ADD CONSTRAINT [FK_rec_counter] FOREIGN KEY ([CounterName]) REFERENCES [dbo].[billingcounter]([CounterName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[ReceivePayment] ADD CONSTRAINT [FK_rec_cust] FOREIGN KEY ([Customer]) REFERENCES [dbo].[customermaster]([Customer]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[rt] ADD CONSTRAINT [FK_rt_ActNam] FOREIGN KEY ([AccountName]) REFERENCES [dbo].[accountmaster]([AccountName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[rt] ADD CONSTRAINT [FK_rt_loc] FOREIGN KEY ([Location]) REFERENCES [dbo].[locationmaster]([Location]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[sales] ADD CONSTRAINT [FK_Sales_ActNam] FOREIGN KEY ([AccountName]) REFERENCES [dbo].[accountmaster]([AccountName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[sales] ADD CONSTRAINT [FK_sales_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[sales] ADD CONSTRAINT [FK_SALES_counter] FOREIGN KEY ([CounterName]) REFERENCES [dbo].[billingcounter]([CounterName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[sales] ADD CONSTRAINT [FK_sales_cust] FOREIGN KEY ([Customer]) REFERENCES [dbo].[customermaster]([Customer]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[sales] ADD CONSTRAINT [FK_Sales_item] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[sales] ADD CONSTRAINT [FK_sales_loc] FOREIGN KEY ([Location]) REFERENCES [dbo].[locationmaster]([Location]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[sales] ADD CONSTRAINT [FK_SALES_SalesREp] FOREIGN KEY ([CaptanName]) REFERENCES [dbo].[CaptanMaster]([CaptanName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[sales] ADD CONSTRAINT [FK_Sales_Table] FOREIGN KEY ([TableNo]) REFERENCES [dbo].[tablemaster]([TableNo]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[sales] ADD CONSTRAINT [FK_Sales_WaiterMaster] FOREIGN KEY ([WaiterName]) REFERENCES [dbo].[WaiterMaster]([WaiterName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[SalesOrder] ADD CONSTRAINT [FK_salesord_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[SalesOrder] ADD CONSTRAINT [FK_salesord_CaptanMaster] FOREIGN KEY ([CaptanName]) REFERENCES [dbo].[CaptanMaster]([CaptanName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[SalesOrder] ADD CONSTRAINT [FK_salesord_Customer] FOREIGN KEY ([Customer]) REFERENCES [dbo].[customermaster]([Customer]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[SalesOrder] ADD CONSTRAINT [FK_salesord_item] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[SalesOrder] ADD CONSTRAINT [FK_salesord_WaiterMaster] FOREIGN KEY ([WaiterName]) REFERENCES [dbo].[WaiterMaster]([WaiterName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[salesreturn] ADD CONSTRAINT [FK_salesRet_counter] FOREIGN KEY ([CounterName]) REFERENCES [dbo].[billingcounter]([CounterName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[salesreturn] ADD CONSTRAINT [FK_salesRet_cust] FOREIGN KEY ([Customer]) REFERENCES [dbo].[customermaster]([Customer]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[salesreturn] ADD CONSTRAINT [FK_salesRet_item] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[salesreturn] ADD CONSTRAINT [FK_salesREt_loc] FOREIGN KEY ([Location]) REFERENCES [dbo].[locationmaster]([Location]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[salesreturn] ADD CONSTRAINT [FK_salesRt_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[stock] ADD CONSTRAINT [FK_stock_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[StockCorrection] ADD CONSTRAINT [FK_stockCrt_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[StockCorrection] ADD CONSTRAINT [FK_stockCrt_item] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[StockCorrection] ADD CONSTRAINT [FK_stockCrt_loc] FOREIGN KEY ([Location]) REFERENCES [dbo].[locationmaster]([Location]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[StockIssue] ADD CONSTRAINT [FK_Stockissue_branch] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[StockIssue] ADD CONSTRAINT [FK_Stockissue_item] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[StockIssue] ADD CONSTRAINT [FK_Stockissue_loc] FOREIGN KEY ([Location]) REFERENCES [dbo].[locationmaster]([Location]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[StockIssue] ADD CONSTRAINT [FK_Stockissue_SalMa] FOREIGN KEY ([WaiterName]) REFERENCES [dbo].[WaiterMaster]([WaiterName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[tmpstock] ADD CONSTRAINT [FK_tmpStock_item] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[tradestock] ADD CONSTRAINT [FK_trdStock_br] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[tradestock] ADD CONSTRAINT [FK_trdStock_item] FOREIGN KEY ([ItemCode]) REFERENCES [dbo].[itemmaster]([ItemCode]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[tradestock] ADD CONSTRAINT [FK_trdStock_loc] FOREIGN KEY ([Location]) REFERENCES [dbo].[locationmaster]([Location]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[trs] ADD CONSTRAINT [FK_trs_ActNam] FOREIGN KEY ([AccountName]) REFERENCES [dbo].[accountmaster]([AccountName]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[userslist] ADD CONSTRAINT [FK_ULBM] FOREIGN KEY ([BranchName]) REFERENCES [dbo].[branchmaster]([BranchName]) ON DELETE NO ACTION ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH

