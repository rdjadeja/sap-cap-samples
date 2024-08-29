using NorthwindService as service from '../../srv/northwind-service';
annotate service.Products with @(
        odata.draft.enabled,
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
                Label : '{i18n>ProductName}',
                Value : productName,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Category}',
                Value : categoryID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Supplier}',
                Value : supplierID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>QuantityPerUnit}',
                Value : quantityPerUnit,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>UnitPrice}',
                Value : unitPrice,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>UnitsInStock}',
                Value : unitsInStock,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>UnitsOnOrder}',
                Value : unitsOnOrder,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>ReorderLevel}',
                Value : reorderLevel,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Discontinued}',
                Value : discontinued,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Id}',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>ProductName}',
            Value : productName,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>SupplierId}',
            Value : supplierID,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Category}',
            Value : categoryID,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>QuantityPerUnit}',
            Value : quantityPerUnit,
        },
    ],
);

annotate service.Products with {
    category @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Categories',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : category_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'categoryName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'products_ID',
            },
        ],
    }
};

annotate service.Products with {
    supplier @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Suppliers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : supplier_ID,
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

annotate service.Products with {
    supplierID @Common.Text : {
        $value : supplier.contactName,
        ![@UI.TextArrangement] : #TextOnly
    }
};

annotate service.Products with {
    categoryID @(
        Common.Text : {
            $value : category.description,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Categories',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : categoryID,
                    ValueListProperty : 'ID',
                },
            ],
            Label : 'Categories',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Categories with {
    ID @Common.Text : {
        $value : categoryName,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

