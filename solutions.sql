USE gambling;

-- Pregunta 01: 
-- Usando la tabla o pestaña de clientes, por favor escribe una consulta SQL que muestre Título, Nombre y Apellido y Fecha de Nacimiento para cada uno de los clientes. 
-- No necesitarás hacer nada en Excel para esta.

SELECT 
    Title 'Título',
    FirstName Nombre,
    LastName Apellido,
    DateOfBirth 'Fecha de nacimiento'
FROM
    customer;
    
 -- Pregunta 02: 
 -- Usando la tabla o pestaña de clientes, por favor escribe una consulta SQL que muestre el número de clientes en cada grupo de clientes (Bronce, Plata y Oro). 
 -- Puedo ver visualmente que hay 4 Bronce, 3 Plata y 3 Oro pero si hubiera un millón de clientes ¿cómo lo haría en Excel?   
 
SELECT 
    CASE
        WHEN LOWER(CustomerGroup) LIKE 'bronze' THEN 'Bronce'
        WHEN LOWER(CustomerGroup) LIKE 'silver' THEN 'Plata'
        WHEN LOWER(CustomerGroup) LIKE 'gold' THEN 'Oro'
    END AS Grupo_de_cliente,
    COUNT(*) 'Total Clientes'
FROM
    customer
GROUP BY Grupo_de_cliente;

-- Pregunta 03: 
-- El gerente de CRM me ha pedido que proporcione una lista completa de todos los datos para esos clientes en la tabla de clientes
-- pero necesito añadir el código de moneda de cada jugador para que pueda enviar la oferta correcta en la moneda correcta. 
-- Nota que el código de moneda no existe en la tabla de clientes sino en la tabla de cuentas.
-- Por favor, escribe el SQL que facilitaría esto. ¿Cómo lo haría en Excel si tuviera un conjunto de datos mucho más grande?
 
SELECT 
    T1.*, T2.CurrencyCode
FROM
    customer AS T1
        JOIN
    account T2 ON T1.CustId = T2.CustId;

-- Pregunta 04: 
-- Ahora necesito proporcionar a un gerente de producto un informe resumen que muestre, por producto y por día, cuánto dinero se ha apostado en un producto particular. 
-- TEN EN CUENTA que las transacciones están almacenadas en la tabla de apuestas y hay un código de producto en esa tabla que se requiere buscar (classid & categoryid) para determinar a qué familia de productos pertenece esto.
-- Por favor, escribe el SQL que proporcionaría el informe. 
-- Si imaginas que esto fue un conjunto de datos mucho más grande en Excel, ¿cómo proporcionarías este informe en Excel?
