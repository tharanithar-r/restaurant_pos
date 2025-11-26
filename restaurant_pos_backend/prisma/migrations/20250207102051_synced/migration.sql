BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[account_transaction] DROP CONSTRAINT [DF__account_t__Amoun__117F9D94],
[DF__account_t__Balan__1273C1CD],
[DF__account_t__Credi__108B795B],
[DF__account_t__Debit__0F975522];
ALTER TABLE [dbo].[account_transaction] ADD CONSTRAINT [DF__account_t__Amoun__056ECC6A] DEFAULT 0.00 FOR [Amount], CONSTRAINT [DF__account_t__Balan__0662F0A3] DEFAULT 0.00 FOR [Balance], CONSTRAINT [DF__account_t__Credi__047AA831] DEFAULT 0.00 FOR [Credit], CONSTRAINT [DF__account_t__Debit__038683F8] DEFAULT 0.00 FOR [Debit];

-- AlterTable
ALTER TABLE [dbo].[accountmaster] DROP CONSTRAINT [DF__accountma__Activ__164452B1],
[DF__accountma__Balan__182C9B23],
[DF__accountma__Order__173876EA],
[DF__accountma__SubAc__15502E78];
EXEC SP_RENAME N'dbo.PK__accountm__406E0D2F141A46E6', N'PK__accountm__406E0D2F6FB041B3';
ALTER TABLE [dbo].[accountmaster] ADD CONSTRAINT [DF__accountma__Activ__52593CB8] DEFAULT 'Active' FOR [ActiveStatus], CONSTRAINT [DF__accountma__Balan__5441852A] DEFAULT 0.00 FOR [Balance], CONSTRAINT [DF__accountma__Order__534D60F1] DEFAULT 0 FOR [OrderBy], CONSTRAINT [DF__accountma__SubAc__5165187F] DEFAULT 'Nil' FOR [SubAc];

-- AlterTable
EXEC SP_RENAME N'dbo.PK__Addressm__EC6FA1A1FA08469F', N'PK__Addressm__EC6FA1A10EAC936A';

-- AlterTable
ALTER TABLE [dbo].[Attendance] DROP CONSTRAINT [DF__Attendanc__Absen__3EDC53F0],
[DF__Attendanc__PaidS__3FD07829],
[DF__Attendanc__Prese__3DE82FB7];
EXEC SP_RENAME N'dbo.PK__Attendan__0B7DBFBDBF189C9C', N'PK__Attendan__0B7DBFBD649950F4';
ALTER TABLE [dbo].[Attendance] ADD CONSTRAINT [DF__Attendanc__Absen__0CA5D9DE] DEFAULT 0 FOR [Absent], CONSTRAINT [DF__Attendanc__PaidS__515009E6] DEFAULT 'Unpaid' FOR [PaidStatus], CONSTRAINT [DF__Attendanc__Prese__0BB1B5A5] DEFAULT 0 FOR [Present];

-- AlterTable
ALTER TABLE [dbo].[billcollection] DROP CONSTRAINT [DF__billcolle__Balan__286302EC],
[DF__billcolle__BillA__267ABA7A],
[DF__billcolle__BillN__25869641],
[DF__billcolle__Branc__2A4B4B5E],
[DF__billcolle__Payme__29572725],
[DF__billcolle__Recei__276EDEB3];
EXEC SP_RENAME N'dbo.PK__billcoll__CD6C848822DD55DF', N'PK__billcoll__CD6C8488F28C4D7C';
ALTER TABLE [dbo].[billcollection] ADD CONSTRAINT [DF__billcolle__Balan__13BCEBC1] DEFAULT 0.0000 FOR [Balance], CONSTRAINT [DF__billcolle__BillA__11D4A34F] DEFAULT 0.0000 FOR [BillAmount], CONSTRAINT [DF__billcolle__BillN__10E07F16] DEFAULT 0 FOR [BillNo], CONSTRAINT [DF__billcolle__Branc__15A53433] DEFAULT '' FOR [BranchName], CONSTRAINT [DF__billcolle__Payme__14B10FFA] DEFAULT 'UnPaid' FOR [PaymentStatus], CONSTRAINT [DF__billcolle__Recei__12C8C788] DEFAULT 0.0000 FOR [Received];

-- AlterTable
ALTER TABLE [dbo].[billingcounter] DROP CONSTRAINT [DF__billingco__Activ__2F10007B],
[DF__billingco__Count__2D27B809],
[DF__billingco__Login__2E1BDC42];
EXEC SP_RENAME N'dbo.PK__billingc__CAA72873A8151A7A', N'PK__billingc__CAA72873F910FC83';
ALTER TABLE [dbo].[billingcounter] ADD CONSTRAINT [DF__billingco__Activ__4BAC3F29] DEFAULT 'Yes' FOR [ActiveStatus], CONSTRAINT [DF__billingco__Count__49C3F6B7] DEFAULT 'ShowRoom' FOR [CounterName], CONSTRAINT [DF__billingco__Login__4AB81AF0] DEFAULT 'Admin' FOR [LoginName];

-- AlterTable
EXEC SP_RENAME N'dbo.PK__BillType__DA152C4F40AAB371', N'PK__BillType__DA152C4F06C46A70';

-- AlterTable
ALTER TABLE [dbo].[branchtransfer] DROP CONSTRAINT [DF__branchtra__Amoun__467D75B8],
[DF__branchtra__Conve__4B422AD5],
[DF__branchtra__Custo__40C49C62],
[DF__branchtra__Disco__477199F1],
[DF__branchtra__EditM__4C364F0E],
[DF__branchtra__ItemC__41B8C09B],
[DF__branchtra__Labor__4A4E069C],
[DF__branchtra__Packi__4959E263],
[DF__branchtra__SRate__4589517F],
[DF__branchtra__UnitP__42ACE4D4],
[DF__branchtran__BQty__43A1090D],
[DF__branchtran__Rate__44952D46],
[DF__branchtrans__Tax__4865BE2A];
EXEC SP_RENAME N'dbo.PK__branchtr__167144EC7B04D3DD', N'PK__branchtr__167144EC254B67E6';
ALTER TABLE [dbo].[branchtransfer] ADD CONSTRAINT [DF__branchtra__Amoun__2116E6DF] DEFAULT 0.0000 FOR [Amount], CONSTRAINT [DF__branchtra__Conve__25DB9BFC] DEFAULT 0.0000 FOR [Convenience], CONSTRAINT [DF__branchtra__Custo__1B5E0D89] DEFAULT 0 FOR [Customer], CONSTRAINT [DF__branchtra__Disco__220B0B18] DEFAULT 0 FOR [Discount], CONSTRAINT [DF__branchtra__EditM__26CFC035] DEFAULT 'No' FOR [EditMode], CONSTRAINT [DF__branchtra__ItemC__1C5231C2] DEFAULT 0 FOR [ItemCode], CONSTRAINT [DF__branchtra__Labor__24E777C3] DEFAULT 0.0000 FOR [Labor], CONSTRAINT [DF__branchtra__Packi__23F3538A] DEFAULT 0.0000 FOR [PackingCharges], CONSTRAINT [DF__branchtra__SRate__2022C2A6] DEFAULT 0.0000 FOR [SRate], CONSTRAINT [DF__branchtra__UnitP__1D4655FB] DEFAULT 0 FOR [UnitPer], CONSTRAINT [DF__branchtran__BQty__1E3A7A34] DEFAULT 0 FOR [BQty], CONSTRAINT [DF__branchtran__Rate__1F2E9E6D] DEFAULT 0.0000 FOR [Rate], CONSTRAINT [DF__branchtrans__Tax__22FF2F51] DEFAULT 0 FOR [Tax];

-- AlterTable
ALTER TABLE [dbo].[CaptanMaster] DROP CONSTRAINT [DF__CaptanMas__Activ__37A5467C],
[DF__CaptanMas__Login__38996AB5];
EXEC SP_RENAME N'dbo.PK__CaptanMa__24A1AC3584707F9F', N'PK__CaptanMa__24A1AC3586E4363D';
ALTER TABLE [dbo].[CaptanMaster] ADD CONSTRAINT [DF__CaptanMas__Activ__6754599E] DEFAULT 'Active' FOR [ActiveStatus], CONSTRAINT [DF__CaptanMas__Login__68487DD7] DEFAULT 'Administrator' FOR [LoginName];

-- AlterTable
ALTER TABLE [dbo].[Cashdenomination] DROP CONSTRAINT [DF__Cashdenom__Branc__4D2A7347],
[DF__Cashdenom__LockS__5006DFF2],
[DF__Cashdenom__Trans__4E1E9780],
[DF__Cashdenomin__SNo__4F12BBB9];
EXEC SP_RENAME N'dbo.PK__Cashdeno__A4F99989B44D8B17', N'PK__Cashdeno__A4F9998940B61B70';
ALTER TABLE [dbo].[Cashdenomination] ADD CONSTRAINT [DF__Cashdenom__Branc__29AC2CE0] DEFAULT '' FOR [BranchName], CONSTRAINT [DF__Cashdenom__LockS__2C88998B] DEFAULT 'Unlock' FOR [LockStatus], CONSTRAINT [DF__Cashdenom__Trans__2AA05119] DEFAULT 0 FOR [Trans_No], CONSTRAINT [DF__Cashdenomin__SNo__2B947552] DEFAULT 0 FOR [SNo];

-- AlterTable
ALTER TABLE [dbo].[categorymaster] DROP CONSTRAINT [DF__categorym__Login__403A8C7D],
[DF__categorym__Login__412EB0B6],
[DF__categoryma__Cgst__3F466844],
[DF__categoryma__Sgst__3E52440B],
[DF__categorymas__Tax__3D5E1FD2];
ALTER TABLE [dbo].[categorymaster] ADD CONSTRAINT [DF__categorym__Login__1BFD2C07] DEFAULT 'Admin' FOR [Login], CONSTRAINT [DF__categorym__Login__1CF15040] DEFAULT 'Admin' FOR [LoginName], CONSTRAINT [DF__categoryma__Cgst__1B0907CE] DEFAULT 0 FOR [Cgst], CONSTRAINT [DF__categoryma__Sgst__1A14E395] DEFAULT 0 FOR [Sgst], CONSTRAINT [DF__categorymas__Tax__1920BF5C] DEFAULT 0 FOR [Tax];

-- AlterTable
ALTER TABLE [dbo].[closingstock] DROP CONSTRAINT [DF__closingst__Closi__5D60DB10],
[DF__closingst__Closi__603D47BB],
[DF__closingst__LTQty__56B3DD81],
[DF__closingst__PMQty__589C25F3],
[DF__closingst__PRQty__52E34C9D],
[DF__closingst__SCQty__57A801BA],
[DF__closingst__SIQty__5A846E65],
[DF__closingst__SRQty__55BFB948],
[DF__closingst__STQty__59904A2C],
[DF__closingst__UnitP__5F492382],
[DF__closingsto__Free__54CB950F],
[DF__closingsto__OQty__50FB042B],
[DF__closingsto__PQty__51EF2864],
[DF__closingsto__SQty__53D770D6],
[DF__closingstoc__CLC__5C6CB6D7],
[DF__closingstoc__MRP__5E54FF49],
[DF__closingstoc__OLC__5B78929E];
ALTER TABLE [dbo].[closingstock] ADD CONSTRAINT [DF__closingst__Closi__02284B6B] DEFAULT 0 FOR [ClosingStock], CONSTRAINT [DF__closingst__Closi__5BCD9859] DEFAULT 0.00 FOR [ClosingAmount], CONSTRAINT [DF__closingst__LTQty__7B7B4DDC] DEFAULT 0 FOR [LTQty], CONSTRAINT [DF__closingst__PMQty__7D63964E] DEFAULT 0 FOR [PMQty], CONSTRAINT [DF__closingst__PRQty__77AABCF8] DEFAULT 0 FOR [PRQty], CONSTRAINT [DF__closingst__SCQty__7C6F7215] DEFAULT 0 FOR [SCQty], CONSTRAINT [DF__closingst__SIQty__7F4BDEC0] DEFAULT 0 FOR [SIQty], CONSTRAINT [DF__closingst__SRQty__7A8729A3] DEFAULT 0 FOR [SRQty], CONSTRAINT [DF__closingst__STQty__7E57BA87] DEFAULT 0 FOR [STQty], CONSTRAINT [DF__closingst__UnitP__58F12BAE] DEFAULT 1 FOR [UnitPer], CONSTRAINT [DF__closingsto__Free__7993056A] DEFAULT 0 FOR [Free], CONSTRAINT [DF__closingsto__OQty__75C27486] DEFAULT 0 FOR [OQty], CONSTRAINT [DF__closingsto__PQty__76B698BF] DEFAULT 0 FOR [PQty], CONSTRAINT [DF__closingsto__SQty__789EE131] DEFAULT 0 FOR [SQty], CONSTRAINT [DF__closingstoc__CLC__01342732] DEFAULT 0 FOR [CLC], CONSTRAINT [DF__closingstoc__MRP__031C6FA4] DEFAULT 0.00 FOR [MRP], CONSTRAINT [DF__closingstoc__OLC__004002F9] DEFAULT 0 FOR [OLC];

-- AlterTable
ALTER TABLE [dbo].[columnsettings] DROP CONSTRAINT [DF__columnset__Width__6225902D],
[DF__columnsetti__Col__61316BF4];
EXEC SP_RENAME N'dbo.PK__columnse__8DA86C9BB7AD1B28', N'PK__columnse__8DA86C9B8A62F131';
ALTER TABLE [dbo].[columnsettings] ADD CONSTRAINT [DF__columnset__Width__30592A6F] DEFAULT 0 FOR [Width], CONSTRAINT [DF__columnsetti__Col__2F650636] DEFAULT 0 FOR [Col];

-- AlterTable
ALTER TABLE [dbo].[Company] DROP CONSTRAINT [DF__Company__Autorou__48CFD27E],
[DF__Company__FormTim__47DBAE45],
[DF__Company__PrintSp__49C3F6B7],
[DF__Company__QtyDeci__4AB81AF0],
[DF__Company__RateDec__4BAC3F29],
[DF__Company__salespe__46E78A0C];
ALTER TABLE [dbo].[Company] ADD CONSTRAINT [DF__Company__Autorou__284DF453] DEFAULT 'true' FOR [Autoroundoff], CONSTRAINT [DF__Company__FormTim__108B795B] DEFAULT 0 FOR [FormTime], CONSTRAINT [DF__Company__PrintSp__2942188C] DEFAULT 'true' FOR [PrintSplMsg], CONSTRAINT [DF__Company__QtyDeci__420DC656] DEFAULT 0 FOR [QtyDecimal], CONSTRAINT [DF__Company__RateDec__4301EA8F] DEFAULT 0 FOR [RateDecimal], CONSTRAINT [DF__Company__salespe__0F975522] DEFAULT 0 FOR [salesper];

-- AlterTable
ALTER TABLE [dbo].[costmaintanance] DROP CONSTRAINT [DF__costmaint__ItemC__6319B466],
[DF__costmainta__Cost__640DD89F];
ALTER TABLE [dbo].[costmaintanance] ADD CONSTRAINT [DF__costmaint__ItemC__324172E1] DEFAULT 0 FOR [ItemCode], CONSTRAINT [DF__costmainta__Cost__3335971A] DEFAULT 0.0000 FOR [Cost];

-- AlterTable
ALTER TABLE [dbo].[CreditNotes] DROP CONSTRAINT [DF__CreditNot__Round__6501FCD8];
ALTER TABLE [dbo].[CreditNotes] ADD CONSTRAINT [DF__CreditNot__Round__49AEE81E] DEFAULT 0 FOR [RoundOff];

-- AlterTable
ALTER TABLE [dbo].[customermaster] DROP CONSTRAINT [DF__customerm__Custo__571DF1D5],
[DF__customerm__Invoi__5629CD9C],
[DF__customerm__RateT__5535A963],
[DF__customerm__TaxTy__5812160E],
[DF__customermas__TCS__59063A47];
EXEC SP_RENAME N'dbo.PK__customer__EC6FA1A1ADA93FD3', N'PK__customer__EC6FA1A1E00E89FC';
ALTER TABLE [dbo].[customermaster] ADD CONSTRAINT [DF__customerm__Custo__59063A47] DEFAULT 'Customer' FOR [CustomerType], CONSTRAINT [DF__customerm__Invoi__5812160E] DEFAULT 'F' FOR [InvoiceType], CONSTRAINT [DF__customerm__RateT__571DF1D5] DEFAULT 'Maximum' FOR [RateType], CONSTRAINT [DF__customerm__TaxTy__59FA5E80] DEFAULT 'Full Tax' FOR [TaxType], CONSTRAINT [DF__customermas__TCS__32CB82C6] DEFAULT 0 FOR [TCS];

-- AlterTable
ALTER TABLE [dbo].[DebitNotes] DROP CONSTRAINT [DF__DebitNote__Amoun__6ABAD62E],
[DF__DebitNote__BillA__65F62111],
[DF__DebitNote__CessA__69C6B1F5],
[DF__DebitNote__CgstA__67DE6983],
[DF__DebitNote__IgstA__68D28DBC],
[DF__DebitNote__Round__6BAEFA67],
[DF__DebitNote__SgstA__66EA454A];
ALTER TABLE [dbo].[DebitNotes] ADD CONSTRAINT [DF__DebitNote__Amoun__01142BA1] DEFAULT 0 FOR [Amount], CONSTRAINT [DF__DebitNote__BillA__7C4F7684] DEFAULT 0 FOR [BillAmount], CONSTRAINT [DF__DebitNote__CessA__00200768] DEFAULT 0 FOR [CessAmt], CONSTRAINT [DF__DebitNote__CgstA__7E37BEF6] DEFAULT 0 FOR [CgstAmt], CONSTRAINT [DF__DebitNote__IgstA__7F2BE32F] DEFAULT 0 FOR [IgstAmt], CONSTRAINT [DF__DebitNote__Round__02084FDA] DEFAULT 0 FOR [RoundOff], CONSTRAINT [DF__DebitNote__SgstA__7D439ABD] DEFAULT 0 FOR [SgstAmt];

-- AlterTable
ALTER TABLE [dbo].[defaultvalues] DROP CONSTRAINT [DF__defaultva__AccTy__5DCAEF64];
EXEC SP_RENAME N'dbo.PK__defaultv__C94771AD5D485714', N'PK__defaultv__C94771AD06AA4AFA';
ALTER TABLE [dbo].[defaultvalues] ADD CONSTRAINT [DF__defaultva__AccTy__123EB7A3] DEFAULT '~' FOR [AccType];

-- AlterTable
ALTER TABLE [dbo].[Deletesales] DROP CONSTRAINT [DF__Deletesal__CessA__6D9742D9],
[DF__Deletesal__CessP__6CA31EA0],
[DF__Deletesale__Free__6E8B6712];
ALTER TABLE [dbo].[Deletesales] ADD CONSTRAINT [DF__Deletesal__CessA__23893F36] DEFAULT 0.00 FOR [CessAmt], CONSTRAINT [DF__Deletesal__CessP__22951AFD] DEFAULT 0.00 FOR [CessP], CONSTRAINT [DF__Deletesale__Free__45DE573A] DEFAULT 0 FOR [Free];

-- AlterTable
EXEC SP_RENAME N'dbo.PK__Delivery__4B317DC1D39A9425', N'PK__Delivery__4B317DC116A37750';

-- AlterTable
ALTER TABLE [dbo].[deliverychelan] DROP CONSTRAINT [DF__deliveryc__Amoun__7720AD13],
[DF__deliveryc__Branc__7CD98669],
[DF__deliveryc__Conve__7AF13DF7],
[DF__deliveryc__Custo__6F7F8B4B],
[DF__deliveryc__Disco__7814D14C],
[DF__deliveryc__Impor__7EC1CEDB],
[DF__deliveryc__ItemC__7073AF84],
[DF__deliveryc__Labor__79FD19BE],
[DF__deliveryc__RemQt__74444068],
[DF__deliveryc__SRate__762C88DA],
[DF__deliveryc__Statu__7BE56230],
[DF__deliveryc__UnitP__7167D3BD],
[DF__deliverych__DQty__725BF7F6],
[DF__deliverych__Rate__753864A1],
[DF__deliverych__SQty__73501C2F],
[DF__deliveryche__MRP__7DCDAAA2],
[DF__deliveryche__Tax__7908F585];
EXEC SP_RENAME N'dbo.PK__delivery__FDE9979113851CF4', N'PK__delivery__FDE99791A5474B93';
ALTER TABLE [dbo].[deliverychelan] ADD CONSTRAINT [DF__deliveryc__Amoun__3F9B6DFF] DEFAULT 0.0000 FOR [Amount], CONSTRAINT [DF__deliveryc__Branc__45544755] DEFAULT '' FOR [BranchName], CONSTRAINT [DF__deliveryc__Conve__436BFEE3] DEFAULT 0.0000 FOR [Convenience], CONSTRAINT [DF__deliveryc__Custo__37FA4C37] DEFAULT 0 FOR [Customer], CONSTRAINT [DF__deliveryc__Disco__408F9238] DEFAULT 0 FOR [Discount], CONSTRAINT [DF__deliveryc__Impor__3F3159AB] DEFAULT 'Nil' FOR [ImportStatus], CONSTRAINT [DF__deliveryc__ItemC__38EE7070] DEFAULT 0 FOR [ItemCode], CONSTRAINT [DF__deliveryc__Labor__4277DAAA] DEFAULT 0.0000 FOR [Labor], CONSTRAINT [DF__deliveryc__RemQt__3CBF0154] DEFAULT 0 FOR [RemQty], CONSTRAINT [DF__deliveryc__SRate__3EA749C6] DEFAULT 0.0000 FOR [SRate], CONSTRAINT [DF__deliveryc__Statu__4460231C] DEFAULT 'DC' FOR [Status], CONSTRAINT [DF__deliveryc__UnitP__39E294A9] DEFAULT 0 FOR [UnitPer], CONSTRAINT [DF__deliverych__DQty__3AD6B8E2] DEFAULT 0 FOR [DQty], CONSTRAINT [DF__deliverych__Rate__3DB3258D] DEFAULT 0.0000 FOR [Rate], CONSTRAINT [DF__deliverych__SQty__3BCADD1B] DEFAULT 0 FOR [SQty], CONSTRAINT [DF__deliveryche__MRP__46486B8E] DEFAULT 0.00 FOR [MRP], CONSTRAINT [DF__deliveryche__Tax__4183B671] DEFAULT 0 FOR [Tax];

-- AlterTable
EXEC SP_RENAME N'dbo.PK__Discount__E26DE1EFFA244B2F', N'PK__Discount__E26DE1EFAA0001D1';

-- AlterTable
ALTER TABLE [dbo].[Editsales] DROP CONSTRAINT [DF__Editsales__CessA__00AA174D],
[DF__Editsales__CessP__7FB5F314],
[DF__Editsales__Free__019E3B86];
ALTER TABLE [dbo].[Editsales] ADD CONSTRAINT [DF__Editsales__CessA__21A0F6C4] DEFAULT 0.00 FOR [CessAmt], CONSTRAINT [DF__Editsales__CessP__20ACD28B] DEFAULT 0.00 FOR [CessP], CONSTRAINT [DF__Editsales__Free__44EA3301] DEFAULT 0 FOR [Free];

-- AlterTable
EXEC SP_RENAME N'dbo.PK__Employee__AF2D66D37998DCDF', N'PK__Employee__AF2D66D3ED8A66EF';

-- AlterTable
ALTER TABLE [dbo].[fieldssetting] DROP CONSTRAINT [DF__fieldsset__Descr__6FE99F9F],
[DF__fieldsset__Repor__6E01572D],
[DF__fieldssetti__Sno__6EF57B66];
EXEC SP_RENAME N'dbo.PK__fieldsse__07E6E74AAAE87F2F', N'PK__fieldsse__07E6E74AD658DD43';
ALTER TABLE [dbo].[fieldssetting] ADD CONSTRAINT [DF__fieldsset__Descr__5C37ACAD] DEFAULT '' FOR [Description], CONSTRAINT [DF__fieldsset__Repor__5A4F643B] DEFAULT '' FOR [ReportName], CONSTRAINT [DF__fieldssetti__Sno__5B438874] DEFAULT 0 FOR [Sno];

-- AlterTable
ALTER TABLE [dbo].[formsize] DROP CONSTRAINT [DF__formsize__height__787EE5A0],
[DF__formsize__leftVa__76969D2E],
[DF__formsize__topVal__75A278F5],
[DF__formsize__widthV__778AC167];
EXEC SP_RENAME N'dbo.PK__formsize__BCED39DFCFB7FC50', N'PK__formsize__BCED39DFABE8812B';
ALTER TABLE [dbo].[formsize] ADD CONSTRAINT [DF__formsize__height__0F624AF8] DEFAULT 0 FOR [heightValue], CONSTRAINT [DF__formsize__leftVa__0D7A0286] DEFAULT 0 FOR [leftValue], CONSTRAINT [DF__formsize__topVal__0C85DE4D] DEFAULT 0 FOR [topValue], CONSTRAINT [DF__formsize__widthV__0E6E26BF] DEFAULT 0 FOR [widthValue];

-- AlterTable
EXEC SP_RENAME N'dbo.PK__FreeMast__3ECC0FEB5F20F8FB', N'PK__FreeMast__3ECC0FEB6668CE83';

-- AlterTable
ALTER TABLE [dbo].[itemmaster] DROP CONSTRAINT [DF__itemmaste__Activ__160F4887],
[DF__itemmaste__AdiCe__1EA48E88],
[DF__itemmaste__AltRa__1DB06A4F],
[DF__itemmaste__AltUn__01142BA1],
[DF__itemmaste__BulkR__08B54D69],
[DF__itemmaste__ComsI__10566F31],
[DF__itemmaste__Cost1__03F0984C],
[DF__itemmaste__Defau__151B244E],
[DF__itemmaste__IncPe__0F624AF8],
[DF__itemmaste__IncRs__114A936A],
[DF__itemmaste__ItemC__7D439ABD],
[DF__itemmaste__Login__17036CC0],
[DF__itemmaste__Login__17F790F9],
[DF__itemmaste__MaxDi__0E6E26BF],
[DF__itemmaste__MaxRa__06CD04F7],
[DF__itemmaste__MinRa__07C12930],
[DF__itemmaste__PRate__04E4BC85],
[DF__itemmaste__Packi__00200768],
[DF__itemmaste__RateS__05D8E0BE],
[DF__itemmaste__Ratea__14270015],
[DF__itemmaste__Sales__1AD3FDA4],
[DF__itemmaste__Speci__123EB7A3],
[DF__itemmaste__Stock__1332DBDC],
[DF__itemmaste__Stock__18EBB532],
[DF__itemmaste__TaxSt__0A9D95DB],
[DF__itemmaste__UnitP__02084FDA],
[DF__itemmaste__Waite__19DFD96B],
[DF__itemmaster__Cgst__0D7A0286],
[DF__itemmaster__Cost__02FC7413],
[DF__itemmaster__MRP__09A971A2],
[DF__itemmaster__PDis__1BC821DD],
[DF__itemmaster__RQty__7E37BEF6],
[DF__itemmaster__SP__1CBC4616],
[DF__itemmaster__Sgst__0C85DE4D],
[DF__itemmaster__Tax__0B91BA14],
[DF__itemmaster__Unit__7F2BE32F];
ALTER TABLE [dbo].[itemmaster] ADD CONSTRAINT [DF__itemmaste__Activ__38996AB5] DEFAULT 'Yes' FOR [ActiveStatus], CONSTRAINT [DF__itemmaste__AdiCe__1AF3F935] DEFAULT 0.00 FOR [AdiCess], CONSTRAINT [DF__itemmaste__AltRa__403A8C7D] DEFAULT 0.0000 FOR [AltRate], CONSTRAINT [DF__itemmaste__AltUn__239E4DCF] DEFAULT 'Pcs' FOR [AltUnit], CONSTRAINT [DF__itemmaste__BulkR__2B3F6F97] DEFAULT 0.0000 FOR [BulkRate], CONSTRAINT [DF__itemmaste__ComsI__32E0915F] DEFAULT 0.000 FOR [ComsIncPer], CONSTRAINT [DF__itemmaste__Cost1__267ABA7A] DEFAULT 0.0000 FOR [Cost1], CONSTRAINT [DF__itemmaste__Defau__37A5467C] DEFAULT 'Yes' FOR [DefaultUnit], CONSTRAINT [DF__itemmaste__IncPe__31EC6D26] DEFAULT 0 FOR [IncPer], CONSTRAINT [DF__itemmaste__IncRs__33D4B598] DEFAULT 0.0000 FOR [IncRs], CONSTRAINT [DF__itemmaste__ItemC__1FCDBCEB] DEFAULT 0 FOR [ItemCode], CONSTRAINT [DF__itemmaste__Login__398D8EEE] DEFAULT 'Admin' FOR [Login], CONSTRAINT [DF__itemmaste__Login__3A81B327] DEFAULT 'Admin' FOR [LoginName], CONSTRAINT [DF__itemmaste__MaxDi__30F848ED] DEFAULT 0 FOR [MaxDis], CONSTRAINT [DF__itemmaste__MaxRa__29572725] DEFAULT 0.0000 FOR [MaxRate], CONSTRAINT [DF__itemmaste__MinRa__2A4B4B5E] DEFAULT 0.0000 FOR [MinRate], CONSTRAINT [DF__itemmaste__PRate__276EDEB3] DEFAULT 0.0000 FOR [PRate], CONSTRAINT [DF__itemmaste__Packi__22AA2996] DEFAULT 1 FOR [Packing], CONSTRAINT [DF__itemmaste__RateS__286302EC] DEFAULT 'Rate' FOR [RateStatus], CONSTRAINT [DF__itemmaste__Ratea__36B12243] DEFAULT 'No' FOR [Ratealtration], CONSTRAINT [DF__itemmaste__Sales__3D5E1FD2] DEFAULT 0.000 FOR [SalesRefPer], CONSTRAINT [DF__itemmaste__Speci__34C8D9D1] DEFAULT 'No' FOR [SpecialMessage], CONSTRAINT [DF__itemmaste__Stock__35BCFE0A] DEFAULT 'Yes' FOR [Stockmaintenance], CONSTRAINT [DF__itemmaste__Stock__3B75D760] DEFAULT 'Yes' FOR [StockCorrection], CONSTRAINT [DF__itemmaste__TaxSt__2D27B809] DEFAULT 'Extra' FOR [TaxStatus], CONSTRAINT [DF__itemmaste__UnitP__24927208] DEFAULT 1 FOR [UnitPer], CONSTRAINT [DF__itemmaste__Waite__3C69FB99] DEFAULT 0.000 FOR [WaiterPer], CONSTRAINT [DF__itemmaster__Cgst__300424B4] DEFAULT 0 FOR [Cgst], CONSTRAINT [DF__itemmaster__Cost__25869641] DEFAULT 0.0000 FOR [Cost], CONSTRAINT [DF__itemmaster__MRP__2C3393D0] DEFAULT 0.0000 FOR [MRP], CONSTRAINT [DF__itemmaster__PDis__3E52440B] DEFAULT 0.000 FOR [PDis], CONSTRAINT [DF__itemmaster__RQty__20C1E124] DEFAULT 0 FOR [RQty], CONSTRAINT [DF__itemmaster__SP__3F466844] DEFAULT 0.00 FOR [SP], CONSTRAINT [DF__itemmaster__Sgst__2F10007B] DEFAULT 0 FOR [Sgst], CONSTRAINT [DF__itemmaster__Tax__2E1BDC42] DEFAULT 0 FOR [Tax], CONSTRAINT [DF__itemmaster__Unit__21B6055D] DEFAULT 'Pcs' FOR [Unit];

-- AlterTable
ALTER TABLE [dbo].[jointable] DROP CONSTRAINT [DF__jointable__Repor__02925FBF];
EXEC SP_RENAME N'dbo.PK__jointabl__CBA5FCF20C4DCF60', N'PK__jointabl__CBA5FCF2684A200E';
ALTER TABLE [dbo].[jointable] ADD CONSTRAINT [DF__jointable__Repor__60FC61CA] DEFAULT '' FOR [ReportName];

-- AlterTable
ALTER TABLE [dbo].[locationmaster] DROP CONSTRAINT [DF__locationm__Login__236943A5];
EXEC SP_RENAME N'dbo.PK__location__E55D3B116C427240', N'PK__location__E55D3B11D45F8310';
ALTER TABLE [dbo].[locationmaster] ADD CONSTRAINT [DF__locationm__Login__4E88ABD4] DEFAULT 'Admin' FOR [LoginName];

-- AlterTable
ALTER TABLE [dbo].[locationtransfer] DROP CONSTRAINT [DF__locationt__ALQty__056ECC6A],
[DF__locationt__APQty__047AA831],
[DF__locationt__Branc__0662F0A3],
[DF__locationtr__Cost__038683F8],
[DF__locationtra__MRP__075714DC],
[DF__locationtran__LC__084B3915];
EXEC SP_RENAME N'dbo.PK__location__1D02332E56B08645', N'PK__location__1D02332E3AB62E20';
ALTER TABLE [dbo].[locationtransfer] ADD CONSTRAINT [DF__locationt__ALQty__65C116E7] DEFAULT 0 FOR [ALQty], CONSTRAINT [DF__locationt__APQty__64CCF2AE] DEFAULT 0 FOR [APQty], CONSTRAINT [DF__locationt__Branc__66B53B20] DEFAULT '' FOR [BranchName], CONSTRAINT [DF__locationtr__Cost__63D8CE75] DEFAULT 0.0000 FOR [Cost], CONSTRAINT [DF__locationtra__MRP__67A95F59] DEFAULT 0.00 FOR [MRP], CONSTRAINT [DF__locationtran__LC__2C1E8537] DEFAULT 0 FOR [LC];

-- AlterTable
ALTER TABLE [dbo].[MakeEntry] DROP CONSTRAINT [DF__MakeEntry__Credi__0A338187],
[DF__MakeEntry__Debit__093F5D4E];
EXEC SP_RENAME N'dbo.PK__MakeEntr__99619E37B3DEEBD3', N'PK__MakeEntr__99619E378A7D9627';
ALTER TABLE [dbo].[MakeEntry] ADD CONSTRAINT [DF__MakeEntry__Credi__6E565CE8] DEFAULT 0 FOR [Credit], CONSTRAINT [DF__MakeEntry__Debit__6D6238AF] DEFAULT 0 FOR [Debit];

-- AlterTable
ALTER TABLE [dbo].[Openingstock] DROP CONSTRAINT [DF__Openingst__Accou__1975C517],
[DF__Openingst__Amoun__0EF836A4],
[DF__Openingst__Branc__1B5E0D89],
[DF__Openingst__CGSTA__1699586C],
[DF__Openingst__DisAm__10E07F16],
[DF__Openingst__Disco__0FEC5ADD],
[DF__Openingst__IGSTA__178D7CA5],
[DF__Openingst__ItemC__0C1BC9F9],
[DF__Openingst__Login__1881A0DE],
[DF__Openingst__Margi__1E3A7A34],
[DF__Openingst__MaxRa__1F2E9E6D],
[DF__Openingst__PRate__0E04126B],
[DF__Openingst__SGSTA__15A53433],
[DF__Openingst__VatAm__1D4655FB],
[DF__Openingst__Vendo__0B27A5C0],
[DF__Openingsto__CGST__12C8C788],
[DF__Openingsto__IGST__14B10FFA],
[DF__Openingsto__OQty__1A69E950],
[DF__Openingsto__SGST__13BCEBC1],
[DF__Openingstoc__MRP__1C5231C2],
[DF__Openingstoc__Qty__0D0FEE32],
[DF__Openingstoc__Tax__11D4A34F];
EXEC SP_RENAME N'dbo.PK__Openings__1D02332E5F04E810', N'PK__Openings__1D02332E77D88AAC';
ALTER TABLE [dbo].[Openingstock] ADD CONSTRAINT [DF__Openingst__Accou__2739D489] DEFAULT '0' FOR [Account], CONSTRAINT [DF__Openingst__Amoun__1CBC4616] DEFAULT 0.00 FOR [Amount], CONSTRAINT [DF__Openingst__Branc__29221CFB] DEFAULT '' FOR [BranchName], CONSTRAINT [DF__Openingst__CGSTA__245D67DE] DEFAULT 0.00 FOR [CGSTAmt], CONSTRAINT [DF__Openingst__DisAm__1EA48E88] DEFAULT 0.00 FOR [DisAmt], CONSTRAINT [DF__Openingst__Disco__1DB06A4F] DEFAULT 0 FOR [Discount], CONSTRAINT [DF__Openingst__IGSTA__25518C17] DEFAULT 0.00 FOR [IGSTAmt], CONSTRAINT [DF__Openingst__ItemC__19DFD96B] DEFAULT 0 FOR [ItemCode], CONSTRAINT [DF__Openingst__Login__2645B050] DEFAULT 'Admin' FOR [LoginName], CONSTRAINT [DF__Openingst__Margi__2A363CC5] DEFAULT 0.00 FOR [Margin], CONSTRAINT [DF__Openingst__MaxRa__2B2A60FE] DEFAULT 0.0000 FOR [MaxRate], CONSTRAINT [DF__Openingst__PRate__1BC821DD] DEFAULT 0.0000 FOR [PRate], CONSTRAINT [DF__Openingst__SGSTA__236943A5] DEFAULT 0.00 FOR [SGSTAmt], CONSTRAINT [DF__Openingst__VatAm__2EDAF651] DEFAULT 0.00 FOR [VatAmt], CONSTRAINT [DF__Openingst__Vendo__18EBB532] DEFAULT 0 FOR [Vendor], CONSTRAINT [DF__Openingsto__CGST__208CD6FA] DEFAULT 0 FOR [CGST], CONSTRAINT [DF__Openingsto__IGST__22751F6C] DEFAULT 0 FOR [IGST], CONSTRAINT [DF__Openingsto__OQty__282DF8C2] DEFAULT 0 FOR [OQty], CONSTRAINT [DF__Openingsto__SGST__2180FB33] DEFAULT 0 FOR [SGST], CONSTRAINT [DF__Openingstoc__MRP__2A164134] DEFAULT 0.00 FOR [MRP], CONSTRAINT [DF__Openingstoc__Qty__1AD3FDA4] DEFAULT 0 FOR [Qty], CONSTRAINT [DF__Openingstoc__Tax__1F98B2C1] DEFAULT 0 FOR [Tax];

-- AlterTable
ALTER TABLE [dbo].[OrderMaster] DROP CONSTRAINT [DF__OrderMast__Amoun__2EDAF651],
[DF__OrderMaste__Rate__2DE6D218];
EXEC SP_RENAME N'dbo.PK__OrderMas__9F3182121B1D43AA', N'PK__OrderMas__9F3182126F12DDE3';
ALTER TABLE [dbo].[OrderMaster] ADD CONSTRAINT [DF__OrderMast__Amoun__37E53D9E] DEFAULT 0 FOR [Amount], CONSTRAINT [DF__OrderMaste__Rate__36F11965] DEFAULT 0 FOR [Rate];

-- AlterTable
EXEC SP_RENAME N'dbo.PK__OutdoorO__9C0881E95B987B72', N'PK__OutdoorO__9C0881E911366662';

-- AlterTable
ALTER TABLE [dbo].[packingmaterial] DROP CONSTRAINT [DF__packingma__ALQty__22FF2F51],
[DF__packingma__APQty__220B0B18],
[DF__packingma__Amoun__2116E6DF],
[DF__packingma__Branc__25DB9BFC],
[DF__packingma__EditM__24E777C3],
[DF__packingma__ItemC__2022C2A6],
[DF__packingmate__MRP__26CFC035],
[DF__packingmater__LC__23F3538A];
EXEC SP_RENAME N'dbo.PK__packingm__1D02332EE1F1ACA1', N'PK__packingm__1D02332E50726903';
ALTER TABLE [dbo].[packingmaterial] ADD CONSTRAINT [DF__packingma__ALQty__77DFC722] DEFAULT 0 FOR [ALQty], CONSTRAINT [DF__packingma__APQty__76EBA2E9] DEFAULT 0 FOR [APQty], CONSTRAINT [DF__packingma__Amoun__75F77EB0] DEFAULT 0.0000 FOR [Amount], CONSTRAINT [DF__packingma__Branc__7ABC33CD] DEFAULT '' FOR [BranchName], CONSTRAINT [DF__packingma__EditM__79C80F94] DEFAULT 'No' FOR [EditMode], CONSTRAINT [DF__packingma__ItemC__75035A77] DEFAULT 0 FOR [ItemCode], CONSTRAINT [DF__packingmate__MRP__7BB05806] DEFAULT 0.00 FOR [MRP], CONSTRAINT [DF__packingmater__LC__78D3EB5B] DEFAULT 0.0000 FOR [LC];

-- AlterTable
ALTER TABLE [dbo].[paybills] DROP CONSTRAINT [DF__paybills__AccTyp__28B808A7],
[DF__paybills__Balanc__2AA05119],
[DF__paybills__Branch__29AC2CE0],
[DF__paybills__SNo__2B947552],
[DF__paybills__Trans___27C3E46E];
ALTER TABLE [dbo].[paybills] ADD CONSTRAINT [DF__paybills__AccTyp__025D5595] DEFAULT '' FOR [AccType], CONSTRAINT [DF__paybills__Balanc__542C7691] DEFAULT 0 FOR [Balance], CONSTRAINT [DF__paybills__Branch__035179CE] DEFAULT '' FOR [BranchName], CONSTRAINT [DF__paybills__SNo__04459E07] DEFAULT 0 FOR [SNo], CONSTRAINT [DF__paybills__Trans___0169315C] DEFAULT 0 FOR [Trans_No];

-- AlterTable
ALTER TABLE [dbo].[payments] DROP CONSTRAINT [DF__payments__AccTyp__2D7CBDC4],
[DF__payments__SNo__2C88998B];
ALTER TABLE [dbo].[payments] ADD CONSTRAINT [DF__payments__AccTyp__762C88DA] DEFAULT '~' FOR [AccType], CONSTRAINT [DF__payments__SNo__753864A1] DEFAULT 0 FOR [SNo];

-- AlterTable
ALTER TABLE [dbo].[pendinglist] DROP CONSTRAINT [DF__pendingli__Balan__2E70E1FD],
[DF__pendingli__BillA__2F650636],
[DF__pendinglis__Days__30592A6F];
ALTER TABLE [dbo].[pendinglist] ADD CONSTRAINT [DF__pendingli__Balan__08162EEB] DEFAULT 0.0000 FOR [Balance], CONSTRAINT [DF__pendingli__BillA__090A5324] DEFAULT 0.0000 FOR [BillAmount], CONSTRAINT [DF__pendinglis__Days__43F60EC8] DEFAULT 0 FOR [Days];

-- AlterTable
ALTER TABLE [dbo].[pendingtemp] DROP CONSTRAINT [DF__pendingte__Balan__314D4EA8];
ALTER TABLE [dbo].[pendingtemp] ADD CONSTRAINT [DF__pendingte__Balan__0CDAE408] DEFAULT 0.0000 FOR [Balance];

-- AlterTable
ALTER TABLE [dbo].[Perfoma] DROP CONSTRAINT [DF__Perfoma__AccType__324172E1],
[DF__Perfoma__Amount__37FA4C37],
[DF__Perfoma__CgstAmt__4183B671],
[DF__Perfoma__Cgst__3EA749C6],
[DF__Perfoma__Conveni__3BCADD1B],
[DF__Perfoma__Discoun__38EE7070],
[DF__Perfoma__EditMod__3CBF0154],
[DF__Perfoma__IgstAmt__4277DAAA],
[DF__Perfoma__Igst__3F9B6DFF],
[DF__Perfoma__ItemCod__3335971A],
[DF__Perfoma__Labor__3AD6B8E2],
[DF__Perfoma__Rate__361203C5],
[DF__Perfoma__SQty__351DDF8C],
[DF__Perfoma__SRate__370627FE],
[DF__Perfoma__SgstAmt__408F9238],
[DF__Perfoma__Sgst__3DB3258D],
[DF__Perfoma__Tax__39E294A9],
[DF__Perfoma__UnitPer__3429BB53];
EXEC SP_RENAME N'dbo.PK__Perfoma__7E62EE5B93BC85F2', N'PK__Perfoma__7E62EE5B502974D6';
ALTER TABLE [dbo].[Perfoma] ADD CONSTRAINT [DF__Perfoma__AccType__6B24EA82] DEFAULT '' FOR [AccType], CONSTRAINT [DF__Perfoma__Amount__70DDC3D8] DEFAULT 0.0000 FOR [Amount], CONSTRAINT [DF__Perfoma__CgstAmt__4E739D3B] DEFAULT 0.00 FOR [CgstAmt], CONSTRAINT [DF__Perfoma__Cgst__4B973090] DEFAULT 0 FOR [Cgst], CONSTRAINT [DF__Perfoma__Conveni__74AE54BC] DEFAULT 0.0000 FOR [Convenience], CONSTRAINT [DF__Perfoma__Discoun__71D1E811] DEFAULT 0 FOR [Discount], CONSTRAINT [DF__Perfoma__EditMod__75A278F5] DEFAULT 'No' FOR [EditMode], CONSTRAINT [DF__Perfoma__IgstAmt__4F67C174] DEFAULT 0.00 FOR [IgstAmt], CONSTRAINT [DF__Perfoma__Igst__4C8B54C9] DEFAULT 0 FOR [Igst], CONSTRAINT [DF__Perfoma__ItemCod__6C190EBB] DEFAULT 0 FOR [ItemCode], CONSTRAINT [DF__Perfoma__Labor__73BA3083] DEFAULT 0.0000 FOR [Labor], CONSTRAINT [DF__Perfoma__Rate__6EF57B66] DEFAULT 0.0000 FOR [Rate], CONSTRAINT [DF__Perfoma__SQty__6E01572D] DEFAULT 0 FOR [SQty], CONSTRAINT [DF__Perfoma__SRate__6FE99F9F] DEFAULT 0.0000 FOR [SRate], CONSTRAINT [DF__Perfoma__SgstAmt__4D7F7902] DEFAULT 0.00 FOR [SgstAmt], CONSTRAINT [DF__Perfoma__Sgst__4AA30C57] DEFAULT 0 FOR [Sgst], CONSTRAINT [DF__Perfoma__Tax__72C60C4A] DEFAULT 0 FOR [Tax], CONSTRAINT [DF__Perfoma__UnitPer__6D0D32F4] DEFAULT 0 FOR [UnitPer];

-- AlterTable
ALTER TABLE [dbo].[printset] DROP CONSTRAINT [DF__printset__Contro__40F9A68C],
[DF__printset__PrintT__40058253],
[DF__printset__Style__3E1D39E1],
[DF__printset__Summar__41EDCAC5],
[DF__printset__Type__3F115E1A];
EXEC SP_RENAME N'dbo.PK__printset__92234E21BE4AECF0', N'PK__printset__92234E2159703C9C';
ALTER TABLE [dbo].[printset] ADD CONSTRAINT [DF__printset__Contro__15702A09] DEFAULT '' FOR [ControlValue], CONSTRAINT [DF__printset__PrintT__147C05D0] DEFAULT 'Format' FOR [PrintType], CONSTRAINT [DF__printset__Style__1293BD5E] DEFAULT '' FOR [Style], CONSTRAINT [DF__printset__Summar__16644E42] DEFAULT 'False' FOR [Summary], CONSTRAINT [DF__printset__Type__1387E197] DEFAULT '' FOR [Type];

-- AlterTable
ALTER TABLE [dbo].[PrintTbl] DROP CONSTRAINT [DF__PrintTbl__PrintS__436BFEE3];
ALTER TABLE [dbo].[PrintTbl] ADD CONSTRAINT [DF__PrintTbl__PrintS__7FD5EEA5] DEFAULT 'No' FOR [PrintStatus];

-- AlterTable
ALTER TABLE [dbo].[purchase] DROP CONSTRAINT [DF__purchase__AdiCes__5B438874],
[DF__purchase__Amount__4830B400],
[DF__purchase__CessAm__5D2BD0E6],
[DF__purchase__CessP__5C37ACAD],
[DF__purchase__CgstAm__558AAF1E],
[DF__purchase__Cgst__50C5FA01],
[DF__purchase__DisAmt__4B0D20AB],
[DF__purchase__DisRec__595B4002],
[DF__purchase__Discou__4924D839],
[DF__purchase__EditMo__5772F790],
[DF__purchase__ExcRat__60083D91],
[DF__purchase__Exp__58671BC9],
[DF__purchase__FW__53A266AC],
[DF__purchase__IgstAm__567ED357],
[DF__purchase__Igst__51BA1E3A],
[DF__purchase__ItemCo__46486B8E],
[DF__purchase__MRP__5A4F643B],
[DF__purchase__PONo__45544755],
[DF__purchase__PQty__4DE98D56],
[DF__purchase__PRate__473C8FC7],
[DF__purchase__RoundO__52AE4273],
[DF__purchase__SPDisA__4C0144E4],
[DF__purchase__SPDisc__4A18FC72],
[DF__purchase__SalOrd__60FC61CA],
[DF__purchase__SgstAm__54968AE5],
[DF__purchase__Sgst__4FD1D5C8],
[DF__purchase__TCSAmt__5E1FF51F],
[DF__purchase__TCSP__5F141958],
[DF__purchase__Tax__4EDDB18F],
[DF__purchase__UnitPe__4CF5691D],
[DF__purchase__Vendor__4460231C];
ALTER TABLE [dbo].[purchase] ADD CONSTRAINT [DF__purchase__AdiCes__1CDC41A7] DEFAULT 0.00 FOR [AdiCess], CONSTRAINT [DF__purchase__Amount__3587F3E0] DEFAULT 0.0000 FOR [Amount], CONSTRAINT [DF__purchase__CessAm__257187A8] DEFAULT 0.00 FOR [CessAmt], CONSTRAINT [DF__purchase__CessP__247D636F] DEFAULT 0.00 FOR [CessP], CONSTRAINT [DF__purchase__CgstAm__42E1EEFE] DEFAULT 0.0000 FOR [CgstAmt], CONSTRAINT [DF__purchase__Cgst__3E1D39E1] DEFAULT 0 FOR [Cgst], CONSTRAINT [DF__purchase__DisAmt__3864608B] DEFAULT 0.0000 FOR [DisAmt], CONSTRAINT [DF__purchase__DisRec__46B27FE2] DEFAULT 0.00 FOR [DisRec], CONSTRAINT [DF__purchase__Discou__367C1819] DEFAULT 0 FOR [Discount], CONSTRAINT [DF__purchase__EditMo__44CA3770] DEFAULT 'No' FOR [EditMode], CONSTRAINT [DF__purchase__ExcRat__34B3CB38] DEFAULT 0 FOR [ExcRate], CONSTRAINT [DF__purchase__Exp__45BE5BA9] DEFAULT 0 FOR [Exp], CONSTRAINT [DF__purchase__FW__40F9A68C] DEFAULT 0.0000 FOR [FW], CONSTRAINT [DF__purchase__IgstAm__43D61337] DEFAULT 0.0000 FOR [IgstAmt], CONSTRAINT [DF__purchase__Igst__3F115E1A] DEFAULT 0 FOR [Igst], CONSTRAINT [DF__purchase__ItemCo__339FAB6E] DEFAULT 0 FOR [ItemCode], CONSTRAINT [DF__purchase__MRP__47A6A41B] DEFAULT 0.00 FOR [MRP], CONSTRAINT [DF__purchase__PONo__32AB8735] DEFAULT 0 FOR [PONo], CONSTRAINT [DF__purchase__PQty__3B40CD36] DEFAULT 0 FOR [PQty], CONSTRAINT [DF__purchase__PRate__3493CFA7] DEFAULT 0.0000 FOR [PRate], CONSTRAINT [DF__purchase__RoundO__40058253] DEFAULT 0.0000 FOR [RoundOff], CONSTRAINT [DF__purchase__SPDisA__395884C4] DEFAULT 0.0000 FOR [SPDisAmt], CONSTRAINT [DF__purchase__SPDisc__37703C52] DEFAULT 0 FOR [SPDiscount], CONSTRAINT [DF__purchase__SalOrd__3E3D3572] DEFAULT 0 FOR [SalOrdNo], CONSTRAINT [DF__purchase__SgstAm__41EDCAC5] DEFAULT 0.0000 FOR [SgstAmt], CONSTRAINT [DF__purchase__Sgst__3D2915A8] DEFAULT 0 FOR [Sgst], CONSTRAINT [DF__purchase__TCSAmt__30E33A54] DEFAULT 0.00 FOR [TCSAmt], CONSTRAINT [DF__purchase__TCSP__31D75E8D] DEFAULT 0.00 FOR [TCSP], CONSTRAINT [DF__purchase__Tax__3C34F16F] DEFAULT 0 FOR [Tax], CONSTRAINT [DF__purchase__UnitPe__3A4CA8FD] DEFAULT 0 FOR [UnitPer], CONSTRAINT [DF__purchase__Vendor__31B762FC] DEFAULT 0 FOR [Vendor];

-- AlterTable
ALTER TABLE [dbo].[purchaseOrder] DROP CONSTRAINT [DF__purchaseO__Amoun__64CCF2AE],
[DF__purchaseO__Branc__703EA55A],
[DF__purchaseO__DisAm__67A95F59],
[DF__purchaseO__Disco__65C116E7],
[DF__purchaseO__EditM__6E565CE8],
[DF__purchaseO__ItemC__62E4AA3C],
[DF__purchaseO__NetAm__7132C993],
[DF__purchaseO__PRate__63D8CE75],
[DF__purchaseO__PurQt__75035A77],
[DF__purchaseO__Recei__740F363E],
[DF__purchaseO__RemQt__75F77EB0],
[DF__purchaseO__Round__6C6E1476],
[DF__purchaseO__SPDis__66B53B20],
[DF__purchaseO__SPDis__689D8392],
[DF__purchaseO__SalOr__731B1205],
[DF__purchaseO__UnitP__6991A7CB],
[DF__purchaseO__Vendo__61F08603],
[DF__purchaseOr__PQty__6A85CC04],
[DF__purchaseOrd__Exp__6F4A8121],
[DF__purchaseOrd__MRP__7226EDCC],
[DF__purchaseOrd__Tax__6B79F03D],
[DF__purchaseOrde__FW__6D6238AF];
EXEC SP_RENAME N'dbo.PK__purchase__FDE99791F3FBF9E5', N'PK__purchase__FDE99791D36ED25D';
ALTER TABLE [dbo].[purchaseOrder] ADD CONSTRAINT [DF__purchaseO__Amoun__40C49C62] DEFAULT 0.0000 FOR [Amount], CONSTRAINT [DF__purchaseO__Branc__4C364F0E] DEFAULT '' FOR [BranchName], CONSTRAINT [DF__purchaseO__DisAm__43A1090D] DEFAULT 0.0000 FOR [DisAmt], CONSTRAINT [DF__purchaseO__Disco__41B8C09B] DEFAULT 0 FOR [Discount], CONSTRAINT [DF__purchaseO__EditM__4A4E069C] DEFAULT 'No' FOR [EditMode], CONSTRAINT [DF__purchaseO__ItemC__3EDC53F0] DEFAULT 0 FOR [ItemCode], CONSTRAINT [DF__purchaseO__NetAm__4D2A7347] DEFAULT 0.000 FOR [NetAmount], CONSTRAINT [DF__purchaseO__PRate__3FD07829] DEFAULT 0.0000 FOR [PRate], CONSTRAINT [DF__purchaseO__PurQt__3B60C8C7] DEFAULT 0 FOR [PurQty], CONSTRAINT [DF__purchaseO__Recei__5006DFF2] DEFAULT 0 FOR [ReceiveQty], CONSTRAINT [DF__purchaseO__RemQt__3D491139] DEFAULT 0 FOR [RemQty], CONSTRAINT [DF__purchaseO__Round__4865BE2A] DEFAULT 0.0000 FOR [RoundOff], CONSTRAINT [DF__purchaseO__SPDis__42ACE4D4] DEFAULT 0 FOR [SPDiscount], CONSTRAINT [DF__purchaseO__SPDis__44952D46] DEFAULT 0.0000 FOR [SPDisAmt], CONSTRAINT [DF__purchaseO__SalOr__4F12BBB9] DEFAULT 0 FOR [SalOrdNo], CONSTRAINT [DF__purchaseO__UnitP__4589517F] DEFAULT 0 FOR [UnitPer], CONSTRAINT [DF__purchaseO__Vendo__3DE82FB7] DEFAULT 0 FOR [Vendor], CONSTRAINT [DF__purchaseOr__PQty__467D75B8] DEFAULT 0 FOR [PQty], CONSTRAINT [DF__purchaseOrd__Exp__4B422AD5] DEFAULT 0 FOR [Exp], CONSTRAINT [DF__purchaseOrd__MRP__4E1E9780] DEFAULT 0.00 FOR [MRP], CONSTRAINT [DF__purchaseOrd__Tax__477199F1] DEFAULT 0 FOR [Tax], CONSTRAINT [DF__purchaseOrde__FW__4959E263] DEFAULT 0.0000 FOR [FW];

-- AlterTable
ALTER TABLE [dbo].[purchasereturn] DROP CONSTRAINT [DF__purchaser__Amoun__7ABC33CD],
[DF__purchaser__Branc__09FE775D],
[DF__purchaser__CessA__0DCF0841],
[DF__purchaser__CgstA__035179CE],
[DF__purchaser__DisAm__0169315C],
[DF__purchaser__Disco__7D98A078],
[DF__purchaser__IgstA__04459E07],
[DF__purchaser__Invoi__7CA47C3F],
[DF__purchaser__ItemC__76EBA2E9],
[DF__purchaser__NetAm__062DE679],
[DF__purchaser__PRQty__78D3EB5B],
[DF__purchaser__PRate__79C80F94],
[DF__purchaser__Round__08162EEB],
[DF__purchaser__SPDis__0539C240],
[DF__purchaser__SgstA__025D5595],
[DF__purchaser__TcsAm__0CDAE408],
[DF__purchaser__UnitP__77DFC722],
[DF__purchaser__Vendo__7BB05806],
[DF__purchasere__Cgst__7F80E8EA],
[DF__purchasere__Igst__00750D23],
[DF__purchasere__Sgst__7E8CC4B1],
[DF__purchasere__TCSP__0BE6BFCF],
[DF__purchaseret__MRP__0AF29B96],
[DF__purchaseret__Tax__07220AB2],
[DF__purchaseretu__FW__090A5324];
ALTER TABLE [dbo].[purchasereturn] ADD CONSTRAINT [DF__purchaser__Amoun__7C1A6C5A] DEFAULT 0.000 FOR [Amount], CONSTRAINT [DF__purchaser__Branc__0B5CAFEA] DEFAULT '' FOR [BranchName], CONSTRAINT [DF__purchaser__CessA__35A7EF71] DEFAULT 0 FOR [CessAmt], CONSTRAINT [DF__purchaser__CgstA__04AFB25B] DEFAULT 0.0000 FOR [CgstAmt], CONSTRAINT [DF__purchaser__DisAm__02C769E9] DEFAULT 0.0000 FOR [DisAmt], CONSTRAINT [DF__purchaser__Disco__7EF6D905] DEFAULT 0 FOR [Discount], CONSTRAINT [DF__purchaser__IgstA__05A3D694] DEFAULT 0.0000 FOR [IgstAmt], CONSTRAINT [DF__purchaser__ItemC__7849DB76] DEFAULT 0 FOR [ItemCode], CONSTRAINT [DF__purchaser__NetAm__078C1F06] DEFAULT 0.0000 FOR [NetAmount], CONSTRAINT [DF__purchaser__PRQty__7A3223E8] DEFAULT 0 FOR [PRQty], CONSTRAINT [DF__purchaser__PRate__7B264821] DEFAULT 0.0000 FOR [PRate], CONSTRAINT [DF__purchaser__RefNo__7E02B4CC] DEFAULT 0 FOR [InvoiceNo], CONSTRAINT [DF__purchaser__Round__09746778] DEFAULT 0.00 FOR [RoundOff], CONSTRAINT [DF__purchaser__SPDis__0697FACD] DEFAULT 0.0000 FOR [SPDisAmt], CONSTRAINT [DF__purchaser__SgstA__03BB8E22] DEFAULT 0.0000 FOR [SgstAmt], CONSTRAINT [DF__purchaser__TcsAm__2E06CDA9] DEFAULT 0.00 FOR [TcsAmt], CONSTRAINT [DF__purchaser__UnitP__793DFFAF] DEFAULT 0 FOR [UnitPer], CONSTRAINT [DF__purchaser__Vendo__7D0E9093] DEFAULT 0 FOR [Vendor], CONSTRAINT [DF__purchasere__Cgst__00DF2177] DEFAULT 0 FOR [Cgst], CONSTRAINT [DF__purchasere__Igst__01D345B0] DEFAULT 0 FOR [Igst], CONSTRAINT [DF__purchasere__Sgst__7FEAFD3E] DEFAULT 0 FOR [Sgst], CONSTRAINT [DF__purchasere__TCSP__2D12A970] DEFAULT 0.00 FOR [TCSP], CONSTRAINT [DF__purchaseret__MRP__0C50D423] DEFAULT 0.00 FOR [MRP], CONSTRAINT [DF__purchaseret__Tax__0880433F] DEFAULT 0 FOR [Tax], CONSTRAINT [DF__purchaseretu__FW__0A688BB1] DEFAULT 0.00 FOR [FW];

-- AlterTable
ALTER TABLE [dbo].[quotation] DROP CONSTRAINT [DF__quotation__AccTy__0EC32C7A],
[DF__quotation__Amoun__16644E42],
[DF__quotation__Branc__10AB74EC],
[DF__quotation__CgstA__1FEDB87C],
[DF__quotation__Cgst__1D114BD1],
[DF__quotation__Conve__1B29035F],
[DF__quotation__Custo__0FB750B3],
[DF__quotation__Disco__1758727B],
[DF__quotation__EditM__21D600EE],
[DF__quotation__IgstA__20E1DCB5],
[DF__quotation__Igst__1E05700A],
[DF__quotation__ItemC__119F9925],
[DF__quotation__Labor__1A34DF26],
[DF__quotation__MRP__23BE4960],
[DF__quotation__Packi__1940BAED],
[DF__quotation__Rate__147C05D0],
[DF__quotation__Recei__22CA2527],
[DF__quotation__SQty__1387E197],
[DF__quotation__SRate__15702A09],
[DF__quotation__SgstA__1EF99443],
[DF__quotation__Sgst__1C1D2798],
[DF__quotation__Tax__184C96B4],
[DF__quotation__UnitP__1293BD5E];
ALTER TABLE [dbo].[quotation] ADD CONSTRAINT [DF__quotation__AccTy__56B3DD81] DEFAULT '' FOR [AccType], CONSTRAINT [DF__quotation__Amoun__5E54FF49] DEFAULT 0.0000 FOR [Amount], CONSTRAINT [DF__quotation__Branc__589C25F3] DEFAULT '' FOR [BranchName], CONSTRAINT [DF__quotation__CgstA__67DE6983] DEFAULT 0.00 FOR [CgstAmt], CONSTRAINT [DF__quotation__Cgst__6501FCD8] DEFAULT 0 FOR [Cgst], CONSTRAINT [DF__quotation__Conve__6319B466] DEFAULT 0.0000 FOR [Convenience], CONSTRAINT [DF__quotation__Custo__57A801BA] DEFAULT 0 FOR [Customer], CONSTRAINT [DF__quotation__Disco__5F492382] DEFAULT 0 FOR [Discount], CONSTRAINT [DF__quotation__EditM__69C6B1F5] DEFAULT 'No' FOR [EditMode], CONSTRAINT [DF__quotation__IgstA__68D28DBC] DEFAULT 0.00 FOR [IgstAmt], CONSTRAINT [DF__quotation__Igst__65F62111] DEFAULT 0 FOR [Igst], CONSTRAINT [DF__quotation__ItemC__59904A2C] DEFAULT 0 FOR [ItemCode], CONSTRAINT [DF__quotation__Labor__6225902D] DEFAULT 0.0000 FOR [Labor], CONSTRAINT [DF__quotation__MRP__5CC1BC92] DEFAULT 0.00 FOR [MRP], CONSTRAINT [DF__quotation__Packi__61316BF4] DEFAULT 0.0000 FOR [PackingCharges], CONSTRAINT [DF__quotation__Rate__5C6CB6D7] DEFAULT 0.0000 FOR [Rate], CONSTRAINT [DF__quotation__Recei__39788055] DEFAULT 0 FOR [Received], CONSTRAINT [DF__quotation__SQty__5B78929E] DEFAULT 0 FOR [SQty], CONSTRAINT [DF__quotation__SRate__5D60DB10] DEFAULT 0.0000 FOR [SRate], CONSTRAINT [DF__quotation__SgstA__66EA454A] DEFAULT 0.00 FOR [SgstAmt], CONSTRAINT [DF__quotation__Sgst__640DD89F] DEFAULT 0 FOR [Sgst], CONSTRAINT [DF__quotation__Tax__603D47BB] DEFAULT 0 FOR [Tax], CONSTRAINT [DF__quotation__UnitP__5A846E65] DEFAULT 0 FOR [UnitPer];

-- AlterTable
ALTER TABLE [dbo].[QuotationTerms] DROP CONSTRAINT [DF__Quotation__Branc__24B26D99];
ALTER TABLE [dbo].[QuotationTerms] ADD CONSTRAINT [DF__Quotation__Branc__7073AF84] DEFAULT '' FOR [BranchName];

-- AlterTable
EXEC SP_RENAME N'dbo.PK__ratecode__97A46CE90EF0FB38', N'PK__ratecode__97A46CE97F350AC2';

-- AlterTable
ALTER TABLE [dbo].[ReceivePayment] DROP CONSTRAINT [DF__ReceivePa__AccTy__25A691D2],
[DF__ReceivePa__Balan__278EDA44],
[DF__ReceivePa__Branc__269AB60B],
[DF__ReceivePaym__SNo__2882FE7D];
ALTER TABLE [dbo].[ReceivePayment] ADD CONSTRAINT [DF__ReceivePa__AccTy__7CD98669] DEFAULT '~' FOR [AccType], CONSTRAINT [DF__ReceivePa__Balan__55209ACA] DEFAULT 0 FOR [Balance], CONSTRAINT [DF__ReceivePa__Branc__7DCDAAA2] DEFAULT 'Main' FOR [BranchName], CONSTRAINT [DF__ReceivePaym__SNo__7EC1CEDB] DEFAULT 0 FOR [SNo];

-- AlterTable
EXEC SP_RENAME N'dbo.PK__relation__743E39C81258FE07', N'PK__relation__743E39C874020143';

-- AlterTable
ALTER TABLE [dbo].[remind] DROP CONSTRAINT [DF__remind__RemindNo__297722B6],
[DF__remind__StartFro__2A6B46EF],
[DF__remind__Status__2B5F6B28];
EXEC SP_RENAME N'dbo.PK__remind__C087AD617831B941', N'PK__remind__C087AD61DA0509CD';
ALTER TABLE [dbo].[remind] ADD CONSTRAINT [DF__remind__RemindNo__1E05700A] DEFAULT 0 FOR [RemindNo], CONSTRAINT [DF__remind__StartFro__1EF99443] DEFAULT 0 FOR [StartFrom], CONSTRAINT [DF__remind__Status__1FEDB87C] DEFAULT 'Remind' FOR [Status];

-- AlterTable
ALTER TABLE [dbo].[rt] DROP CONSTRAINT [DF__rt__Balance__2C538F61];
ALTER TABLE [dbo].[rt] ADD CONSTRAINT [DF__rt__Balance__2882FE7D] DEFAULT 0.0000 FOR [Balance];

-- AlterTable
ALTER TABLE [dbo].[SalaryGenerate] DROP CONSTRAINT [DF__SalaryGen__Absen__2E3BD7D3],
[DF__SalaryGen__Bonus__30242045],
[DF__SalaryGen__Prese__2D47B39A],
[DF__SalaryGen__Total__2F2FFC0C],
[DF__SalaryGenera__PF__3118447E];
ALTER TABLE [dbo].[SalaryGenerate] ADD CONSTRAINT [DF__SalaryGen__Absen__53385258] DEFAULT 0 FOR [Absent], CONSTRAINT [DF__SalaryGen__Bonus__5708E33C] DEFAULT 0.00 FOR [Bonus], CONSTRAINT [DF__SalaryGen__Prese__52442E1F] DEFAULT 0 FOR [Present], CONSTRAINT [DF__SalaryGen__Total__5614BF03] DEFAULT 0.00 FOR [TotalSalary], CONSTRAINT [DF__SalaryGenera__PF__57FD0775] DEFAULT 0.00 FOR [PF];

-- AlterTable
ALTER TABLE [dbo].[sales] DROP CONSTRAINT [DF__sales__AQty__73852659],
[DF__sales__AdiCess__7B264821],
[DF__sales__Amount__625A9A57],
[DF__sales__BillDisAm__7755B73D],
[DF__sales__BillDis__76619304],
[DF__sales__BranchNam__72910220],
[DF__sales__CessAmt__7D0E9093],
[DF__sales__CessP__7C1A6C5A],
[DF__sales__CgstAmt__69FBBC1F],
[DF__sales__Cgst__671F4F74],
[DF__sales__Convenien__6DCC4D03],
[DF__sales__DisAmt__6442E2C9],
[DF__sales__Discount__634EBE90],
[DF__sales__Free__5F7E2DAC],
[DF__sales__GSPrint__7849DB76],
[DF__sales__IgstAmt__6AEFE058],
[DF__sales__Igst__681373AD],
[DF__sales__Labor__6CD828CA],
[DF__sales__MRP__6FB49575],
[DF__sales__NetValue__7A3223E8],
[DF__sales__PackingCh__6BE40491],
[DF__sales__QtyDisAmt__719CDDE7],
[DF__sales__QtyDis__70A8B9AE],
[DF__sales__Qty__5CA1C101],
[DF__sales__Rate_Type__6EC0713C],
[DF__sales__Rate__607251E5],
[DF__sales__S.P__793DFFAF],
[DF__sales__SMPer__74794A92],
[DF__sales__SQty__5E8A0973],
[DF__sales__SRPer__756D6ECB],
[DF__sales__SRate__6166761E],
[DF__sales__SgstAmt__690797E6],
[DF__sales__Sgst__662B2B3B],
[DF__sales__TCSP__7EF6D905],
[DF__sales__Tax__65370702],
[DF__sales__TcsAmt__7E02B4CC],
[DF__sales__UPer__5D95E53A];
EXEC SP_RENAME N'dbo.PK__sales__C579B10AA4FFD00B', N'PK__sales__C579B10A85451A9D';
ALTER TABLE [dbo].[sales] ADD CONSTRAINT [DF__sales__AQty__662B2B3B] DEFAULT 0.000 FOR [AQty], CONSTRAINT [DF__sales__AdiCess__1BE81D6E] DEFAULT 0.00 FOR [AdiCess], CONSTRAINT [DF__sales__Amount__55009F39] DEFAULT 0.000 FOR [Amount], CONSTRAINT [DF__sales__BillDisAm__69FBBC1F] DEFAULT 0.00 FOR [BillDisAmt], CONSTRAINT [DF__sales__BillDis__690797E6] DEFAULT 0.000 FOR [BillDis], CONSTRAINT [DF__sales__BranchNam__65370702] DEFAULT '' FOR [BranchName], CONSTRAINT [DF__sales__CessAmt__1FB8AE52] DEFAULT 0.00 FOR [CessAmt], CONSTRAINT [DF__sales__CessP__1EC48A19] DEFAULT 0.00 FOR [CessP], CONSTRAINT [DF__sales__CgstAmt__5CA1C101] DEFAULT 0.0000 FOR [CgstAmt], CONSTRAINT [DF__sales__Cgst__59C55456] DEFAULT 0 FOR [Cgst], CONSTRAINT [DF__sales__Convenien__607251E5] DEFAULT 0.0000 FOR [Convenience], CONSTRAINT [DF__sales__DisAmt__56E8E7AB] DEFAULT 0 FOR [DisAmt], CONSTRAINT [DF__sales__Discount__55F4C372] DEFAULT 0 FOR [Discount], CONSTRAINT [DF__sales__Free__5224328E] DEFAULT 0 FOR [Free], CONSTRAINT [DF__sales__GSPrint__6AEFE058] DEFAULT 'No' FOR [GSPrint], CONSTRAINT [DF__sales__IgstAmt__5D95E53A] DEFAULT 0.0000 FOR [IgstAmt], CONSTRAINT [DF__sales__Igst__5AB9788F] DEFAULT 0 FOR [Igst], CONSTRAINT [DF__sales__Labor__5F7E2DAC] DEFAULT 0.0000 FOR [Labor], CONSTRAINT [DF__sales__MRP__625A9A57] DEFAULT 0.0000 FOR [MRP], CONSTRAINT [DF__sales__NetValue__6CD828CA] DEFAULT 0 FOR [NetValue], CONSTRAINT [DF__sales__PackingCh__5E8A0973] DEFAULT 0.0000 FOR [PackingCharges], CONSTRAINT [DF__sales__QtyDisAmt__6442E2C9] DEFAULT 0.0000 FOR [QtyDisAmt], CONSTRAINT [DF__sales__QtyDis__634EBE90] DEFAULT 0.0000 FOR [QtyDis], CONSTRAINT [DF__sales__Qty__4F47C5E3] DEFAULT 0 FOR [Qty], CONSTRAINT [DF__sales__Rate_Type__6166761E] DEFAULT 'Maximum' FOR [Rate_Type], CONSTRAINT [DF__sales__Rate__531856C7] DEFAULT 0.0000 FOR [Rate], CONSTRAINT [DF__sales__S.P__6BE40491] DEFAULT 0.00 FOR [S.P], CONSTRAINT [DF__sales__SMPer__671F4F74] DEFAULT 0.000 FOR [SMPer], CONSTRAINT [DF__sales__SQty__51300E55] DEFAULT 0 FOR [SQty], CONSTRAINT [DF__sales__SRPer__681373AD] DEFAULT 0.000 FOR [SRPer], CONSTRAINT [DF__sales__SRate__540C7B00] DEFAULT 0.0000 FOR [SRate], CONSTRAINT [DF__sales__SgstAmt__5BAD9CC8] DEFAULT 0.0000 FOR [SgstAmt], CONSTRAINT [DF__sales__Sgst__58D1301D] DEFAULT 0 FOR [Sgst], CONSTRAINT [DF__sales__TCSP__2FEF161B] DEFAULT 0.00 FOR [TCSP], CONSTRAINT [DF__sales__Tax__57DD0BE4] DEFAULT 0 FOR [Tax], CONSTRAINT [DF__sales__TcsAmt__2EFAF1E2] DEFAULT 0.00 FOR [TcsAmt], CONSTRAINT [DF__sales__UPer__503BEA1C] DEFAULT 0 FOR [UPer];

-- AlterTable
ALTER TABLE [dbo].[SalesOrder] DROP CONSTRAINT [DF__SalesOrde__DCQty__35DCF99B],
[DF__SalesOrde__PurNO__33008CF0],
[DF__SalesOrde__RemQt__36D11DD4],
[DF__SalesOrde__Remin__37C5420D],
[DF__SalesOrde__Sales__33F4B129],
[DF__SalesOrder__DCNO__34E8D562],
[DF__SalesOrder__PONO__320C68B7];
EXEC SP_RENAME N'dbo.PK__SalesOrd__4BE438A52D48E504', N'PK__SalesOrd__4BE438A58C24305A';
ALTER TABLE [dbo].[SalesOrder] ADD CONSTRAINT [DF__SalesOrde__DCQty__3A6CA48E] DEFAULT 0 FOR [DCQty], CONSTRAINT [DF__SalesOrde__PurNO__2EA5EC27] DEFAULT 'NIL' FOR [PurNO], CONSTRAINT [DF__SalesOrde__RemQt__3C54ED00] DEFAULT 0 FOR [RemQty], CONSTRAINT [DF__SalesOrde__Remin__5AD97420] DEFAULT 0 FOR [ReminQty], CONSTRAINT [DF__SalesOrde__Sales__2F9A1060] DEFAULT 'NIL' FOR [SalesNO], CONSTRAINT [DF__SalesOrder__DCNO__308E3499] DEFAULT 'NIL' FOR [DCNO], CONSTRAINT [DF__SalesOrder__PONO__2DB1C7EE] DEFAULT 'NIL' FOR [PONO];

-- AlterTable
ALTER TABLE [dbo].[salesreturn] DROP CONSTRAINT [DF__salesretu__Accou__4707859D],
[DF__salesretu__Amoun__3D7E1B63],
[DF__salesretu__Branc__49E3F248],
[DF__salesretu__CessA__4BCC3ABA],
[DF__salesretu__CgstA__451F3D2B],
[DF__salesretu__Custo__38B96646],
[DF__salesretu__DisAm__3F6663D5],
[DF__salesretu__Disco__3E723F9C],
[DF__salesretu__IgstA__46136164],
[DF__salesretu__ItemC__39AD8A7F],
[DF__salesretu__Packi__47FBA9D6],
[DF__salesretu__Round__48EFCE0F],
[DF__salesretu__SRQty__3B95D2F1],
[DF__salesretu__SRate__3C89F72A],
[DF__salesretu__SgstA__442B18F2],
[DF__salesretu__UnitP__3AA1AEB8],
[DF__salesretur__Cgst__4242D080],
[DF__salesretur__Igst__4336F4B9],
[DF__salesretur__Sgst__414EAC47],
[DF__salesreturn__MRP__4AD81681],
[DF__salesreturn__Tax__405A880E];
ALTER TABLE [dbo].[salesreturn] ADD CONSTRAINT [DF__salesretu__Accou__22401542] DEFAULT '0' FOR [Account], CONSTRAINT [DF__salesretu__Amoun__18B6AB08] DEFAULT 0.0000 FOR [Amount], CONSTRAINT [DF__salesretu__Branc__251C81ED] DEFAULT '' FOR [BranchName], CONSTRAINT [DF__salesretu__CessA__38845C1C] DEFAULT 0 FOR [CessAmt], CONSTRAINT [DF__salesretu__CgstA__2057CCD0] DEFAULT 0.0000 FOR [CgstAmt], CONSTRAINT [DF__salesretu__Custo__13F1F5EB] DEFAULT 0 FOR [Customer], CONSTRAINT [DF__salesretu__DisAm__1A9EF37A] DEFAULT 0.0000 FOR [DisAmt], CONSTRAINT [DF__salesretu__Disco__19AACF41] DEFAULT 0 FOR [Discount], CONSTRAINT [DF__salesretu__IgstA__214BF109] DEFAULT 0.0000 FOR [IgstAmt], CONSTRAINT [DF__salesretu__ItemC__14E61A24] DEFAULT 0 FOR [ItemCode], CONSTRAINT [DF__salesretu__Packi__2334397B] DEFAULT 0.0000 FOR [PackingCharges], CONSTRAINT [DF__salesretu__Round__24285DB4] DEFAULT 0.0000 FOR [RoundOff], CONSTRAINT [DF__salesretu__SRQty__16CE6296] DEFAULT 0.000 FOR [SRQty], CONSTRAINT [DF__salesretu__SRate__17C286CF] DEFAULT 0.0000 FOR [SRate], CONSTRAINT [DF__salesretu__SgstA__1F63A897] DEFAULT 0.0000 FOR [SgstAmt], CONSTRAINT [DF__salesretu__UnitP__15DA3E5D] DEFAULT 0 FOR [UnitPer], CONSTRAINT [DF__salesretur__Cgst__1D7B6025] DEFAULT 0 FOR [Cgst], CONSTRAINT [DF__salesretur__Igst__1E6F845E] DEFAULT 0 FOR [Igst], CONSTRAINT [DF__salesretur__Sgst__1C873BEC] DEFAULT 0 FOR [Sgst], CONSTRAINT [DF__salesreturn__MRP__2610A626] DEFAULT 0.00 FOR [MRP], CONSTRAINT [DF__salesreturn__Tax__1B9317B3] DEFAULT 0 FOR [Tax];

-- AlterTable
ALTER TABLE [dbo].[selecttable] DROP CONSTRAINT [DF__selecttable__Sno__0697FACD];
ALTER TABLE [dbo].[selecttable] ADD CONSTRAINT [DF__selecttable__Sno__2D47B39A] DEFAULT 0 FOR [Sno];

-- AlterTable
ALTER TABLE [dbo].[showcolumn] DROP CONSTRAINT [DF__showcolum__Colum__4DB4832C],
[DF__showcolum__FormN__4CC05EF3],
[DF__showcolum__Syste__4EA8A765];
EXEC SP_RENAME N'dbo.PK__showcolu__6B86EABE25481F16', N'PK__showcolu__6B86EABEBE7F4553';
ALTER TABLE [dbo].[showcolumn] ADD CONSTRAINT [DF__showcolum__Colum__3118447E] DEFAULT '' FOR [ColumnName], CONSTRAINT [DF__showcolum__FormN__30242045] DEFAULT '' FOR [FormName], CONSTRAINT [DF__showcolum__Syste__320C68B7] DEFAULT '' FOR [System];

-- AlterTable
ALTER TABLE [dbo].[showcolumns] DROP CONSTRAINT [DF__showcolumns__SNo__0B5CAFEA];
EXEC SP_RENAME N'dbo.PK__showcolu__83774BE9A365D04E', N'PK__showcolu__83774BE98C283A38';
ALTER TABLE [dbo].[showcolumns] ADD CONSTRAINT [DF__showcolumns__SNo__151B244E] DEFAULT 0 FOR [SNo];

-- AlterTable
ALTER TABLE [dbo].[stock] DROP CONSTRAINT [DF__stock__AQty__19AACF41],
[DF__stock__BranchNam__0D44F85C],
[DF__stock__Free__13F1F5EB],
[DF__stock__ItemCode__0F2D40CE],
[DF__stock__LC__1A9EF37A],
[DF__stock__LTQty__18B6AB08],
[DF__stock__Location__0E391C95],
[DF__stock__MRP__1C873BEC],
[DF__stock__OQty__10216507],
[DF__stock__PQty__11158940],
[DF__stock__PRQty__1209AD79],
[DF__stock__SCQty__15DA3E5D],
[DF__stock__SIQty__16CE6296],
[DF__stock__SQty__12FDD1B2],
[DF__stock__SRQty__14E61A24],
[DF__stock__STQty__17C286CF],
[DF__stock__SystemNam__1B9317B3];
ALTER TABLE [dbo].[stock] ADD CONSTRAINT [DF__stock__AQty__6B0FDBE9] DEFAULT 0 FOR [AQty], CONSTRAINT [DF__stock__BranchNam__5EAA0504] DEFAULT '' FOR [BranchName], CONSTRAINT [DF__stock__Free__65570293] DEFAULT 0 FOR [Free], CONSTRAINT [DF__stock__ItemCode__60924D76] DEFAULT 0 FOR [ItemCode], CONSTRAINT [DF__stock__LC__6C040022] DEFAULT 0 FOR [LC], CONSTRAINT [DF__stock__LTQty__6A1BB7B0] DEFAULT 0 FOR [LTQty], CONSTRAINT [DF__stock__Location__5F9E293D] DEFAULT '' FOR [Location], CONSTRAINT [DF__stock__MRP__6DEC4894] DEFAULT 0.00 FOR [MRP], CONSTRAINT [DF__stock__OQty__618671AF] DEFAULT 0 FOR [OQty], CONSTRAINT [DF__stock__PQty__627A95E8] DEFAULT 0 FOR [PQty], CONSTRAINT [DF__stock__PRQty__636EBA21] DEFAULT 0 FOR [PRQty], CONSTRAINT [DF__stock__SCQty__673F4B05] DEFAULT 0 FOR [SCQty], CONSTRAINT [DF__stock__SIQty__68336F3E] DEFAULT 0 FOR [SIQty], CONSTRAINT [DF__stock__SQty__6462DE5A] DEFAULT 0 FOR [SQty], CONSTRAINT [DF__stock__SRQty__664B26CC] DEFAULT 0 FOR [SRQty], CONSTRAINT [DF__stock__STQty__69279377] DEFAULT 0 FOR [STQty], CONSTRAINT [DF__stock__SystemNam__6CF8245B] DEFAULT '' FOR [SystemName];

-- AlterTable
ALTER TABLE [dbo].[StockCorrection] DROP CONSTRAINT [DF__StockCorr__ALQty__52793849],
[DF__StockCorr__APQty__51851410],
[DF__StockCorr__Amoun__5090EFD7],
[DF__StockCorr__Branc__5555A4F4],
[DF__StockCorr__EditM__546180BB],
[DF__StockCorr__ItemC__4F9CCB9E],
[DF__StockCorrec__MRP__5649C92D],
[DF__StockCorrect__LC__536D5C82];
EXEC SP_RENAME N'dbo.PK__StockCor__FDE99791863FF917', N'PK__StockCor__FDE997918721B4AE';
ALTER TABLE [dbo].[StockCorrection] ADD CONSTRAINT [DF__StockCorr__ALQty__4BCC3ABA] DEFAULT 0 FOR [ALQty], CONSTRAINT [DF__StockCorr__APQty__4AD81681] DEFAULT 0 FOR [APQty], CONSTRAINT [DF__StockCorr__Amoun__49E3F248] DEFAULT 0.0000 FOR [Amount], CONSTRAINT [DF__StockCorr__Branc__4EA8A765] DEFAULT '' FOR [BranchName], CONSTRAINT [DF__StockCorr__EditM__4DB4832C] DEFAULT 'No' FOR [EditMode], CONSTRAINT [DF__StockCorr__ItemC__48EFCE0F] DEFAULT 0 FOR [ItemCode], CONSTRAINT [DF__StockCorrec__MRP__4F9CCB9E] DEFAULT 0.00 FOR [MRP], CONSTRAINT [DF__StockCorrect__LC__4CC05EF3] DEFAULT 0.0000 FOR [LC];

-- AlterTable
ALTER TABLE [dbo].[StockIssue] DROP CONSTRAINT [DF__StockIssu__Amoun__5B0E7E4A],
[DF__StockIssu__Remin__592635D8],
[DF__StockIssu__SIQty__573DED66],
[DF__StockIssu__UnitP__5C02A283],
[DF__StockIssue__Rate__5A1A5A11],
[DF__StockIssue__SQty__5832119F];
EXEC SP_RENAME N'dbo.PK__StockIss__809DDC7EDC463F64', N'PK__StockIss__809DDC7E5A61491D';
ALTER TABLE [dbo].[StockIssue] ADD CONSTRAINT [DF__StockIssu__Amoun__50C5FA01] DEFAULT 0.0000 FOR [Amount], CONSTRAINT [DF__StockIssu__Remin__4EDDB18F] DEFAULT 0 FOR [ReminQty], CONSTRAINT [DF__StockIssu__SIQty__4CF5691D] DEFAULT 0 FOR [SIQty], CONSTRAINT [DF__StockIssu__UnitP__51BA1E3A] DEFAULT 0 FOR [UnitPer], CONSTRAINT [DF__StockIssue__Cost__4FD1D5C8] DEFAULT 0.0000 FOR [Rate], CONSTRAINT [DF__StockIssue__SQty__4DE98D56] DEFAULT 0 FOR [SQty];

-- AlterTable
ALTER TABLE [dbo].[stockleadger] DROP CONSTRAINT [DF__stocklead__Closi__5EDF0F2E],
[DF__stocklead__Inwar__5CF6C6BC],
[DF__stocklead__Outwa__5DEAEAF5];
ALTER TABLE [dbo].[stockleadger] ADD CONSTRAINT [DF__stocklead__Closi__2CFD9AD7] DEFAULT 0 FOR [ClosingStock], CONSTRAINT [DF__stocklead__Inwar__2B155265] DEFAULT 0 FOR [Inward], CONSTRAINT [DF__stocklead__Outwa__2C09769E] DEFAULT 0 FOR [Outward];

-- AlterTable
ALTER TABLE [dbo].[tablemaster] DROP CONSTRAINT [DF__tablemast__NoOfP__24285DB4];
EXEC SP_RENAME N'dbo.PK__tablemas__7D5F09DD8F1BB818', N'PK__tablemas__7D5F09DDCF932E34';
ALTER TABLE [dbo].[tablemaster] ADD CONSTRAINT [DF__tablemast__NoOfP__1367E606] DEFAULT 0 FOR [NoOfPrint];

-- AlterTable
ALTER TABLE [dbo].[tempshowcols] DROP CONSTRAINT [DF__tempshowc__Colwi__5FD33367];
EXEC SP_RENAME N'dbo.PK__tempshow__4C180F0B97A8899E', N'PK__tempshow__4C180F0BFF40A0F7';
ALTER TABLE [dbo].[tempshowcols] ADD CONSTRAINT [DF__tempshowc__Colwi__5555A4F4] DEFAULT 0 FOR [Colwidth];

-- AlterTable
ALTER TABLE [dbo].[tempshowcolss] DROP CONSTRAINT [DF__tempshowc__Colwi__60C757A0];
EXEC SP_RENAME N'dbo.PK__tempshow__4C180F0BF48D553A', N'PK__tempshow__4C180F0B2F95D6A2';
ALTER TABLE [dbo].[tempshowcolss] ADD CONSTRAINT [DF__tempshowc__Colwi__5832119F] DEFAULT 0 FOR [Colwidth];

-- AlterTable
EXEC SP_RENAME N'dbo.PK__terms__81B78A2E8E687415', N'PK__terms__81B78A2E59348414';

-- AlterTable
ALTER TABLE [dbo].[TmpSales] DROP CONSTRAINT [DF__TmpSales__CessAm__61BB7BD9];
ALTER TABLE [dbo].[TmpSales] ADD CONSTRAINT [DF__TmpSales__CessAm__1DD065E0] DEFAULT 0.00 FOR [CessAmt];

-- AlterTable
ALTER TABLE [dbo].[tmpstock] DROP CONSTRAINT [DF__tmpstock__ItemCo__62AFA012],
[DF__tmpstock__Qty__63A3C44B];
ALTER TABLE [dbo].[tmpstock] ADD CONSTRAINT [DF__tmpstock__ItemCo__5C02A283] DEFAULT 0 FOR [ItemCode], CONSTRAINT [DF__tmpstock__Qty__5CF6C6BC] DEFAULT 0 FOR [Qty];

-- AlterTable
ALTER TABLE [dbo].[tradestock] DROP CONSTRAINT [DF__tradestoc__InWgt__668030F6],
[DF__tradestoc__ItemC__6497E884],
[DF__tradestoc__OutWg__6774552F],
[DF__tradestoc__UnitP__658C0CBD];
ALTER TABLE [dbo].[tradestock] ADD CONSTRAINT [DF__tradestoc__InWgt__61BB7BD9] DEFAULT 0.000 FOR [InWgt], CONSTRAINT [DF__tradestoc__ItemC__5FD33367] DEFAULT 0 FOR [ItemCode], CONSTRAINT [DF__tradestoc__OutWg__62AFA012] DEFAULT 0.000 FOR [OutWgt], CONSTRAINT [DF__tradestoc__UnitP__60C757A0] DEFAULT 0 FOR [UnitPer];

-- AlterTable
ALTER TABLE [dbo].[trs] DROP CONSTRAINT [DF__trs__Balance__68687968],
[DF__trs__OrderBy__695C9DA1];
ALTER TABLE [dbo].[trs] ADD CONSTRAINT [DF__trs__Balance__6774552F] DEFAULT 0.0000 FOR [Balance], CONSTRAINT [DF__trs__OrderBy__68687968] DEFAULT 0 FOR [OrderBy];

-- AlterTable
ALTER TABLE [dbo].[typeofaccounts] DROP CONSTRAINT [DF__typeofacc__Order__336AA144];
EXEC SP_RENAME N'dbo.PK__typeofac__6EFCD43502856B7D', N'PK__typeofac__6EFCD4359CFDA8D1';
ALTER TABLE [dbo].[typeofaccounts] ADD CONSTRAINT [DF__typeofacc__Order__6C390A4C] DEFAULT 0 FOR [OrderBy];

-- AlterTable
ALTER TABLE [dbo].[userslist] DROP CONSTRAINT [DF__userslist__Login__373B3228];
EXEC SP_RENAME N'dbo.PK__userslis__9C5CAF9B34809B16', N'PK__userslis__9C5CAF9BFEDDAFCB';
ALTER TABLE [dbo].[userslist] ADD CONSTRAINT [DF__userslist__Login__70099B30] DEFAULT 'Logout' FOR [LoginStatus];

-- AlterTable
ALTER TABLE [dbo].[Vendormaster] DROP CONSTRAINT [DF__Vendormas__DelDa__6C390A4C],
[DF__Vendormas__Invoi__6B44E613],
[DF__Vendormas__Vendo__6A50C1DA],
[DF__Vendormaste__TCS__6D2D2E85];
EXEC SP_RENAME N'dbo.PK__Vendorma__42A527B3B82E9E51', N'PK__Vendorma__42A527B3AE9A7A6C';
ALTER TABLE [dbo].[Vendormaster] ADD CONSTRAINT [DF__Vendormas__DelDa__60A75C0F] DEFAULT 0 FOR [DelDays], CONSTRAINT [DF__Vendormas__Invoi__5FB337D6] DEFAULT 'R' FOR [InvoiceType], CONSTRAINT [DF__Vendormas__Vendo__5EBF139D] DEFAULT 0 FOR [Vendor], CONSTRAINT [DF__Vendormaste__TCS__33BFA6FF] DEFAULT 0 FOR [TCS];

-- AlterTable
ALTER TABLE [dbo].[WaiterMaster] DROP CONSTRAINT [DF__WaiterMas__Activ__3BFFE745],
[DF__WaiterMas__Login__3CF40B7E];
EXEC SP_RENAME N'dbo.PK__WaiterMa__D2078AB5DE1704B5', N'PK__WaiterMa__D2078AB58B12E04F';
ALTER TABLE [dbo].[WaiterMaster] ADD CONSTRAINT [DF__WaiterMas__Activ__6383C8BA] DEFAULT 'Active' FOR [ActiveStatus], CONSTRAINT [DF__WaiterMas__Login__6477ECF3] DEFAULT 'Administrator' FOR [LoginName];

-- RenameForeignKey
EXEC sp_rename 'dbo.OrderMaster_ItemCode_fkey', 'FK_OM_IM', 'OBJECT';

-- RenameForeignKey
EXEC sp_rename 'dbo.OrderMaster_TableNo_fkey', 'FK_OM_TM', 'OBJECT';

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
