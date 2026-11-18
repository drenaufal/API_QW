page 50107 "PP Posted Whse. Shipment API"
{
    PageType = API;
    Caption = 'PP postedWarehouseShipment';
    APIPublisher = 'panatrade';
    APIGroup = 'warehouse';
    APIVersion = 'v1.0';
    EntityName = 'postedWarehouseShipment';
    EntitySetName = 'postedWarehouseShipments';
    SourceTable = "Posted Whse. Shipment Header";
    SourceTableView = where("New Delivery Priority" = filter('PRIO-1*' | 'PRIO-2*' | 'PRIO-3*'));
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

                field(PostingDate; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
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
                field(PickupCode; Rec."PP Pickup Code")
                {
                    Caption = 'Pickup';
                }

                // Nested Lines Subform
                part(lines; "PP Posted Whse. Shpt. Line API")
                {
                    Caption = 'Lines';
                    EntityName = 'postedWarehouseShipmentLine';
                    EntitySetName = 'postedWarehouseShipmentLines';
                    SubPageLink = "No." = field("No.");
                }
            }
        }
    }
}

