-- ======================================================
-- Base de Datos: docuai_sistema
-- Fecha de Exportacion: 2026-10-05 16:56:49
-- ======================================================

CREATE DATABASE IF NOT EXISTS `docuai_sistema` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `docuai_sistema`;

SET FOREIGN_KEY_CHECKS = 0;

-- Estructura de tabla para `documentos_procesados`
DROP TABLE IF EXISTS `documentos_procesados`;
CREATE TABLE `documentos_procesados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_archivo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_documento` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confianza` decimal(5,2) NOT NULL,
  `tiempo_seg` decimal(6,3) DEFAULT '0.000',
  `fecha_procesamiento` datetime NOT NULL,
  `url_archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `url_vista` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `detalles_json` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_tipo` (`tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Datos para la tabla `documentos_procesados`
INSERT INTO `documentos_procesados` (`id`, `nombre_archivo`, `tipo_documento`, `confianza`, `tiempo_seg`, `fecha_procesamiento`, `url_archivo`, `url_vista`, `detalles_json`) VALUES (6, 'order_10261.pdf', 'Comprobante / Despacho de Envío', 100.00, 0.310, '2026-10-05 16:03:43', '/uploads/order_10261.pdf', '/uploads/order_10261_preview.jpg', '{"success": true, "es_valido": true, "nombre_archivo": "order_10261.pdf", "url_vista": "/uploads/order_10261_preview.jpg", "url_archivo": "/uploads/order_10261.pdf", "tipo_documento": "Comprobante / Despacho de Envío", "clase_raw": "Shipping orders", "confianza": 100.0, "tiempo_proceso": 0.31, "probabilidades": {"Reporte de Inventario": 0.0, "Orden de Compra": 0.0, "Comprobante / Despacho de Envío": 100.0, "Factura Comercial": 0.0}, "datos_extraidos": {"numero": "SHP-10261", "fecha": "2016-07-19", "entidad": "Que Delícia", "nit": "QUEDE", "total": 448.0, "campos_especificos": {"N° Guía / Despacho": "SHP-10261", "Destinatario (Ship To)": "Que Delícia", "Transportadora": "United Package", "Fecha del Pedido": "2016-07-19", "Fecha de Despacho": "2016-07-30", "Dirección de Entrega": "Rua Da Panificadora, 12, Rio De Janeiro, Brazil, (CP: 02389-673)", "Cant. Items Despachados": "2 item(s)", "Total Flete & Carga ($)": "$ 448.00"}, "productos": [{"id": "1", "nombre": "Sir Rodney S Scones", "cantidad": 20, "precio_unitario": 8.0, "subtotal": 160.0}, {"id": "2", "nombre": "Steeleye Stout", "cantidad": 20, "precio_unitario": 14.4, "subtotal": 288.0}]}}');
INSERT INTO `documentos_procesados` (`id`, `nombre_archivo`, `tipo_documento`, `confianza`, `tiempo_seg`, `fecha_procesamiento`, `url_archivo`, `url_vista`, `detalles_json`) VALUES (7, 'purchase_orders_10250.pdf', 'Orden de Compra', 100.00, 0.337, '2026-10-05 16:03:55', '/uploads/purchase_orders_10250.pdf', '/uploads/purchase_orders_10250_preview.jpg', '{"success": true, "es_valido": true, "nombre_archivo": "purchase_orders_10250.pdf", "url_vista": "/uploads/purchase_orders_10250_preview.jpg", "url_archivo": "/uploads/purchase_orders_10250.pdf", "tipo_documento": "Orden de Compra", "clase_raw": "PurchaseOrders", "confianza": 100.0, "tiempo_proceso": 0.337, "probabilidades": {"Reporte de Inventario": 0.0, "Orden de Compra": 100.0, "Comprobante / Despacho de Envío": 0.0, "Factura Comercial": 0.0}, "datos_extraidos": {"numero": "10250", "fecha": "2016-07-08", "entidad": "Mario Pontes", "nit": "CUST-ORD10250", "total": 1813.0, "campos_especificos": {"N° Orden de Compra": "#10250", "Fecha del Pedido": "2016-07-08", "Cliente / Comprador": "Mario Pontes", "Cant. Productos": "3 item(s)", "Total Liquidado ($)": "$ 1,813.00"}, "productos": [{"id": "41", "nombre": "Jack S New England Clam Chowder", "cantidad": 10, "precio_unitario": 7.7, "subtotal": 77.0}, {"id": "51", "nombre": "Manjimup Dried Apples", "cantidad": 35, "precio_unitario": 42.4, "subtotal": 1484.0}, {"id": "65", "nombre": "Louisiana Fiery Hot Pepper Sauce", "cantidad": 15, "precio_unitario": 16.8, "subtotal": 252.0}]}}');
INSERT INTO `documentos_procesados` (`id`, `nombre_archivo`, `tipo_documento`, `confianza`, `tiempo_seg`, `fecha_procesamiento`, `url_archivo`, `url_vista`, `detalles_json`) VALUES (8, 'invoice_10256.pdf', 'Factura Comercial', 100.00, 0.343, '2026-10-05 16:04:05', '/uploads/invoice_10256.pdf', '/uploads/invoice_10256_preview.jpg', '{"success": true, "es_valido": true, "nombre_archivo": "invoice_10256.pdf", "url_vista": "/uploads/invoice_10256_preview.jpg", "url_archivo": "/uploads/invoice_10256.pdf", "tipo_documento": "Factura Comercial", "clase_raw": "invoices", "confianza": 100.0, "tiempo_proceso": 0.343, "probabilidades": {"Reporte de Inventario": 0.0, "Orden de Compra": 0.0, "Comprobante / Despacho de Envío": 0.0, "Factura Comercial": 100.0}, "datos_extraidos": {"numero": "INV-10256", "fecha": "2016-07-15", "entidad": "Paula Parente", "nit": "WELLI", "total": 517.8, "campos_especificos": {"N° Factura Comercial": "INV-10256", "ID de Cliente (NIT)": "WELLI", "Fecha de Emisión": "2016-07-15", "Razón Social / Contacto": "Paula Parente", "Dirección de Facturación": "Rua Do Mercado, 12, Resende, Brazil, (CP: 08737-363)", "Cant. Items Facturados": "2 item(s)", "Total Factura ($)": "$ 517.80"}, "productos": [{"id": "53", "nombre": "Perth Pasties", "cantidad": 15, "precio_unitario": 26.2, "subtotal": 393.0}, {"id": "77", "nombre": "Original Frankfurter Grüne Soße", "cantidad": 12, "precio_unitario": 10.4, "subtotal": 124.8}]}}');
INSERT INTO `documentos_procesados` (`id`, `nombre_archivo`, `tipo_documento`, `confianza`, `tiempo_seg`, `fecha_procesamiento`, `url_archivo`, `url_vista`, `detalles_json`) VALUES (9, 'invoice_10253.pdf', 'Factura Comercial', 100.00, 0.348, '2026-10-05 16:04:18', '/uploads/invoice_10253.pdf', '/uploads/invoice_10253_preview.jpg', '{"success": true, "es_valido": true, "nombre_archivo": "invoice_10253.pdf", "url_vista": "/uploads/invoice_10253_preview.jpg", "url_archivo": "/uploads/invoice_10253.pdf", "tipo_documento": "Factura Comercial", "clase_raw": "invoices", "confianza": 100.0, "tiempo_proceso": 0.348, "probabilidades": {"Reporte de Inventario": 0.0, "Orden de Compra": 0.0, "Comprobante / Despacho de Envío": 0.0, "Factura Comercial": 100.0}, "datos_extraidos": {"numero": "INV-10253", "fecha": "2016-07-10", "entidad": "Mario Pontes", "nit": "HANAR", "total": 1444.8000000000002, "campos_especificos": {"N° Factura Comercial": "INV-10253", "ID de Cliente (NIT)": "HANAR", "Fecha de Emisión": "2016-07-10", "Razón Social / Contacto": "Mario Pontes", "Dirección de Facturación": "Rua Do Paço, 67, Rio De Janeiro, Brazil, (CP: 05454-876)", "Cant. Items Facturados": "3 item(s)", "Total Factura ($)": "$ 1,444.80"}, "productos": [{"id": "31", "nombre": "Gorgonzola Telino", "cantidad": 20, "precio_unitario": 10.0, "subtotal": 200.0}, {"id": "39", "nombre": "Chartreuse Verte", "cantidad": 42, "precio_unitario": 14.4, "subtotal": 604.8}, {"id": "49", "nombre": "Maxilaku", "cantidad": 40, "precio_unitario": 16.0, "subtotal": 640.0}]}}');
INSERT INTO `documentos_procesados` (`id`, `nombre_archivo`, `tipo_documento`, `confianza`, `tiempo_seg`, `fecha_procesamiento`, `url_archivo`, `url_vista`, `detalles_json`) VALUES (10, 'StockReport_2016-09.pdf', 'Reporte de Inventario', 100.00, 0.346, '2026-10-05 16:04:29', '/uploads/StockReport_2016-09.pdf', '/uploads/StockReport_2016-09_preview.jpg', '{"success": true, "es_valido": true, "nombre_archivo": "StockReport_2016-09.pdf", "url_vista": "/uploads/StockReport_2016-09_preview.jpg", "url_archivo": "/uploads/StockReport_2016-09.pdf", "tipo_documento": "Reporte de Inventario", "clase_raw": "Inventory Report", "confianza": 100.0, "tiempo_proceso": 0.346, "probabilidades": {"Reporte de Inventario": 100.0, "Orden de Compra": 0.0, "Comprobante / Despacho de Envío": 0.0, "Factura Comercial": 0.0}, "datos_extraidos": {"numero": "StockReport-2016-09", "fecha": "2016-09-01", "entidad": "Categoría: Confections", "nit": "CAT-3", "total": 0.0, "campos_especificos": {"Identificador de Reporte": "StockReport-2016-09", "Periodo Mensual": "2016-09", "Fecha de Corte": "2016-09-01", "Categoría del Almacén": "Categoría: Confections", "ID Categoría": "CAT-3", "Total Unidades Vendidas": "1114 unidades", "Total Existencias en Stock": "1427 unidades", "Estado de Inventario": "Existencias Verificadas en Almacén"}, "productos": [{"id": "Beve", "nombre": "Chai", "cantidad": 20, "precio_unitario": 39, "subtotal": 18.0}, {"id": "Beve", "nombre": "Chang", "cantidad": 40, "precio_unitario": 17, "subtotal": 19.0}, {"id": "Beve", "nombre": "Chartreuse verte", "cantidad": 90, "precio_unitario": 69, "subtotal": 18.0}, {"id": "Beve", "nombre": "Ipoh Coffee", "cantidad": 56, "precio_unitario": 17, "subtotal": 46.0}, {"id": "Beve", "nombre": "Outback Lager", "cantidad": 55, "precio_unitario": 15, "subtotal": 15.0}, {"id": "Beve", "nombre": "Rhönbräu Klosterbier", "cantidad": 10, "precio_unitario": 125, "subtotal": 7.75}, {"id": "Beve", "nombre": "Sasquatch Ale", "cantidad": 14, "precio_unitario": 111, "subtotal": 14.0}, {"id": "Cond", "nombre": "Chef Anton\'s Cajun..", "cantidad": 20, "precio_unitario": 53, "subtotal": 22.0}, {"id": "Cond", "nombre": "Grandma\'s Boysenberry..", "cantidad": 30, "precio_unitario": 120, "subtotal": 25.0}, {"id": "Cond", "nombre": "Louisiana Fiery Hot..", "cantidad": 30, "precio_unitario": 76, "subtotal": 21.05}, {"id": "Cond", "nombre": "Louisiana Hot Spiced..", "cantidad": 30, "precio_unitario": 4, "subtotal": 17.0}, {"id": "Conf", "nombre": "Maxilaku", "cantidad": 30, "precio_unitario": 10, "subtotal": 20.0}, {"id": "Conf", "nombre": "Pavlova", "cantidad": 40, "precio_unitario": 29, "subtotal": 17.45}, {"id": "Conf", "nombre": "Scottish Longbreads", "cantidad": 38, "precio_unitario": 6, "subtotal": 12.5}, {"id": "Conf", "nombre": "Tarte au sucre", "cantidad": 125, "precio_unitario": 17, "subtotal": 49.3}, {"id": "Conf", "nombre": "Teatime Chocolate..", "cantidad": 15, "precio_unitario": 25, "subtotal": 9.2}, {"id": "Dair", "nombre": "Flotemysost", "cantidad": 5, "precio_unitario": 26, "subtotal": 21.5}, {"id": "Dair", "nombre": "Gudbrandsdalsost", "cantidad": 23, "precio_unitario": 26, "subtotal": 36.0}, {"id": "Dair", "nombre": "Mascarpone Fabioli", "cantidad": 40, "precio_unitario": 9, "subtotal": 32.0}, {"id": "Dair", "nombre": "Mozzarella di Giovanni", "cantidad": 20, "precio_unitario": 14, "subtotal": 34.8}, {"id": "Dair", "nombre": "Queso Cabrales", "cantidad": 12, "precio_unitario": 22, "subtotal": 21.0}, {"id": "Dair", "nombre": "Raclette Courdavault", "cantidad": 40, "precio_unitario": 79, "subtotal": 55.0}, {"id": "Grai", "nombre": "Gnocchi di nonna Alice", "cantidad": 24, "precio_unitario": 21, "subtotal": 38.0}, {"id": "Grai", "nombre": "Singaporean Hokkien..", "cantidad": 8, "precio_unitario": 26, "subtotal": 14.0}, {"id": "Meat", "nombre": "Alice Mutton", "cantidad": 40, "precio_unitario": 0, "subtotal": 39.0}, {"id": "Meat", "nombre": "Perth Pasties", "cantidad": 30, "precio_unitario": 0, "subtotal": 32.8}, {"id": "Meat", "nombre": "Thüringer Rostbratwurst", "cantidad": 25, "precio_unitario": 0, "subtotal": 123.79}, {"id": "Meat", "nombre": "Tourtière", "cantidad": 5, "precio_unitario": 21, "subtotal": 7.45}, {"id": "Prod", "nombre": "Rössle Sauerkraut", "cantidad": 32, "precio_unitario": 26, "subtotal": 45.6}, {"id": "Seaf", "nombre": "Boston Crab Meat", "cantidad": 50, "precio_unitario": 123, "subtotal": 18.4}, {"id": "Seaf", "nombre": "Carnarvon Tigers", "cantidad": 25, "precio_unitario": 42, "subtotal": 62.5}, {"id": "Seaf", "nombre": "Escargots de Bourgogne", "cantidad": 30, "precio_unitario": 62, "subtotal": 13.25}, {"id": "Seaf", "nombre": "Inlagd Sill", "cantidad": 52, "precio_unitario": 112, "subtotal": 19.0}, {"id": "Seaf", "nombre": "Jack\'s New England..", "cantidad": 10, "precio_unitario": 85, "subtotal": 9.65}]}}');
INSERT INTO `documentos_procesados` (`id`, `nombre_archivo`, `tipo_documento`, `confianza`, `tiempo_seg`, `fecha_procesamiento`, `url_archivo`, `url_vista`, `detalles_json`) VALUES (11, 'StockReport_2016-09.pdf', 'Reporte de Inventario', 100.00, 0.286, '2026-10-05 16:05:29', '/uploads/StockReport_2016-09.pdf', '/uploads/StockReport_2016-09_preview.jpg', '{"success": true, "es_valido": true, "nombre_archivo": "StockReport_2016-09.pdf", "url_vista": "/uploads/StockReport_2016-09_preview.jpg", "url_archivo": "/uploads/StockReport_2016-09.pdf", "tipo_documento": "Reporte de Inventario", "clase_raw": "Inventory Report", "confianza": 100.0, "tiempo_proceso": 0.286, "probabilidades": {"Reporte de Inventario": 100.0, "Orden de Compra": 0.0, "Comprobante / Despacho de Envío": 0.0, "Factura Comercial": 0.0}, "datos_extraidos": {"numero": "StockReport-2016-09", "fecha": "2016-09-01", "entidad": "Categoría: Confections", "nit": "CAT-3", "total": 0.0, "campos_especificos": {"Identificador de Reporte": "StockReport-2016-09", "Periodo Mensual": "2016-09", "Fecha de Corte": "2016-09-01", "Categoría del Almacén": "Categoría: Confections", "ID Categoría": "CAT-3", "Total Unidades Vendidas": "1114 unidades", "Total Existencias en Stock": "1427 unidades", "Estado de Inventario": "Existencias Verificadas en Almacén"}, "productos": [{"id": "Beve", "nombre": "Chai", "cantidad": 20, "precio_unitario": 39, "subtotal": 18.0}, {"id": "Beve", "nombre": "Chang", "cantidad": 40, "precio_unitario": 17, "subtotal": 19.0}, {"id": "Beve", "nombre": "Chartreuse verte", "cantidad": 90, "precio_unitario": 69, "subtotal": 18.0}, {"id": "Beve", "nombre": "Ipoh Coffee", "cantidad": 56, "precio_unitario": 17, "subtotal": 46.0}, {"id": "Beve", "nombre": "Outback Lager", "cantidad": 55, "precio_unitario": 15, "subtotal": 15.0}, {"id": "Beve", "nombre": "Rhönbräu Klosterbier", "cantidad": 10, "precio_unitario": 125, "subtotal": 7.75}, {"id": "Beve", "nombre": "Sasquatch Ale", "cantidad": 14, "precio_unitario": 111, "subtotal": 14.0}, {"id": "Cond", "nombre": "Chef Anton\'s Cajun..", "cantidad": 20, "precio_unitario": 53, "subtotal": 22.0}, {"id": "Cond", "nombre": "Grandma\'s Boysenberry..", "cantidad": 30, "precio_unitario": 120, "subtotal": 25.0}, {"id": "Cond", "nombre": "Louisiana Fiery Hot..", "cantidad": 30, "precio_unitario": 76, "subtotal": 21.05}, {"id": "Cond", "nombre": "Louisiana Hot Spiced..", "cantidad": 30, "precio_unitario": 4, "subtotal": 17.0}, {"id": "Conf", "nombre": "Maxilaku", "cantidad": 30, "precio_unitario": 10, "subtotal": 20.0}, {"id": "Conf", "nombre": "Pavlova", "cantidad": 40, "precio_unitario": 29, "subtotal": 17.45}, {"id": "Conf", "nombre": "Scottish Longbreads", "cantidad": 38, "precio_unitario": 6, "subtotal": 12.5}, {"id": "Conf", "nombre": "Tarte au sucre", "cantidad": 125, "precio_unitario": 17, "subtotal": 49.3}, {"id": "Conf", "nombre": "Teatime Chocolate..", "cantidad": 15, "precio_unitario": 25, "subtotal": 9.2}, {"id": "Dair", "nombre": "Flotemysost", "cantidad": 5, "precio_unitario": 26, "subtotal": 21.5}, {"id": "Dair", "nombre": "Gudbrandsdalsost", "cantidad": 23, "precio_unitario": 26, "subtotal": 36.0}, {"id": "Dair", "nombre": "Mascarpone Fabioli", "cantidad": 40, "precio_unitario": 9, "subtotal": 32.0}, {"id": "Dair", "nombre": "Mozzarella di Giovanni", "cantidad": 20, "precio_unitario": 14, "subtotal": 34.8}, {"id": "Dair", "nombre": "Queso Cabrales", "cantidad": 12, "precio_unitario": 22, "subtotal": 21.0}, {"id": "Dair", "nombre": "Raclette Courdavault", "cantidad": 40, "precio_unitario": 79, "subtotal": 55.0}, {"id": "Grai", "nombre": "Gnocchi di nonna Alice", "cantidad": 24, "precio_unitario": 21, "subtotal": 38.0}, {"id": "Grai", "nombre": "Singaporean Hokkien..", "cantidad": 8, "precio_unitario": 26, "subtotal": 14.0}, {"id": "Meat", "nombre": "Alice Mutton", "cantidad": 40, "precio_unitario": 0, "subtotal": 39.0}, {"id": "Meat", "nombre": "Perth Pasties", "cantidad": 30, "precio_unitario": 0, "subtotal": 32.8}, {"id": "Meat", "nombre": "Thüringer Rostbratwurst", "cantidad": 25, "precio_unitario": 0, "subtotal": 123.79}, {"id": "Meat", "nombre": "Tourtière", "cantidad": 5, "precio_unitario": 21, "subtotal": 7.45}, {"id": "Prod", "nombre": "Rössle Sauerkraut", "cantidad": 32, "precio_unitario": 26, "subtotal": 45.6}, {"id": "Seaf", "nombre": "Boston Crab Meat", "cantidad": 50, "precio_unitario": 123, "subtotal": 18.4}, {"id": "Seaf", "nombre": "Carnarvon Tigers", "cantidad": 25, "precio_unitario": 42, "subtotal": 62.5}, {"id": "Seaf", "nombre": "Escargots de Bourgogne", "cantidad": 30, "precio_unitario": 62, "subtotal": 13.25}, {"id": "Seaf", "nombre": "Inlagd Sill", "cantidad": 52, "precio_unitario": 112, "subtotal": 19.0}, {"id": "Seaf", "nombre": "Jack\'s New England..", "cantidad": 10, "precio_unitario": 85, "subtotal": 9.65}]}}');

-- Estructura de tabla para `facturas`
DROP TABLE IF EXISTS `facturas`;
CREATE TABLE `facturas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento_id` int(11) NOT NULL,
  `numero_factura` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit_cliente` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `fecha_emision` date DEFAULT NULL,
  `contacto_cliente` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `direccion` text COLLATE utf8mb4_unicode_ci,
  `total` decimal(12,2) DEFAULT '0.00',
  `url_archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `url_vista` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `documento_id` (`documento_id`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`documento_id`) REFERENCES `documentos_procesados` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Datos para la tabla `facturas`
INSERT INTO `facturas` (`id`, `documento_id`, `numero_factura`, `nit_cliente`, `fecha_emision`, `contacto_cliente`, `direccion`, `total`, `url_archivo`, `url_vista`, `fecha_registro`) VALUES (2, 8, 'INV-10256', 'WELLI', '2016-07-15', 'Paula Parente', 'Rua Do Mercado, 12, Resende, Brazil, (CP: 08737-363)', 517.80, '/uploads/invoice_10256.pdf', '/uploads/invoice_10256_preview.jpg', '2026-10-05 16:04:05');
INSERT INTO `facturas` (`id`, `documento_id`, `numero_factura`, `nit_cliente`, `fecha_emision`, `contacto_cliente`, `direccion`, `total`, `url_archivo`, `url_vista`, `fecha_registro`) VALUES (3, 9, 'INV-10253', 'HANAR', '2016-07-10', 'Mario Pontes', 'Rua Do Paço, 67, Rio De Janeiro, Brazil, (CP: 05454-876)', 1444.80, '/uploads/invoice_10253.pdf', '/uploads/invoice_10253_preview.jpg', '2026-10-05 16:04:18');

-- Estructura de tabla para `ordenes_compra`
DROP TABLE IF EXISTS `ordenes_compra`;
CREATE TABLE `ordenes_compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento_id` int(11) NOT NULL,
  `numero_orden` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `cliente_comprador` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `cant_items` int(11) DEFAULT '0',
  `total_liquidado` decimal(12,2) DEFAULT '0.00',
  `url_archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `url_vista` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `documento_id` (`documento_id`),
  CONSTRAINT `ordenes_compra_ibfk_1` FOREIGN KEY (`documento_id`) REFERENCES `documentos_procesados` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Datos para la tabla `ordenes_compra`
INSERT INTO `ordenes_compra` (`id`, `documento_id`, `numero_orden`, `fecha_pedido`, `cliente_comprador`, `cant_items`, `total_liquidado`, `url_archivo`, `url_vista`, `fecha_registro`) VALUES (2, 7, '10250', '2016-07-08', 'Mario Pontes', 3, 1813.00, '/uploads/purchase_orders_10250.pdf', '/uploads/purchase_orders_10250_preview.jpg', '2026-10-05 16:03:55');

-- Estructura de tabla para `despachos_envio`
DROP TABLE IF EXISTS `despachos_envio`;
CREATE TABLE `despachos_envio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento_id` int(11) NOT NULL,
  `numero_guia` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destinatario` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `transportadora` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `nit_cliente` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `fecha_pedido` date DEFAULT NULL,
  `fecha_despacho` date DEFAULT NULL,
  `direccion_entrega` text COLLATE utf8mb4_unicode_ci,
  `cant_items` int(11) DEFAULT '0',
  `total_flete` decimal(12,2) DEFAULT '0.00',
  `url_archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `url_vista` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `documento_id` (`documento_id`),
  CONSTRAINT `despachos_envio_ibfk_1` FOREIGN KEY (`documento_id`) REFERENCES `documentos_procesados` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Datos para la tabla `despachos_envio`
INSERT INTO `despachos_envio` (`id`, `documento_id`, `numero_guia`, `destinatario`, `transportadora`, `nit_cliente`, `fecha_pedido`, `fecha_despacho`, `direccion_entrega`, `cant_items`, `total_flete`, `url_archivo`, `url_vista`, `fecha_registro`) VALUES (3, 6, 'SHP-10261', 'Que Delícia', 'United Package', 'QUEDE', '2016-07-19', '2016-07-30', 'Rua Da Panificadora, 12, Rio De Janeiro, Brazil, (CP: 02389-673)', 2, 448.00, '/uploads/order_10261.pdf', '/uploads/order_10261_preview.jpg', '2026-10-05 16:03:43');

-- Estructura de tabla para `reportes_inventario`
DROP TABLE IF EXISTS `reportes_inventario`;
CREATE TABLE `reportes_inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento_id` int(11) NOT NULL,
  `identificador_reporte` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periodo_mensual` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `fecha_corte` date DEFAULT NULL,
  `categoria` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `id_categoria` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `unidades_vendidas` int(11) DEFAULT '0',
  `unidades_stock` int(11) DEFAULT '0',
  `url_archivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `url_vista` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `documento_id` (`documento_id`),
  CONSTRAINT `reportes_inventario_ibfk_1` FOREIGN KEY (`documento_id`) REFERENCES `documentos_procesados` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Datos para la tabla `reportes_inventario`
INSERT INTO `reportes_inventario` (`id`, `documento_id`, `identificador_reporte`, `periodo_mensual`, `fecha_corte`, `categoria`, `id_categoria`, `unidades_vendidas`, `unidades_stock`, `url_archivo`, `url_vista`, `fecha_registro`) VALUES (2, 10, 'StockReport-2016-09', '2016-09', '2016-09-01', 'Categoría: Confections', 'CAT-3', 1114, 1427, '/uploads/StockReport_2016-09.pdf', '/uploads/StockReport_2016-09_preview.jpg', '2026-10-05 16:04:29');
INSERT INTO `reportes_inventario` (`id`, `documento_id`, `identificador_reporte`, `periodo_mensual`, `fecha_corte`, `categoria`, `id_categoria`, `unidades_vendidas`, `unidades_stock`, `url_archivo`, `url_vista`, `fecha_registro`) VALUES (3, 11, 'StockReport-2016-09', '2016-09', '2016-09-01', 'Categoría: Confections', 'CAT-3', 1114, 1427, '/uploads/StockReport_2016-09.pdf', '/uploads/StockReport_2016-09_preview.jpg', '2026-10-05 16:05:29');

-- Estructura de tabla para `items_detalle`
DROP TABLE IF EXISTS `items_detalle`;
CREATE TABLE `items_detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento_id` int(11) NOT NULL,
  `tipo_documento` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_producto` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `nombre_producto` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` int(11) DEFAULT '0',
  `precio_unitario` decimal(10,2) DEFAULT '0.00',
  `subtotal` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `documento_id` (`documento_id`),
  CONSTRAINT `items_detalle_ibfk_1` FOREIGN KEY (`documento_id`) REFERENCES `documentos_procesados` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Datos para la tabla `items_detalle`
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (18, 6, 'Comprobante / Despacho de Envío', '1', 'Sir Rodney S Scones', 20, 8.00, 160.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (19, 6, 'Comprobante / Despacho de Envío', '2', 'Steeleye Stout', 20, 14.40, 288.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (20, 7, 'Orden de Compra', '41', 'Jack S New England Clam Chowder', 10, 7.70, 77.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (21, 7, 'Orden de Compra', '51', 'Manjimup Dried Apples', 35, 42.40, 1484.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (22, 7, 'Orden de Compra', '65', 'Louisiana Fiery Hot Pepper Sauce', 15, 16.80, 252.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (23, 8, 'Factura Comercial', '53', 'Perth Pasties', 15, 26.20, 393.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (24, 8, 'Factura Comercial', '77', 'Original Frankfurter Grüne Soße', 12, 10.40, 124.80);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (25, 9, 'Factura Comercial', '31', 'Gorgonzola Telino', 20, 10.00, 200.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (26, 9, 'Factura Comercial', '39', 'Chartreuse Verte', 42, 14.40, 604.80);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (27, 9, 'Factura Comercial', '49', 'Maxilaku', 40, 16.00, 640.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (28, 10, 'Reporte de Inventario', 'Beve', 'Chai', 20, 39.00, 18.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (29, 10, 'Reporte de Inventario', 'Beve', 'Chang', 40, 17.00, 19.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (30, 10, 'Reporte de Inventario', 'Beve', 'Chartreuse verte', 90, 69.00, 18.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (31, 10, 'Reporte de Inventario', 'Beve', 'Ipoh Coffee', 56, 17.00, 46.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (32, 10, 'Reporte de Inventario', 'Beve', 'Outback Lager', 55, 15.00, 15.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (33, 10, 'Reporte de Inventario', 'Beve', 'Rhönbräu Klosterbier', 10, 125.00, 7.75);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (34, 10, 'Reporte de Inventario', 'Beve', 'Sasquatch Ale', 14, 111.00, 14.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (35, 10, 'Reporte de Inventario', 'Cond', 'Chef Anton\'s Cajun..', 20, 53.00, 22.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (36, 10, 'Reporte de Inventario', 'Cond', 'Grandma\'s Boysenberry..', 30, 120.00, 25.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (37, 10, 'Reporte de Inventario', 'Cond', 'Louisiana Fiery Hot..', 30, 76.00, 21.05);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (38, 10, 'Reporte de Inventario', 'Cond', 'Louisiana Hot Spiced..', 30, 4.00, 17.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (39, 10, 'Reporte de Inventario', 'Conf', 'Maxilaku', 30, 10.00, 20.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (40, 10, 'Reporte de Inventario', 'Conf', 'Pavlova', 40, 29.00, 17.45);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (41, 10, 'Reporte de Inventario', 'Conf', 'Scottish Longbreads', 38, 6.00, 12.50);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (42, 10, 'Reporte de Inventario', 'Conf', 'Tarte au sucre', 125, 17.00, 49.30);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (43, 10, 'Reporte de Inventario', 'Conf', 'Teatime Chocolate..', 15, 25.00, 9.20);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (44, 10, 'Reporte de Inventario', 'Dair', 'Flotemysost', 5, 26.00, 21.50);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (45, 10, 'Reporte de Inventario', 'Dair', 'Gudbrandsdalsost', 23, 26.00, 36.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (46, 10, 'Reporte de Inventario', 'Dair', 'Mascarpone Fabioli', 40, 9.00, 32.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (47, 10, 'Reporte de Inventario', 'Dair', 'Mozzarella di Giovanni', 20, 14.00, 34.80);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (48, 10, 'Reporte de Inventario', 'Dair', 'Queso Cabrales', 12, 22.00, 21.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (49, 10, 'Reporte de Inventario', 'Dair', 'Raclette Courdavault', 40, 79.00, 55.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (50, 10, 'Reporte de Inventario', 'Grai', 'Gnocchi di nonna Alice', 24, 21.00, 38.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (51, 10, 'Reporte de Inventario', 'Grai', 'Singaporean Hokkien..', 8, 26.00, 14.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (52, 10, 'Reporte de Inventario', 'Meat', 'Alice Mutton', 40, 0.00, 39.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (53, 10, 'Reporte de Inventario', 'Meat', 'Perth Pasties', 30, 0.00, 32.80);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (54, 10, 'Reporte de Inventario', 'Meat', 'Thüringer Rostbratwurst', 25, 0.00, 123.79);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (55, 10, 'Reporte de Inventario', 'Meat', 'Tourtière', 5, 21.00, 7.45);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (56, 10, 'Reporte de Inventario', 'Prod', 'Rössle Sauerkraut', 32, 26.00, 45.60);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (57, 10, 'Reporte de Inventario', 'Seaf', 'Boston Crab Meat', 50, 123.00, 18.40);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (58, 10, 'Reporte de Inventario', 'Seaf', 'Carnarvon Tigers', 25, 42.00, 62.50);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (59, 10, 'Reporte de Inventario', 'Seaf', 'Escargots de Bourgogne', 30, 62.00, 13.25);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (60, 10, 'Reporte de Inventario', 'Seaf', 'Inlagd Sill', 52, 112.00, 19.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (61, 10, 'Reporte de Inventario', 'Seaf', 'Jack\'s New England..', 10, 85.00, 9.65);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (62, 11, 'Reporte de Inventario', 'Beve', 'Chai', 20, 39.00, 18.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (63, 11, 'Reporte de Inventario', 'Beve', 'Chang', 40, 17.00, 19.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (64, 11, 'Reporte de Inventario', 'Beve', 'Chartreuse verte', 90, 69.00, 18.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (65, 11, 'Reporte de Inventario', 'Beve', 'Ipoh Coffee', 56, 17.00, 46.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (66, 11, 'Reporte de Inventario', 'Beve', 'Outback Lager', 55, 15.00, 15.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (67, 11, 'Reporte de Inventario', 'Beve', 'Rhönbräu Klosterbier', 10, 125.00, 7.75);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (68, 11, 'Reporte de Inventario', 'Beve', 'Sasquatch Ale', 14, 111.00, 14.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (69, 11, 'Reporte de Inventario', 'Cond', 'Chef Anton\'s Cajun..', 20, 53.00, 22.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (70, 11, 'Reporte de Inventario', 'Cond', 'Grandma\'s Boysenberry..', 30, 120.00, 25.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (71, 11, 'Reporte de Inventario', 'Cond', 'Louisiana Fiery Hot..', 30, 76.00, 21.05);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (72, 11, 'Reporte de Inventario', 'Cond', 'Louisiana Hot Spiced..', 30, 4.00, 17.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (73, 11, 'Reporte de Inventario', 'Conf', 'Maxilaku', 30, 10.00, 20.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (74, 11, 'Reporte de Inventario', 'Conf', 'Pavlova', 40, 29.00, 17.45);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (75, 11, 'Reporte de Inventario', 'Conf', 'Scottish Longbreads', 38, 6.00, 12.50);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (76, 11, 'Reporte de Inventario', 'Conf', 'Tarte au sucre', 125, 17.00, 49.30);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (77, 11, 'Reporte de Inventario', 'Conf', 'Teatime Chocolate..', 15, 25.00, 9.20);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (78, 11, 'Reporte de Inventario', 'Dair', 'Flotemysost', 5, 26.00, 21.50);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (79, 11, 'Reporte de Inventario', 'Dair', 'Gudbrandsdalsost', 23, 26.00, 36.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (80, 11, 'Reporte de Inventario', 'Dair', 'Mascarpone Fabioli', 40, 9.00, 32.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (81, 11, 'Reporte de Inventario', 'Dair', 'Mozzarella di Giovanni', 20, 14.00, 34.80);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (82, 11, 'Reporte de Inventario', 'Dair', 'Queso Cabrales', 12, 22.00, 21.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (83, 11, 'Reporte de Inventario', 'Dair', 'Raclette Courdavault', 40, 79.00, 55.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (84, 11, 'Reporte de Inventario', 'Grai', 'Gnocchi di nonna Alice', 24, 21.00, 38.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (85, 11, 'Reporte de Inventario', 'Grai', 'Singaporean Hokkien..', 8, 26.00, 14.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (86, 11, 'Reporte de Inventario', 'Meat', 'Alice Mutton', 40, 0.00, 39.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (87, 11, 'Reporte de Inventario', 'Meat', 'Perth Pasties', 30, 0.00, 32.80);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (88, 11, 'Reporte de Inventario', 'Meat', 'Thüringer Rostbratwurst', 25, 0.00, 123.79);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (89, 11, 'Reporte de Inventario', 'Meat', 'Tourtière', 5, 21.00, 7.45);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (90, 11, 'Reporte de Inventario', 'Prod', 'Rössle Sauerkraut', 32, 26.00, 45.60);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (91, 11, 'Reporte de Inventario', 'Seaf', 'Boston Crab Meat', 50, 123.00, 18.40);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (92, 11, 'Reporte de Inventario', 'Seaf', 'Carnarvon Tigers', 25, 42.00, 62.50);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (93, 11, 'Reporte de Inventario', 'Seaf', 'Escargots de Bourgogne', 30, 62.00, 13.25);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (94, 11, 'Reporte de Inventario', 'Seaf', 'Inlagd Sill', 52, 112.00, 19.00);
INSERT INTO `items_detalle` (`id`, `documento_id`, `tipo_documento`, `codigo_producto`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES (95, 11, 'Reporte de Inventario', 'Seaf', 'Jack\'s New England..', 10, 85.00, 9.65);

SET FOREIGN_KEY_CHECKS = 1;
