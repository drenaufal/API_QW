table 50115 "PP Dispatch API Buffer"
{
    DataClassification = CustomerContent;
    TableType = Temporary;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Shipment No."; Text[500])
        {
            Caption = 'Shipment No.';
        }
        field(3; "Dispatch No."; Code[20])
        {
            Caption = 'Dispatch No.';
        }
        field(4; Status; Text[50])
        {
            Caption = 'Status';
        }
        field(5; "Total Scanned"; Integer)
        {
            Caption = 'Total Scanned';
        }
        field(6; Message; Text[500])
        {
            Caption = 'Message';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
