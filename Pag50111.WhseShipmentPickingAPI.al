page 50111 "PP Whse. Shipment Picking API"
{
    PageType = API;
    Caption = 'PP whseShipmentPicking';
    APIPublisher = 'panatrade';
    APIGroup = 'warehouse';
    APIVersion = 'v1.0';
    EntityName = 'whseShipmentPicking';
    EntitySetName = 'whseShipmentPickings';
    SourceTable = "Warehouse Shipment Header";
    // SourceTableView = where("New Delivery Priority" = filter('<>PRIO-3*'), "Total Qty. Picking" = filter(> 0));
    SourceTableView = where("New Delivery Priority" = filter(('PRIO-1*' | 'PRIO-2*' | 'PRIO-0*' | 'PRIO-3*')), "Total Qty. Picking" = filter(> 0));
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
                // Standard Fields
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field(PackingStatus; Rec."Packing Status")
                {
                    Caption = 'Packing status';
                }
                field(shippingAgentCode; Rec."Shipping Agent Code")
                {
                    Caption = 'Shipping Agent Code';
                }
                field(orderNo; Rec."Order No.")
                {
                    Caption = 'Order No.';
                }
                field(sourceName; Rec."Source Name")
                {
                    Caption = 'Source Name';
                }
                field(newDeliveryPriority; Rec."New Delivery Priority")
                {
                    Caption = 'New Delivery Priority';
                }
                field(totalQtyPicking; Rec."Total Qty. Picking")
                {
                    Caption = 'Total Qty. Picking';
                }
                field(pickupCode; Rec."PP Pickup Code")
                {
                    Caption = 'Pickup';
                }

                // Nested Lines Subform
                part(lines; "PP Whse Shpt Picking Line API")
                {
                    Caption = 'Lines';
                    EntityName = 'whseShipmentPickingLine';
                    EntitySetName = 'whseShipmentPickingLines';
                    // EntityName = 'lines';
                    // EntitySetName = 'lines';
                    SubPageLink = "No." = field("No.");
                }
            }
        }
    }
}
