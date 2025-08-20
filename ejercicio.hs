
-- Cada producto: (nombre, precio, cantidad)

-- 1) Agregar un nuevo producto
addProduct :: [(String, Double, Int)] -> String -> Double -> Int -> [(String, Double, Int)]
addProduct inv name price qty = inv ++ [(name, price, qty)]

-- 2) Actualizar la cantidad (stock) de un producto
updateQuantity :: [(String, Double, Int)] -> String -> Int -> [(String, Double, Int)]
updateQuantity [] _ _ = []
updateQuantity ((n, p, q):xs) name newQty
  | n == name = (n, p, newQty) : xs
  | otherwise = (n, p, q) : updateQuantity xs name newQty

-- 3) Eliminar un producto
removeProduct :: [(String, Double, Int)] -> String -> [(String, Double, Int)]
removeProduct [] _ = []
removeProduct ((n, p, q):xs) name
  | n == name = xs
  | otherwise = (n, p, q) : removeProduct xs name

-- 4) Resumen del inventario: (unidades totales, valor total en COP)
inventorySummary :: [(String, Double, Int)] -> (Int, Double)
inventorySummary inv =
  let totalQty   = sum [q | (_, _, q) <- inv]
      totalValue = sum [fromIntegral q * p | (_, p, q) <- inv]
  in (totalQty, totalValue)

-- 5) Buscar producto por nombre: devuelve (precio, cantidad)
findProduct :: [(String, Double, Int)] -> String -> Maybe (Double, Int)
findProduct [] _ = Nothing
findProduct ((n, p, q):xs) name
  | n == name = Just (p, q)
  | otherwise = findProduct xs name

-- 6) Aplicar descuento (%) a todos los productos
applyDiscount :: [(String, Double, Int)] -> Double -> [(String, Double, Int)]
applyDiscount inv percent =
  [ (n, p * (1 - percent / 100), q) | (n, p, q) <- inv ]

-- 7) Actualizar el precio de un producto (COP)
updatePrice :: [(String, Double, Int)] -> String -> Double -> [(String, Double, Int)]
updatePrice [] _ _ = []
updatePrice ((n, p, q):xs) name newPrice
  | n == name = (n, newPrice, q) : xs
  | otherwise = (n, p, q) : updatePrice xs name newPrice

-- ---------------------------
-- Ejecución de ejemplo (main)
-- ---------------------------
main :: IO ()
main = do
  -- Inventario inicial
  let inv0 = [("Aceite de motor",35000,10),("Filtro de aire",18000,5)]
  putStrLn ("Inventario inicial: " ++ show inv0)

  -- Agregar producto
  let inv1 = addProduct inv0 "Pastillas de freno" 120000 3
  putStrLn ("Tras agregar 'Pastillas de freno': " ++ show inv1)

  -- Cambiar cantidad (stock)
  let inv2 = updateQuantity inv1 "Filtro de aire" 8
  putStrLn ("Cantidad actualizada de 'Filtro de aire' a 8: " ++ show inv2)

  -- Cambiar precio
  let inv3 = updatePrice inv2 "Filtro de aire" 15000
  putStrLn ("Precio actualizado de 'Filtro de aire' a 15000: " ++ show inv3)

  -- Aplicar descuento global (20%)
  let inv4 = applyDiscount inv3 20
  putStrLn ("Con 20% de descuento aplicado a todos: " ++ show inv4)

  -- Buscar un producto
  putStrLn ("Buscar 'Filtro de aire': " ++ show (findProduct inv4 "Filtro de aire"))

  -- Eliminar un producto
  let inv5 = removeProduct inv4 "Aceite de motor"
  putStrLn ("Tras eliminar 'Aceite de motor': " ++ show inv5)

  -- Resumen final
  putStrLn ("Resumen final (unidades, valor total COP): " ++ show (inventorySummary inv5))
