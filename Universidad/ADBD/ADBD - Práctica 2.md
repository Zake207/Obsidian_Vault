## Diagrama
![[Pasted image 20250925115848.png]]
## Descripción
### Farmacia
La entidad farmacia es de la que dependen todas las demás entidades, puede fabricar medicamentos, comprárselos a los laboratorios o reservar ventas de estos a clientes afiliados
### Medicina
La entidad medicina representa los medicamentos que se van a vender en la farmacia, debido que cada una puede servir para cierto tipo de padeceres se creo una jerarquía en donde un medicamento solo puede ser tratar un tipo de padecer.
Estos medicamentos pueden ser fabricados tanto por la farmacia como por los laboratorios.
+ id: ENTERO (00254, 52419, 04087)
+ nombre: CADENA (Paracetamol, Amoxicilina, Ibuprofeno)
- precio: DECIMAL (5.99, 12.50, 3.20)
- vendidos: ENTERO (150, 320, 50)
- stock: ENTERO (80, 200, 30)
### Laboratorio
La entidad laboratorio representa los laboratorios afiliados a la farmacia, pueden fabricar medicamentos o venderlos a la farmacia.
- id: ENTERO (501, 502, 503)
- nombre: CADENA (Pfizer, Bayer, Roche)
- dirección: CADENA (Av. Siempre Viva 742, Calle Mayor 120, Carretera Nacional 55)
- teléfono: CADENA (555-1234, 911-2020, 600-4589)
- fax: CADENA (555-4321, 911-3030, 600-4590)
- contacto: CADENA (contacto@pfizer.com, info@bayer.com, soporte@roche.com)
### Cliente
La entidad cliente representa a aquellos afiliados que generan pedidos periódicamente a la farmacia
- id: ENTERO (901, 902, 903) 
- nombre: CADENA (Juan Pérez, Ana Gómez, Carlos Torres)
- dirección: CADENA (Calle Luna 33, Av. Sol 45, Paseo Central 100)
- teléfono: CADENA (666-1122, 777-3344, 888-5566)
- fecha de pago: FECHA (2023-09-21, 2023-10-05, 2023-11-02)
- unidades: ENTERO (2, 5, 10)
- compra: CADENA (Paracetamol, Vacuna COVID, Ibuprofeno)

