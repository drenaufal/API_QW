page 50108 "PP Posted Whse. Shpt. Line API"
{
    PageType = API;
    Caption = 'PP postedWarehouseShipmentLine';
    APIPublisher = 'panatrade';
    APIGroup = 'warehouse';
    APIVersion = 'v1.0';
    EntityName = 'postedWarehouseShipmentLine';
    EntitySetName = 'postedWarehouseShipmentLines';
    SourceTable = "Posted Whse. Shipment Line";
    DelayedInsert = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {

                field(itemNo; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'Variant Code';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(description2; Rec."Description 2")
                {
                    Caption = 'Description 2';
                }

                field(qtyBase; Rec."Qty. (Base)")
                {
                    Caption = 'Qty. (Base)';
                }
            }
        }
    }
}

