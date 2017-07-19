module Cuerpos where

import Math.Core.Field 

-- | En el módulo se deine el cuerpo Q de los racionales y los cuerpos
-- de Galois F2, F3, F4, F5, F7, F8, F9, F11, F13, F16, F17, F19, F23 y F25.

-- * Elementos de los cuerpos finitos

-- $elementos
--
-- __fp__ es la lista de los elementos del cuerpo Fp. Por ejemplo,
--
-- >>> let xs = f3
-- >>> xs
-- [0,1,2]
-- >>> :type xs
-- xs :: [F3]
-- >>> let xs = f5
-- >>> xs
-- [0,1,2,3,4]
-- >>> :type xs
-- xs :: [F5]

-- * Operaciones en cuerpos finitos

-- $operaciones
--
-- >>> 2*3 :: F5
-- 1
-- >>> 2*3 :: F4
-- 0
-- >>> 2+3 :: F5
-- 0
-- >>> 2*3 :: F5
-- 1
-- >>> 3^2 :: F5
-- 4

-- * Operaciones racionales

-- $racionales
--
-- >>> 2/6 + (3/6)^2 :: Q
-- 7/12
