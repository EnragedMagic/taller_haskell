# Taller: Gestión de Inventario en Haskell

Este proyecto implementa un sistema básico de gestión de inventario en **Haskell**, usando una lista de tuplas `(nombre, precioCOP, cantidad)` para representar los productos. Cada función devuelve un nuevo inventario en lugar de modificar el original (inmutabilidad).

## Funciones implementadas
- `addProduct` → agrega un nuevo producto.  
- `updateQuantity` → actualiza la cantidad (stock) de un producto.  
- `removeProduct` → elimina un producto por nombre.  
- `updatePrice` → cambia el precio de un producto.  
- `findProduct` → busca un producto y devuelve `(precio, cantidad)` o `Nothing`.  
- `applyDiscount` → aplica un descuento (%) a todos los productos.  
- `inventorySummary` → devuelve `(unidadesTotales, valorTotalCOP)` del inventario.

## Cómo correr el código
1. Guardar el archivo como `inventario.hs`.  
2. Abrir terminal/PowerShell en la carpeta y ejecutar:  
   ```bash
   ghci inventario.hs


## Hecho por Johan Steven Galeano Gonzalez 
