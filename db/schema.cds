namespace my.samples.cap.northwind;

using {Attachments} from '@cap-js/attachments';

// Entity Definitions

entity Products {
      @Common.Label: 'Product'
  key ID              : Integer;

      @Common.Label: 'Product Name'
      productName     : String;

      @Common.Label: 'Supplier ID'
      supplierID      : Integer;

      @Common.Label: 'Category ID'
      categoryID      : Integer;

      @Common.Label: 'Quantity Per Unit'
      quantityPerUnit : String;

      @Common.Label: 'Unit Price'
      unitPrice       : Decimal(15, 2);

      @Common.Label: 'Units In Stock'
      unitsInStock    : Integer;

      @Common.Label: 'Units On Order'
      unitsOnOrder    : Integer;

      @Common.Label: 'Reorder Level'
      reorderLevel    : Integer;

      @Common.Label: 'Discontinued'
      discontinued    : Boolean;

      // Associations
      category        : Association to Categories;
      supplier        : Association to Suppliers;
}

entity Categories {
      @Common.Label: 'Category'
  key ID           : Integer;

      @Common.Label: 'Category Name'
      categoryName : String;

      @Common.Label: 'Description'
      description  : String;

      @Common.Label: 'Picture'
      picture      : Composition of many Attachments;

      // Compositions
      products     : Composition of many Products;
}

entity Suppliers {
      @Common.Label: 'Supplier'
  key ID           : Integer;

      @Common.Label: 'Company Name'
      companyName  : String;

      @Common.Label: 'Contact Name'
      contactName  : String;

      @Common.Label: 'Contact Title'
      contactTitle : String;

      @Common.Label: 'Address'
      address      : String;

      @Common.Label: 'City'
      city         : String;

      @Common.Label: 'Region'
      region       : String;

      @Common.Label: 'Postal Code'
      postalCode   : String;

      @Common.Label: 'Country'
      country      : String;

      @Common.Label: 'Phone'
      phone        : String;

      @Common.Label: 'Fax'
      fax          : String;

      @Common.Label: 'Home Page'
      homePage     : String;

      // Compositions
      products     : Composition of many Products;
}

entity Customers {
      @Common.Label: 'Customer'
  key ID           : String(5);

      @Common.Label: 'Company Name'
      companyName  : String;

      @Common.Label: 'Contact Name'
      contactName  : String;

      @Common.Label: 'Contact Title'
      contactTitle : String;

      @Common.Label: 'Address'
      address      : String;

      @Common.Label: 'City'
      city         : String;

      @Common.Label: 'Region'
      region       : String;

      @Common.Label: 'Postal Code'
      postalCode   : String;

      @Common.Label: 'Country'
      country      : String;

      @Common.Label: 'Phone'
      phone        : String;

      @Common.Label: 'Fax'
      fax          : String;

      // Compositions
      orders       : Composition of many Orders;
}

entity Orders {
      @Common.Label: 'Order'
  key ID             : Integer;

      @Common.Label: 'Order Date'
      orderDate      : DateTime;

      @Common.Label: 'Required Date'
      requiredDate   : DateTime;

      @Common.Label: 'Shipped Date'
      shippedDate    : DateTime;

      @Common.Label: 'Freight'
      freight        : Decimal(15, 2);

      @Common.Label: 'Ship Name'
      shipName       : String;

      @Common.Label: 'Ship Address'
      shipAddress    : String;

      @Common.Label: 'Ship City'
      shipCity       : String;

      @Common.Label: 'Ship Region'
      shipRegion     : String;

      @Common.Label: 'Ship Postal Code'
      shipPostalCode : String;

      @Common.Label: 'Ship Country'
      shipCountry    : String;

      // Associations
      customer       : Association to Customers;
      employee       : Association to Employees;
      shipVia        : Association to Shippers;
      orderDetails   : Composition of many {
                         @Common.Label: 'Product ID'
                         productID : Association to Products;

                         @Common.Label: 'Unit Price'
                         unitPrice : Decimal(15, 2);

                         @Common.Label: 'Quantity'
                         quantity  : Integer;

                         @Common.Label: 'Discount'
                         discount  : Decimal(3, 2);
                       };
}

entity Employees {
      @Common.Label: 'Employee'
  key ID              : Integer;

      @Common.Label: 'Last Name'
      lastName        : String;

      @Common.Label: 'First Name'
      firstName       : String;

      @Common.Label: 'Title'
      title           : String;

      @Common.Label: 'Title of Courtesy'
      titleOfCourtesy : String;

      @Common.Label: 'Birth Date'
      birthDate       : DateTime;

      @Common.Label: 'Hire Date'
      hireDate        : DateTime;

      @Common.Label: 'Address'
      address         : String;

      @Common.Label: 'City'
      city            : String;

      @Common.Label: 'Region'
      region          : String;

      @Common.Label: 'Postal Code'
      postalCode      : String;

      @Common.Label: 'Country'
      country         : String;

      @Common.Label: 'Home Phone'
      homePhone       : String;

      @Common.Label: 'Extension'
      extension       : String;

      @Common.Label: 'Photo'
      photo           : Composition of many Attachments;

      @Common.Label: 'Notes'
      notes           : String;

      @Common.Label: 'Reports To'
      reportsTo       : Integer;

      @Common.Label: 'Photo Path'
      photoPath       : String;

      // Compositions
      orders          : Composition of many Orders;
}

entity Shippers {
      @Common.Label: 'Shipper'
  key ID          : Integer;

      @Common.Label: 'Company Name'
      companyName : String;

      @Common.Label: 'Phone'
      phone       : String;

      // Compositions
      orders      : Composition of many Orders;
}
