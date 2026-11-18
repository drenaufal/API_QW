page 50115 "Create Dispatch API"
{
    PageType = API;
    Caption = 'createDispatch';
    APIPublisher = 'panatrade';
    APIGroup = 'warehouse';
    APIVersion = 'v1.0';
    EntityName = 'createDispatch';
    EntitySetName = 'createDispatch';
    SourceTable = "Dispatch API Buffer";
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(shipmentNo; Rec."Shipment No.")
                {
                    Caption = 'Shipment No.';
                }
                field(dispatchNo; Rec."Dispatch No.")
                {
                    Caption = 'Dispatch No.';
                    Editable = false;
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                    Editable = false;
                }
                field(totalScanned; Rec."Total Scanned")
                {
                    Caption = 'Total Scanned';
                    Editable = false;
                }
                field(message; Rec.Message)
                {
                    Caption = 'Message';
                    Editable = false;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        DispatchHdr: Record Dispatch;
        ShipmentList: List of [Text];
        ShipmentItem: Text;
        ScanCode: Code[20];
        TotalScanned: Integer;
    begin
        if Rec."Shipment No." = '' then
            Error('Shipment No. tidak boleh kosong.');

        // 1. Buat Header Dispatch baru
        DispatchHdr.Init();
        DispatchHdr."Document No." := '';
        DispatchHdr."Line No." := 0;
        DispatchHdr.Insert(true);

        // 2. Parse nomor-nomor shipment (bisa 1 nomor atau banyak nomor dipisah koma/titik koma/pipe)
        ShipmentList := Rec."Shipment No.".Split(',', ';', '|');
        TotalScanned := 0;

        foreach ShipmentItem in ShipmentList do begin
            ScanCode := CopyStr(DelChr(ShipmentItem, '<>', ' '), 1, MaxStrLen(ScanCode));
            if ScanCode <> '' then
                DispatchHdr.PPValidateScanHeadless(ScanCode, TotalScanned);
        end;

        if TotalScanned = 0 then
            Error('Tidak ada Shipment No. yang berhasil di-scan.');

        // 3. Kembalikan data hasil ke response JSON
        Rec."Dispatch No." := DispatchHdr."Document No.";
        Rec.Status := 'Success';
        Rec."Total Scanned" := TotalScanned;
        Rec.Message := StrSubstNo('Berhasil membuat Dispatch %1 dengan %2 shipment.', DispatchHdr."Document No.", TotalScanned);
        exit(true);
    end;
}
