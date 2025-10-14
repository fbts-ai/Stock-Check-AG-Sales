// Report 50106 "pie_report Dont Run"
// {
//     //WordLayout = './Layouts/pie_reportDontRun.docx'; DefaultLayout = Word;
//     ProcessingOnly = true;
//     ApplicationArea = all;
//     UsageCategory = Administration;

//     requestpage
//     {


//         SaveValues = false;
//         layout
//         {
//             area(content)
//             {
//                 group(Options)
//                 {
//                     Caption = 'Options';
//                     // field(ForNavOpenDesigner;ReportForNavOpenDesigner)
//                     // {
//                     // 	ApplicationArea = Basic;
//                     // 	Caption = 'Design';
//                     // 	Visible = ReportForNavAllowDesign;
//                     // }
//                 }
//             }
//         }

//         actions
//         {
//         }
//     }

//     trigger OnInitReport()
//     begin
//         // ERROR('Do Not Run');


//     end;

//     trigger OnPreReport()
//     begin
//         if Confirm('Do you want to DELETE ALL DATA ?', true) then begin
//             "10001230".DeleteAll;
//             "10012144".DeleteAll; //KOT Trans. Line Mod. Mapping
//             "10012143".DeleteAll; //KOT Trans. Line Mapping
//             "LSC Trans. Hospitality Entry".DeleteAll;
//             "16412".DeleteAll; //Detailed GST Entry Buffer
//             "16418".DeleteAll; //GST Ledger Entry
//             "16419".DeleteAll; //Detailed GST Ledger Entry
//             "17".DeleteAll;//G/L Entry
//                            //"13760".DeleteAll;//Posted Structure Order Details
//             "25".DeleteAll;//Vendor Ledger Entry
//             "32".DeleteAll;//Item Ledger Entry
//             "36".DeleteAll;//Sales Header
//             "37".DeleteAll;//Sales Line
//             // "38".DeleteAll;//Purchase Header
//             // "39".DeleteAll;//Purchase Line
//             // "43".DeleteAll;//Purch
//             "44".DeleteAll;//Sales Comment Line
//             "45".DeleteAll;//G/L Register
//             "46".DeleteAll;//Item Register
//             "83".DeleteAll;//Item Journal Line
//             "96".DeleteAll;//G/L Budget Entry
//             "97".DeleteAll;//Comment Line
//             "110".DeleteAll;//Sales Shipment Header
//             "111".DeleteAll;//Sales Shipment Line
//             "112".DeleteAll;//Sales Invoice Header
//             "113".DeleteAll;//Sales Invoice Line
//             "114".DeleteAll;//Sales Cr
//             "115".DeleteAll;//Sales Cr
//             "115".DeleteAll;//Sales Cr
//             "160".DeleteAll;//Res
//             "169".DeleteAll;//Job Ledger Entry
//             "179".DeleteAll;//Reversal Entry
//             "203".DeleteAll;//Res
//             "246".DeleteAll;//Requisition Line
//             "265".DeleteAll;//Document Entry
//                             //"270".DELETEALL;//Bank Account
//             "271".DeleteAll;//Bank Account Ledger Entry
//             "272".DeleteAll;//Check Ledger Entry
//             "275".DeleteAll;//Bank Account Statement
//             "276".DeleteAll;//Bank Account Statement line
//             "281".DeleteAll;//Phys
//             "295".DeleteAll;//Reminder Header
//             "296".DeleteAll;//Reminder Line
//             "297".DeleteAll;//Issued Reminder Header
//             "298".DeleteAll;//Issued Reminder Line
//             "299".DeleteAll;//Reminder Comment Line
//             "300".DeleteAll;//Reminder/Fin
//             "302".DeleteAll;//Finance Charge Memo Header
//             "304".DeleteAll;//Issued Fin
//             "305".DeleteAll;//Issued Fin
//             "306".DeleteAll;//Fin
//             "317".DeleteAll;//Payable Vendor Ledger Entry
//             "336".DeleteAll;//Tracking Specification
//             "337".DeleteAll;//Reservation Entry
//             "338".DeleteAll;//Entry Summary
//             "339".DeleteAll;//Item Application Entry
//             "343".DeleteAll;//Item Application Entry History
//                             //"348".DELETEALL;//Dimension
//                             //"349".DELETEALL;//Dimension Value
//             "350".DeleteAll;//Dimension Combination
//             "351".DeleteAll;//Dimension Value Combination
//                             //"352".DELETEALL;//Default Dimension
//             "363".DeleteAll;//Analysis View
//             "364".DeleteAll;//Analysis View Filter
//             "365".DeleteAll;//Analysis View Entry
//             "366".DeleteAll;//Analysis View Budget Entry
//             "379".DeleteAll;//Detailed Cust
//             "380".DeleteAll;//Detailed Vendor Ledg
//             "384".DeleteAll;//Reconcile CV Acc Buffer
//             "403".DeleteAll;//Change Log Setup (Table)
//             "404".DeleteAll;//Change Log Setup (Field)
//             "405".DeleteAll;//Change Log Entry
//             "413".DeleteAll;//IC Partner
//             "414".DeleteAll;//IC Outbox Transaction
//             "415".DeleteAll;//IC Outbox Jnl
//             "416".DeleteAll;//Handled IC Outbox Trans
//             "417".DeleteAll;//Handled IC Outbox Jnl
//             "419".DeleteAll;//IC Inbox Jnl
//             "421".DeleteAll;//Handled IC Inbox Jnl
//             "424".DeleteAll;//IC Comment Line
//             "454".DeleteAll;//Approval Entry
//             "455".DeleteAll;//Approval Comment Line
//             "456".DeleteAll;//Posted Approval Entry
//             "457".DeleteAll;//Posted Approval Comment Line
//             "458".DeleteAll;//Overdue Approval Entry
//             "480".DeleteAll;//Dimension Set Entry
//             "481".DeleteAll;//Dimension Set Tree Node
//                             //"751".DELETEALL;//Standard General Journal Line
//                             //"753".DELETEALL;//Standard Item Journal Line
//             "900".DeleteAll;//Assembly Header
//             "901".DeleteAll;//Assembly Line
//             "904".DeleteAll;//Assemble-to-Order Link
//             "906".DeleteAll;//Assembly Comment Line
//             "910".DeleteAll;//Posted Assembly Header
//             "911".DeleteAll;//Posted Assembly Line
//             "914".DeleteAll;//Posted Assemble-to-Order Link
//             "1003".DeleteAll;//Job Planning Line
//             "1004".DeleteAll;//Job WIP Entry
//             "1005".DeleteAll;//Job WIP G/L Entry
//             "1015".DeleteAll;//Job Entry No
//             "5050".DeleteAll;//Contact
//             "5061".DeleteAll;//Rlshp
//             "5065".DeleteAll;//Interaction Log Entry
//             "5067".DeleteAll;//Contact Job Responsibility
//             "5072".DeleteAll;//Campaign Entry
//             "5092".DeleteAll;//Opportunity
//             "5093".DeleteAll;//Opportunity Entry
//             "5107".DeleteAll;//Sales Header Archive
//             "5108".DeleteAll;//Sales Line Archive
//             "5109".DeleteAll;//Purchase Header Archive
//             "5110".DeleteAll;//Purchase Line Archive
//             "5125".DeleteAll;//Purch
//             "5126".DeleteAll;//Sales Comment Line Archive
//             "5208".DeleteAll;//Human Resource Comment Line
//             "5401".DeleteAll;//Item Variant
//             "5405".DeleteAll;//Production Order
//             "5406".DeleteAll;//Prod
//             "5407".DeleteAll;//Prod
//             "5409".DeleteAll;//Prod
//             "5601".DeleteAll;//FA Ledger Entry
//             "5612".DeleteAll;//FA Depreciation Book
//             "5617".DeleteAll;//FA Register
//             "5625".DeleteAll;//Maintenance Ledger Entry
//             "5629".DeleteAll;//Ins
//             "5636".DeleteAll;//Insurance Register
//             "5640".DeleteAll;//Main Asset Component
//             "5740".DeleteAll;//Transfer Header
//             "5741".DeleteAll;//Transfer Line
//             "5744".DeleteAll;//Transfer Shipment Header
//             "5745".DeleteAll;//Transfer Shipment Line
//             "5746".DeleteAll;//Transfer Receipt Header
//             "5747".DeleteAll;//Transfer Receipt Line
//             "5765".DeleteAll;//Warehouse Request
//             "5766".DeleteAll;//Warehouse Activity Header
//             "5767".DeleteAll;//Warehouse Activity Line
//             "5802".DeleteAll;//Value Entry
//             "5804".DeleteAll;//Avg
//             "5811".DeleteAll;//Post Value Entry to G/L
//             "5823".DeleteAll;//G/L - Item Ledger Relation
//             "5832".DeleteAll;//Capacity Ledger Entry
//             "5846".DeleteAll;//Inventory Report Entry
//             "5896".DeleteAll;//Inventory Adjmt
//             "5900".DeleteAll;//Service Header
//             "5901".DeleteAll;//Service Item Line
//             "5902".DeleteAll;//Service Line
//             "5907".DeleteAll;//Service Ledger Entry
//             "5908".DeleteAll;//Warranty Ledger Entry
//             "5942".DeleteAll;//Service Item Log
//             "5950".DeleteAll;//Service Order Allocation
//             "5964".DeleteAll;//Service Contract Line
//             "5965".DeleteAll;//Service Contract Header
//             "5967".DeleteAll;//Contract Change Log
//             "5969".DeleteAll;//Contract Gain/Loss Entry
//             "5971".DeleteAll;//Filed Contract Line
//             "5989".DeleteAll;//Service Shipment Item Line
//             "5990".DeleteAll;//Service Shipment Header
//             "5991".DeleteAll;//Service Shipment Line
//             "5992".DeleteAll;//Service Invoice Header
//             "5994".DeleteAll;//Service Cr
//             "6080".DeleteAll;//Service Price Group
//             "6507".DeleteAll;//Item Entry Relation
//             "6508".DeleteAll;//Value Entry Relation
//             "6650".DeleteAll;//Return Shipment Header
//             "6651".DeleteAll;//Return Shipment Line
//             "6660".DeleteAll;//Return Receipt Header
//             "6661".DeleteAll;//Return Receipt Line
//             "7004".DeleteAll;//Sales Line Discount
//             "7012".DeleteAll;//Purchase Price
//             "7311".DeleteAll;//Warehouse Journal Line
//             "7312".DeleteAll;//Warehouse Entry
//             "7313".DeleteAll;//Warehouse Register
//             "7316".DeleteAll;//Warehouse Receipt Header
//             "7317".DeleteAll;//Warehouse Receipt Line
//             "7318".DeleteAll;//Posted Whse
//             "7319".DeleteAll;//Posted Whse
//             "7320".DeleteAll;//Warehouse Shipment Header
//             "7321".DeleteAll;//Warehouse Shipment Line
//             "7322".DeleteAll;//Posted Whse
//             "7323".DeleteAll;//Posted Whse
//             "7324".DeleteAll;//Whse
//             "7325".DeleteAll;//Whse
//             "7326".DeleteAll;//Whse
//             "7331".DeleteAll;//Whse
//             "7332".DeleteAll;//Whse
//             "7333".DeleteAll;//Whse
//             "7334".DeleteAll;//Whse
//             "7603".DeleteAll;//Customized Calendar Entry
//                              // "13700".DeleteAll;//Tax Entry
//                              // "13794".DeleteAll;//Structure Order Details
//                              // "13795".DeleteAll;//Structure Order Line Details
//                              // "13798".DeleteAll;//Posted Str Order Line Details
//                              // "16480".DeleteAll;//Detailed Tax Entry Buffer
//                              // "16522".DeleteAll;//Detailed Tax Entry
//             "10000709".DeleteAll;//Retail Comment Line
//             "10000711".DeleteAll;//Price History
//             "10000731".DeleteAll;//Retail Buyer Cue
//             "10000732".DeleteAll;//Retail Store Manager Cue
//             "10000739".DeleteAll;//Store Sales
//             "10000747".DeleteAll;//Retail Campaign Header
//             "10000748".DeleteAll;//Retail Campaign Line
//             "10000758".DeleteAll;//Retail System Log
//             "10000777".DeleteAll;//Retail ICT Header
//             "10000778".DeleteAll;//Retail ICT Lines
//             "10001229".DeleteAll;//Hosp
//             "10001325".DeleteAll;//P/R Counting Header
//             "10001326".DeleteAll;//Picking / Receiving lines
//             "10001327".DeleteAll;//Posted P/R Counting Header
//             "10001328".DeleteAll;//Posted P/R Counting Lines
//             "10001330".DeleteAll;//Receiving/Picking Logfile
//             "10001352".DeleteAll;//InStore Header
//             "10001353".DeleteAll;//InStore Line
//             "10001354".DeleteAll;//InStore Header Status
//             "10001355".DeleteAll;//InStore Statistics Line
//             "10001356".DeleteAll;//InStore Difference Entry
//             "10001357".DeleteAll;//InStore Stock Req
//             "10001358".DeleteAll;//InStore Stock Req
//             "10001359".DeleteAll;//InStore Setup Verify Log
//             "10001360".DeleteAll;//InStore Dist
//             "10001404".DeleteAll;//Item Status Link
//             "10001407".DeleteAll;//Data Access Log
//             "10012117".DeleteAll;//POS Trans
//             "10012118".DeleteAll;//Transaction Guest Info
//             "10012125".DeleteAll;//KOT Header
//             "10012126".DeleteAll;//KOT Line
//             "10012127".DeleteAll;//KOT Line Routing
//             "10012128".DeleteAll;//KOT Line Modifier/Message
//             "10012132".DeleteAll;//KOT Transaction Mapping
//             "10012133".DeleteAll;//KOT Header Routing
//             "10012151".DeleteAll;//Hosp
//             "5054".DeleteAll;
//             "10012154".DeleteAll;//Pos Tr
//             "10012209".DeleteAll;//Replen
//             "10012225".DeleteAll;//Replen
//             "10012314".DeleteAll;//Vendor Perf
//             "10012315".DeleteAll;//Vendor Perf
//             "10012323".DeleteAll;//Allocation Plan Lines
//             "10012324".DeleteAll;//Allocation Plan Groups
//             "10012325".DeleteAll;//Allocation Plan Group Lines
//             "10012326".DeleteAll;//Allocation Plan Location Lines
//             "10012327".DeleteAll;//Allocation Plan Dim Values
//             "10012328".DeleteAll;//Allocation Rule Header
//             "10012329".DeleteAll;//Allocation Rule Line
//             "10012330".DeleteAll;//Allocation Rule Links
//             "10012331".DeleteAll;//Allocation Plan Document Links
//             "10012332".DeleteAll;//Allocation Dist
//             "10012333".DeleteAll;//Allocation Rule Calculation
//             "10012404".DeleteAll;//Committed Purchases
//             "10014702".DeleteAll;//Fraud Event
//             "10014703".DeleteAll;//Fraud Incident
//             "10015020".DeleteAll;//Roster Work Table
//             "10015022".DeleteAll;//Staff Schedule
//             "99000763".DeleteAll;//Routing Header
//             "99000764".DeleteAll;//Routing Line
//             "99000771".DeleteAll;//Production BOM Header
//             "99000772".DeleteAll;//Production BOM Line
//             "99000850".DeleteAll;//Planning Assignment
//             "99000851".DeleteAll;//Production Forecast Name
//             "99000852".DeleteAll;//Production Forecast Entry
//             "99001460".DeleteAll;//Trans
//             "99001465".DeleteAll;//Trans
//             "99001467".DeleteAll;//Voucher Entries
//             "99001469".DeleteAll;//Initial Entry No
//             "99001472".DeleteAll;//Transaction Header
//             "99001473".DeleteAll;//Trans
//             "99001474".DeleteAll;//Trans
//             "99001475".DeleteAll;//Trans
//             "99001477".DeleteAll;//Trans
//             "99001478".DeleteAll;//Trans
//             "99001485".DeleteAll;//Posted Statement
//             "99001487".DeleteAll;//Statement
//             "99001488".DeleteAll;//Statement Line
//             "99001489".DeleteAll;//Posted Statement Line
//             "99001490".DeleteAll;//Trans
//             "99001493".DeleteAll;//Transaction Status
//             "99001494".DeleteAll;//Trans
//             "99001495".DeleteAll;//Trans
//             "99001496".DeleteAll;//Trans
//             "99001508".DeleteAll;//Work Shift Entry
//             "99001509".DeleteAll;//Actions
//             "99001510".DeleteAll;//Transaction Archive Log
//             "99001514".DeleteAll;//Safe Entry
//             "99001547".DeleteAll;//Time Registration Entry
//             "99001558".DeleteAll;//POS Data Entry
//             "99001593".DeleteAll;//Scheduler Replication Counter
//             "99001597".DeleteAll;//Scheduler Log
//             "99001598".DeleteAll;//Scheduler Log Line
//             "99001607".DeleteAll;//POS Start Entry Line
//             "99001612".DeleteAll;//Preaction
//             "99001614".DeleteAll;//Action Counters
//             "99001615".DeleteAll;//Trans
//             "99001623".DeleteAll;//Preaction Log
//             "99001626".DeleteAll;//Trans
//             "99001627".DeleteAll;//POS Start Status
//             "99001628".DeleteAll;//POS Start Entry
//             "99001630".DeleteAll;//Trans
//             "99001632".DeleteAll;//Posted Safe Statement Line
//             "99001633".DeleteAll;//Staff Store Link
//             "99001634".DeleteAll;//POS Pick Up Warning
//             "99001642".DeleteAll;//Trans
//             "99001659".DeleteAll;//Discount Ledger Entry
//             "99001787".DeleteAll;//POS Print Header
//             "99001788".DeleteAll;//POS Print Line
//             "99008943".DeleteAll;//POS Trans
//             "99008955".DeleteAll;//POS Z-report statistics
//             "99008956".DeleteAll;//POS Y-report statistics
//             "99008980".DeleteAll;//POS Transaction
//             "99008981".DeleteAll;//POS Trans
//             "99008982".DeleteAll;//POS Trans
//             "99008983".DeleteAll;//POS Mix & Match Entry
//             "99008985".DeleteAll;//POS Counter
//             "99008987".DeleteAll;//POS Card Entry
//             "99008990".DeleteAll;//POS Voided Transaction
//             "99008991".DeleteAll;//POS Voided Trans
//             "99008992".DeleteAll;//POS Voided Infocode Entry
//             "99009015".DeleteAll;//Member Attribute Value
//             "99009034".DeleteAll;//Member Sales Entry
//             "99009039".DeleteAll;//Member Point Register
//             "99009045".DeleteAll;//Member Login
//             "120".DeleteAll; //Purch. Rcpt. Header
//             "121".DeleteAll; //Purch. Rcpt. Line
//             "122".DeleteAll; //Purch. Inv. Header
//             "123".DeleteAll; //Purch. Inv. Line
//             "124".DeleteAll; //Purch. Cr. Memo Hdr.
//             "125".DeleteAll; //Purch. Cr. Memo Line
//             "81".DeleteAll;// Posted Cash Declaration
//                            // "13729".DeleteAll;
//                            // "13730".DeleteAll;
//             "10000709".DeleteAll;
//             "10000711".DeleteAll;
//             "10012703".DeleteAll;
//             "10012704".DeleteAll;
//             "21".DeleteAll;
//         end;
//         // if NoSerLine.Find('-') then begin
//         //     repeat
//         //         //NoSerLine."Starting Date":=20090401D;
//         //         NoSerLine."Last No. Used" := '';
//         //         NoSerLine."Last Date Used" := 0D;
//         //         NoSerLine.Modify(true);
//         //     until NoSerLine.Next = 0;
//         // end;
//         Message('All Transaction data Deleted.');
//         //;ReportsForNavPre;

//     end;

//     var
//         "99009045": Record 99009045;
//         "99009015": Record 99009015;
//         "99001633": Record 99001633;
//         "99001632": Record 99001632;
//         "10015019": Record 10015019;
//         "10015018": Record 10015018;
//         "10015017": Record 10015017;
//         "10015016": Record 10015016;
//         "10015020": Record 10015020;
//         "10015022": Record 10015022;
//         "10012333": Record 10012333;
//         "10012332": Record 10012332;
//         "10012331": Record 10012331;
//         "10012330": Record 10012330;
//         "10012329": Record 10012329;
//         "10012328": Record 10012328;
//         "10012327": Record 10012327;
//         "10012326": Record 10012326;
//         "10012325": Record 10012325;
//         "10012324": Record 10012324;
//         "10012323": Record 10012323;
//         "5900": Record "Service Header";
//         "5901": Record "Service Item Line";
//         "5902": Record "Service Line";
//         "5640": Record "Main Asset Component";
//         "5612": Record "FA Depreciation Book";
//         "5407": Record "Prod. Order Component";
//         "5409": Record "Prod. Order Routing Line";
//         "5401": Record "Item Variant";
//         "5092": Record Opportunity;
//         "5093": Record "Opportunity Entry";
//         "5067": Record "Contact Job Responsibility";
//         "246": Record "Requisition Line";
//         "83": Record "Item Journal Line";
//         "17": Record "G/L Entry";
//         "21": Record "Cust. Ledger Entry";
//         "25": Record "Vendor Ledger Entry";
//         "32": Record "Item Ledger Entry";
//         "36": Record "Sales Header";
//         "37": Record "Sales Line";
//         // "38": Record "Purchase Header";
//         // "39": Record "Purchase Line";
//         //"43": Record "Purch. Comment Line";
//         "44": Record "Sales Comment Line";
//         "45": Record "G/L Register";
//         "46": Record "Item Register";
//         "96": Record "G/L Budget Entry";
//         "97": Record "Comment Line";
//         "110": Record "Sales Shipment Header";
//         "111": Record "Sales Shipment Line";
//         "112": Record "Sales Invoice Header";
//         "113": Record "Sales Invoice Line";
//         "114": Record "Sales Cr.Memo Header";
//         "115": Record "Sales Cr.Memo Line";
//         "120": Record "Purch. Rcpt. Header";
//         "121": Record "Purch. Rcpt. Line";
//         "122": Record "Purch. Inv. Header";
//         "123": Record "Purch. Inv. Line";
//         "124": Record "Purch. Cr. Memo Hdr.";
//         "125": Record "Purch. Cr. Memo Line";
//         "160": Record "Res. Capacity Entry";
//         "169": Record "Job Ledger Entry";
//         "179": Record "Reversal Entry";
//         "203": Record "Res. Ledger Entry";
//         "265": Record "Document Entry";
//         "272": Record "Check Ledger Entry";
//         "281": Record "Phys. Inventory Ledger Entry";
//         "295": Record "Reminder Header";
//         "296": Record "Reminder Line";
//         "297": Record "Issued Reminder Header";
//         "298": Record "Issued Reminder Line";
//         "299": Record "Reminder Comment Line";
//         "300": Record "Reminder/Fin. Charge Entry";
//         "302": Record "Finance Charge Memo Header";
//         "304": Record "Issued Fin. Charge Memo Header";
//         "305": Record "Issued Fin. Charge Memo Line";
//         "306": Record "Fin. Charge Comment Line";
//         "317": Record "Payable Vendor Ledger Entry";
//         "336": Record "Tracking Specification";
//         "337": Record "Reservation Entry";
//         "338": Record "Entry Summary";
//         "339": Record "Item Application Entry";
//         "343": Record "Item Application Entry History";
//         "363": Record "Analysis View";
//         "16419": Record "Detailed GST Ledger Entry";
//         "16412": Record "Detailed GST Entry Buffer";
//         "16418": Record "GST Ledger Entry";

//         "364": Record "Analysis View Filter";
//         "365": Record "Analysis View Entry";
//         "366": Record "Analysis View Budget Entry";
//         "379": Record "Detailed Cust. Ledg. Entry";
//         "380": Record "Detailed Vendor Ledg. Entry";
//         "403": Record "Change Log Setup (Table)";
//         "404": Record "Change Log Setup (Field)";
//         "405": Record "Change Log Entry";
//         "413": Record "IC Partner";
//         "414": Record "IC Outbox Transaction";
//         "415": Record "IC Outbox Jnl. Line";
//         "416": Record "Handled IC Outbox Trans.";
//         "417": Record "Handled IC Outbox Jnl. Line";
//         "419": Record "IC Inbox Jnl. Line";
//         "5054": Record 5054;
//         "421": Record "Handled IC Inbox Jnl. Line";
//         "424": Record "IC Comment Line";
//         "454": Record "Approval Entry";
//         "455": Record "Approval Comment Line";
//         "456": Record "Posted Approval Entry";
//         "457": Record "Posted Approval Comment Line";
//         "458": Record "Overdue Approval Entry";
//         "472": Record "Job Queue Entry";
//         "474": Record "Job Queue Log Entry";
//         "753": Record "Standard Item Journal Line";
//         "1003": Record "Job Planning Line";
//         "1004": Record "Job WIP Entry";
//         "1005": Record "Job WIP G/L Entry";
//         "1015": Record "Job Entry No.";
//         "5061": Record "Rlshp. Mgt. Comment Line";
//         "5065": Record "Interaction Log Entry";
//         "5072": Record "Campaign Entry";
//         "5107": Record "Sales Header Archive";
//         "5108": Record "Sales Line Archive";
//         "5109": Record "Purchase Header Archive";
//         "5110": Record "Purchase Line Archive";
//         "5125": Record "Purch. Comment Line Archive";
//         "5126": Record "Sales Comment Line Archive";
//         "5208": Record "Human Resource Comment Line";
//         "5405": Record "Production Order";
//         "5406": Record "Prod. Order Line";
//         "5601": Record "FA Ledger Entry";
//         "5617": Record "FA Register";
//         "5625": Record "Maintenance Ledger Entry";
//         "5629": Record "Ins. Coverage Ledger Entry";
//         "5636": Record "Insurance Register";
//         "5740": Record "Transfer Header";
//         "5741": Record "Transfer Line";
//         "5744": Record "Transfer Shipment Header";
//         "5745": Record "Transfer Shipment Line";
//         "5746": Record "Transfer Receipt Header";
//         "5747": Record "Transfer Receipt Line";
//         "5766": Record "Warehouse Activity Header";
//         "5767": Record "Warehouse Activity Line";
//         "5802": Record "Value Entry";
//         "5804": Record "Avg. Cost Adjmt. Entry Point";
//         "5811": Record "Post Value Entry to G/L";
//         "5832": Record "Capacity Ledger Entry";
//         "5846": Record "Inventory Report Entry";
//         "5907": Record "Service Ledger Entry";
//         "5908": Record "Warranty Ledger Entry";
//         "5942": Record "Service Item Log";
//         "5950": Record "Service Order Allocation";
//         "5964": Record "Service Contract Line";
//         "5965": Record "Service Contract Header";
//         "5967": Record "Contract Change Log";
//         "5969": Record "Contract Gain/Loss Entry";
//         "5971": Record "Filed Contract Line";
//         "5989": Record "Service Shipment Item Line";
//         "5991": Record "Service Shipment Line";
//         "5990": Record "Service Shipment Header";
//         "5992": Record "Service Invoice Header";
//         "5994": Record "Service Cr.Memo Header";
//         "6080": Record "Service Price Group";
//         "6507": Record "Item Entry Relation";
//         "6508": Record "Value Entry Relation";
//         "6650": Record "Return Shipment Header";
//         "6651": Record "Return Shipment Line";
//         "6660": Record "Return Receipt Header";
//         "6661": Record "Return Receipt Line";
//         "7004": Record "Sales Line Discount";
//         "7012": Record "Purchase Price";
//         "7311": Record "Warehouse Journal Line";
//         "7312": Record "Warehouse Entry";
//         "7313": Record "Warehouse Register";
//         "7317": Record "Warehouse Receipt Line";
//         "7316": Record "Warehouse Receipt Header";
//         "7318": Record "Posted Whse. Receipt Header";
//         "7319": Record "Posted Whse. Receipt Line";
//         "7320": Record "Warehouse Shipment Header";
//         "7321": Record "Warehouse Shipment Line";
//         "7322": Record "Posted Whse. Shipment Header";
//         "7323": Record "Posted Whse. Shipment Line";
//         "7324": Record "Whse. Put-away Request";
//         "7325": Record "Whse. Pick Request";
//         "7326": Record "Whse. Worksheet Line";
//         "7331": Record "Whse. Internal Put-away Header";
//         "7332": Record "Whse. Internal Put-away Line";
//         "7333": Record "Whse. Internal Pick Header";
//         "7334": Record "Whse. Internal Pick Line";
//         "7603": Record "Customized Calendar Entry";
//         "10000709": Record 10000709;
//         "10000711": Record 10000711;
//         "10000747": Record 10000747;
//         "10000748": Record 10000748;
//         "10000731": Record 10000731;
//         "10000732": Record 10000732;
//         "10000739": Record 10000739;
//         "10000758": Record 10000758;
//         "10000777": Record 10000777;
//         "10000778": Record 10000778;
//         "10001325": Record 10001325;
//         "10001326": Record 10001326;
//         "10001327": Record 10001327;
//         "10001328": Record 10001328;
//         "10001330": Record 10001330;
//         "10001352": Record 10001352;
//         "10001353": Record 10001353;
//         "10001354": Record 10001354;
//         "10001355": Record 10001355;
//         "10001356": Record 10001356;
//         "10001357": Record 10001357;
//         "10001358": Record 10001358;
//         "10001359": Record 10001359;
//         "10001360": Record 10001360;
//         "10001403": Record 10001403;
//         "10001404": Record 10001404;
//         "10001407": Record 10001407;
//         "10012209": Record 10012209;
//         "10012225": Record 10012225;
//         "10012314": Record 10012314;
//         "10012315": Record 10012315;
//         "10012404": Record 10012404;
//         "99000763": Record "Routing Header";
//         "99000764": Record "Routing Line";
//         "99000771": Record "Production BOM Header";
//         "99000772": Record "Production BOM Line";
//         "99000850": Record "Planning Assignment";
//         "99000851": Record "Production Forecast Name";
//         "99000852": Record "Production Forecast Entry";
//         "99001467": Record 99001467;
//         "99001469": Record 99001469;
//         "99001472": Record 99001472;
//         "99001473": Record 99001473;
//         "99001474": Record 99001474;
//         "99001475": Record 99001475;
//         "99001477": Record 99001477;
//         "99001478": Record 99001478;
//         "99001485": Record 99001485;
//         "99001487": Record 99001487;
//         "99001488": Record 99001488;
//         "99001489": Record 99001489;
//         "99001490": Record 99001490;
//         "99001493": Record 99001493;
//         "99001494": Record 99001494;
//         "99001495": Record 99001495;
//         "99001496": Record 99001496;
//         "99001508": Record 99001508;
//         "99001509": Record 99001509;
//         "99001510": Record 99001510;
//         "99001514": Record 99001514;
//         "99001558": Record 99001558;
//         "99001593": Record 99001593;
//         "99001597": Record 99001597;
//         "99001598": Record 99001598;
//         "99001607": Record 99001607;
//         "99001612": Record 99001612;
//         "99001614": Record 99001614;
//         "99001615": Record 99001615;
//         "99001623": Record 99001623;
//         "99001626": Record 99001626;
//         "99001627": Record 99001627;
//         "99001628": Record 99001628;
//         "99001630": Record 99001630;
//         "LSC Trans. Hospitality Entry": Record "LSC Trans. Hospitality Entry";
//         "99001634": Record 99001634;
//         "99008980": Record 99008980;
//         "99008981": Record 99008981;
//         "99008982": Record 99008982;
//         "99008983": Record 99008983;
//         "99008985": Record 99008985;
//         "99008987": Record 99008987;
//         "99008990": Record 99008990;
//         "99008991": Record 99008991;
//         "99008992": Record 99008992;
//         NoSerLine: Record "No. Series Line";
//         "5823": Record "G/L - Item Ledger Relation";
//         "99008943": Record 99008943;
//         "5050": Record Contact;
//         "99001460": Record 99001460;
//         "99008955": Record 99008955;
//         "99008956": Record 99008956;
//         "99009034": Record 99009034;
//         "99009039": Record 99009039;
//         "99001465": Record 99001465;
//         "99001642": Record 99001642;
//         "99001659": Record 99001659;
//         "10012117": Record 10012117;
//         "10012118": Record 10012118;
//         "10012125": Record 10012125;
//         "10012126": Record 10012126;
//         "900": Record "Assembly Header";
//         "901": Record "Assembly Line";
//         "904": Record "Assemble-to-Order Link";
//         "906": Record "Assembly Comment Line";
//         "910": Record "Posted Assembly Header";
//         "911": Record "Posted Assembly Line";
//         "914": Record "Posted Assemble-to-Order Link";
//         "10012127": Record 10012127;
//         "10012128": Record 10012128;
//         "10012132": Record 10012132;
//         "10012133": Record 10012133;
//         "99001547": Record 99001547;
//         "10012154": Record 10012154;
//         "10012151": Record 10012151;
//         "10001229": Record 10001229;
//         "352": Record "Default Dimension";
//         "5896": Record "Inventory Adjmt. Entry (Order)";
//         "99001787": Record 99001787;
//         "99001788": Record 99001788;
//         "10014702": Record 10014702;
//         "10014703": Record 10014703;
//         "271": Record "Bank Account Ledger Entry";
//         "384": Record "Reconcile CV Acc Buffer";
//         "350": Record "Dimension Combination";
//         "351": Record "Dimension Value Combination";
//         "480": Record "Dimension Set Entry";
//         "481": Record "Dimension Set Tree Node";
//         "5765": Record "Warehouse Request";
//         "90": Record "BOM Component";
//         "5404": Record "Item Unit of Measure";
//         "10012143": Record 10012143;
//         "10012144": Record 10012144;

//         "10001230": Record 10001230;
//         "99001609": Record 99001609;
//         "81": Record "Gen. Journal Line";
//         "200": Record "Work Type";
//         "222": Record "Ship-to Address";
//         "240": Record "Resource Register";
//         "241": Record "Job Register";
//         "253": Record "G/L Entry - VAT Entry Link";
//         "254": Record "VAT Entry";
//         "255": Record "VAT Statement Template";
//         "256": Record "VAT Statement Line";
//         "257": Record "VAT Statement Name";
//         "258": Record "Transaction Type";
//         "260": Record "Tariff Number";
//         "266": Record "Customer Amount";
//         "286": Record Territory;
//         "388": Record "Dimension Translation";
//         "10012703": Record 10012703;
//         "10012704": Record 10012704;
//         "275": Record "Bank Account Statement";
//         "276": Record "Bank Account Statement Line";

//     // --> Reports ForNAV Autogenerated code - do not delete or modify
//     var

// }
