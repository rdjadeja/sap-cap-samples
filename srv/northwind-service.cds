using { my.samples.cap.northwind as schema } from '../db/schema';
 
// Define the service that exposes the entities
service NorthwindService {
  // Expose entities
  entity Products as projection on schema.Products;
  entity Categories as projection on schema.Categories;
  entity Suppliers as projection on schema.Suppliers;
  entity Customers as projection on schema.Customers;
  entity Orders as projection on schema.Orders;
  entity Employees as projection on schema.Employees;
  entity Shippers as projection on schema.Shippers;
}
