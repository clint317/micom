	
ALTER TABLE FedEx_Settings ADD COLUMN UserKey varchar (75);
ALTER TABLE FedEx_Settings ADD COLUMN Password varchar (75);
ALTER TABLE FedEx_Settings ADD COLUMN AddInsurance BOOL NOT NULL DEFAULT 0;

UPDATE FedEx_Settings SET Dropoff = 'BUSINESS_SERVICE_CENTER' WHERE Dropoff = 'BUSINESSSERVICE CENTER';
UPDATE FedEx_Settings SET Dropoff = 'DROP_BOX' WHERE Dropoff = 'DROPBOX';
UPDATE FedEx_Settings SET Dropoff = 'REGULAR_PICKUP' WHERE Dropoff = 'REGULARPICKUP';
UPDATE FedEx_Settings SET Dropoff = 'REQUEST_COURIER' WHERE Dropoff = 'REQUESTCOURIER';

UPDATE FedEx_Dropoff SET FedEx_Code = 'BUSINESS_SERVICE_CENTER' WHERE FedEx_Code = 'BUSINESSSERVICE CENTER';
UPDATE FedEx_Dropoff SET FedEx_Code = 'DROP_BOX' WHERE FedEx_Code = 'DROPBOX';
UPDATE FedEx_Dropoff SET FedEx_Code = 'REGULAR_PICKUP' WHERE FedEx_Code = 'REGULARPICKUP';
UPDATE FedEx_Dropoff SET FedEx_Code = 'REQUEST_COURIER' WHERE FedEx_Code = 'REQUESTCOURIER';

UPDATE FedEx_Settings SET Packaging = 'FEDEX_10KG_BOX' WHERE Packaging = 'FEDEX10KGBOX';
UPDATE FedEx_Settings SET Packaging = 'FEDEX_25KG_BOX' WHERE Packaging = 'FEDEX25KGBOX';
UPDATE FedEx_Settings SET Packaging = 'FEDEX_BOX' WHERE Packaging = 'FEDEXBOX';
UPDATE FedEx_Settings SET Packaging = 'FEDEX_ENVELOPE' WHERE Packaging = 'FEDEXENVELOPE';
UPDATE FedEx_Settings SET Packaging = 'FEDEX_PAK' WHERE Packaging = 'FEDEXPAK';
UPDATE FedEx_Settings SET Packaging = 'FEDEX_TUBE' WHERE Packaging = 'FEDEXTUBE';
UPDATE FedEx_Settings SET Packaging = 'YOUR_PACKAGING' WHERE Packaging = 'YOURPACKAGING';

UPDATE FedEx_Packaging SET FedEx_Code = 'FEDEX_10KG_BOX' WHERE FedEx_Code = 'FEDEX10KGBOX';
UPDATE FedEx_Packaging SET FedEx_Code = 'FEDEX_25KG_BOX' WHERE FedEx_Code = 'FEDEX25KGBOX';
UPDATE FedEx_Packaging SET FedEx_Code = 'FEDEX_BOX' WHERE FedEx_Code = 'FEDEXBOX';
UPDATE FedEx_Packaging SET FedEx_Code = 'FEDEX_ENVELOPE' WHERE FedEx_Code = 'FEDEXENVELOPE';
UPDATE FedEx_Packaging SET FedEx_Code = 'FEDEX_PAK' WHERE FedEx_Code = 'FEDEXPAK';
UPDATE FedEx_Packaging SET FedEx_Code = 'FEDEX_TUBE' WHERE FedEx_Code = 'FEDEXTUBE';
UPDATE FedEx_Packaging SET FedEx_Code = 'YOUR_PACKAGING' WHERE FedEx_Code = 'YOURPACKAGING';

UPDATE FedExMethods SET Code = 'FEDEX_GROUND' WHERE Code = 'FEDEXGROUND';
UPDATE FedExMethods SET Code = 'GROUND_HOME_DELIVERY' WHERE Code = 'GROUNDHOMEDELIVERY';
UPDATE FedExMethods SET Code = 'PRIORITY_OVERNIGHT' WHERE Code = 'PRIORITYOVERNIGHT';
UPDATE FedExMethods SET Code = 'FEDEX_2_DAY' WHERE Code = 'FEDEX2DAY';
UPDATE FedExMethods SET Code = 'FIRST_OVERNIGHT' WHERE Code = 'FIRSTOVERNIGHT';
UPDATE FedExMethods SET Code = 'FEDEX_EXPRESS_SAVER' WHERE Code = 'FEDEXEXPRESSSAVER';
UPDATE FedExMethods SET Code = 'STANDARD_OVERNIGHT' WHERE Code = 'STANDARDOVERNIGHT';
UPDATE FedExMethods SET Code = 'INTERNATIONAL_PRIORITY' WHERE Code = 'INTERNATIONALPRIORITY';
UPDATE FedExMethods SET Code = 'INTERNATIONAL_ECONOMY' WHERE Code = 'INTERNATIONALECONOMY';

INSERT INTO FedExMethods (Name, Used, Shipper, Code, Priority) VALUES ( 'FedEx International First<sup>&reg;</sup>', 0, 'FDXE', 'INTERNATIONAL_FIRST', 0 );
INSERT INTO FedExMethods (Name, Used, Shipper, Code, Priority) VALUES ( 'FedEx International Ground<sup>&reg;</sup>', 0, 'FDXE', 'INTERNATIONAL_GROUND', 0 );

