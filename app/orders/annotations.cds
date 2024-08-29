using NorthwindService as service from '../../srv/northwind-service';
using from '../../db/schema';

annotate service.Orders with @(
    odata.draft.enabled,
    UI.FieldGroup #ShippingDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : shipName,
                Label : 'Name',
            },
            {
                $Type : 'UI.DataField',
                Value : shippedDate,
                Label : '{i18n>ShippedDate}',
            },
            {
                $Type : 'UI.DataField',
                Value : shipAddress,
                Label : 'Address',
            },
            {
                $Type : 'UI.DataField',
                Value : shipCity,
                Label : '{i18n>City}',
            },
            {
                $Type : 'UI.DataField',
                Value : shipRegion,
                Label : '{i18n>Region}',
            },
            {
                $Type : 'UI.DataField',
                Value : shipCountry,
                Label : '{i18n>Country1}',
            },
            {
                $Type : 'UI.DataField',
                Value : shipPostalCode,
                Label : '{i18n>PostalCode}',
            },
            {
                $Type : 'UI.DataField',
                Value : shipVia_ID,
                Label : '{i18n>ShippingCompany}',
            },
        ],
    },
);

annotate service.Orders with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>OrderDate}',
                Value : orderDate,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>RequiredDate}',
                Value : requiredDate,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Freight}',
                Value : freight,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>CustomerId}',
                Value : customer_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>EmployeeId}',
                Value : employee_ID,
            }]
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>ShippingDetails}',
            ID : 'ShippingDetails',
            Target : '@UI.FieldGroup#ShippingDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>OrderDetails}',
            ID : 'OrderDetails',
            Target : 'orderDetails/@UI.LineItem#OrderDetails',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>OrderDate}',
            Value : orderDate,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>RequiredDate}',
            Value : requiredDate,
        },
    ],
);

annotate service.Orders with {
    customer @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Customers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : customer_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'companyName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'contactName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'contactTitle',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'address',
            },
        ],
    }
};

annotate service.Orders with {
    employee @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Employees',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : employee_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'lastName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'firstName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'title',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'titleOfCourtesy',
                },
            ],
        Label : '{i18n>Employees}',
        },
        Common.ValueListWithFixedValues : false,
        Common.Text : {
            $value : employee.firstName,
            ![@UI.TextArrangement] : #TextOnly
        },
    )
};

annotate service.Orders with {
    shipVia @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Shippers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : shipVia_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'companyName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'phone',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'orders_ID',
            },
        ],
    }
};


annotate service.OrderDetails with {
    productID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Products',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : productID_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'productName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'categoryID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'supplierID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'quantityPerUnit',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'unitPrice',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'unitsInStock',
                },
            ],
            Label : '{i18n>Products}',
        },
        Common.ValueListWithFixedValues : false
)};

annotate service.Orders.orderDetails with @(
    UI.LineItem #OrderDetails : [
        {
            $Type : 'UI.DataField',
            Value : productID_ID,
            Label : '{i18n>ProductId}',
        },
        {
            $Type : 'UI.DataField',
            Value : discount,
            Label : 'Discount',
        },
        {
            $Type : 'UI.DataField',
            Value : quantity,
            Label : '{i18n>Quantity}',
        },
        {
            $Type : 'UI.DataField',
            Value : unitPrice,
            Label : '{i18n>UnitPrice}',
        },
    ]
);

annotate service.Orders.orderDetails with {
    productID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Products',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : productID_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'productName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'supplierID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'categoryID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'quantityPerUnit',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'unitPrice',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'unitsInStock',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'unitsOnOrder',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'reorderLevel',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'discontinued',
                },
            ],
            Label : 'Products',
        },
        Common.ValueListWithFixedValues : false,
        Common.Text : {
            $value : productID.productName,
            ![@UI.TextArrangement] : #TextOnly
        },
)};

annotate service.Products with {
    ID @Common.Text : {
        $value : productName,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.Employees with {
    ID @Common.Text : firstName
};

