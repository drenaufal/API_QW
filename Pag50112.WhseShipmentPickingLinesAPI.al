page 50112 "PP Whse Shpt Picking Line API"
{
    PageType = API;
    // PageType = ListPart;
    Caption = 'PP whseShipmentPickingLine';
    APIPublisher = 'panatrade';
    APIGroup = 'warehouse';
    APIVersion = 'v1.0';
    EntityName = 'whseShipmentPickingLine';
    EntitySetName = 'whseShipmentPickingLines';
    SourceTable = "Warehouse Shipment Line";
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
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
            }
        }
    }
}
