using catalogservice as service from '../../srv/catalogService';

annotate service.purchaseorderSet with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'CURRENCY_code',
                Value : CURRENCY_code,
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : PO_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PARTNER_GUID_NODE_KEY',
                Value : PARTNER_GUID_NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Label : 'LIFECYCLE_STATUS',
                Value : LIFECYCLE_STATUS,
            },
            {
                $Type : 'UI.DataField',
                Value : OVERALL_STATUS,
            },
        ],
    },
      UI.SelectionFields:[
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        GROSS_AMOUNT,
        OVERALL_STATUS,
        CURRENCY_code
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
              $Type : 'UI.ReferenceFacet',
            Label : 'PO Line Items',
            Target : 'Items/@UI.LineItem',
        }
        
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'CURRENCY_code',
            Value : CURRENCY_code,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
    ],
);

annotate service.purchaseorderSet with {
    PARTNER_GUID @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'businesspartnerSet',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : PARTNER_GUID_NODE_KEY,
                ValueListProperty : 'NODE_KEY',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'BP_ROLE',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'EMAIL_ADDRESS',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'PHONE_NUMBER',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'FAX_NUMBER',
            },
        ],
    }
};
annotate service.poitems with @(
UI.LineItem:[
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },{
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
        },{
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },{
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },{
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
        },{
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        }],
        UI.Facets:[
            {
                 $Type:'UI.ReferenceFacet',
                 Label:'po items info',
                 Target:'@UI.FieldGroup#items'
            }
        ],
        UI.FieldGroup#items:{
               $Type:'UI.FieldGroupType',
               Data:[
                 {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },{
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
        },{
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },{
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        },{
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
        },{
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        }
               ]
        }
);


