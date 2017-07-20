module Polinomios where

import Math.Core.Field ( F3, Q )
import Math.CommutativeAlgebra.Polynomial

-- * Orden de los monomios

-- ** Orden lexicográfico

-- $lexvar
-- 
-- __(lexvar v)__ es el polinomio, cuyo único monomio es la variable v,
-- sobre el cuerpo Q con el orden lexicográfico. Por ejemplo,
--
-- >>> let [x,y,z] = map lexvar ["x","y","z"]
-- >>> :type x
-- x :: LexPoly Q [Char]
-- >>> sum [1,x,y,z,x^2,x*y,x*z,y^2,y*z,z^2]
-- x^2+xy+xz+x+y^2+yz+y+z^2+z+1
-- >>> (x+y^2+z^4)^3
-- x^3+3x^2y^2+3x^2z^4+3xy^4+6xy^2z^4+3xz^8+y^6+3y^4z^4+3y^2z^8+z^12

-- ** Orden lexicográfico graduado

-- $glexvar
-- 
-- __(glexvar v)__ es el polinomio, cuyo único monomio es la variable v,
-- sobre el cuerpo Q con el orden lexicográfico graduado. Por ejemplo,
--
-- >>> let [x,y,z] = map glexvar ["x","y","z"]
-- >>> :type x
-- x :: GlexPoly Q [Char]
-- >>> sum [1,x,y,z,x^2,x*y,x*z,y^2,y*z,z^2]
-- x^2+xy+xz+y^2+yz+z^2+x+y+z+1
-- >>> (x+y^2+z^4)^3
-- z^12+3y^2z^8+3xz^8+3y^4z^4+6xy^2z^4+3x^2z^4+y^6+3xy^4+3x^2y^2+x^3

-- ** Orden lexicográfico graduado inverso

-- $grevlexvar
-- 
-- __(grevlexvar v)__ es el polinomio, cuyo único monomio es la variable v,
-- sobre el cuerpo Q con el orden lexicográfico graduado inverso. Por
-- ejemplo, 
--
-- >>> let [x,y,z] = map grevlexvar ["x","y","z"]
-- >>> :type x
-- x :: GrevlexPoly Q [Char]
-- >>> sum [1,x,y,z,x^2,x*y,x*z,y^2,y*z,z^2]
-- x^2+xy+y^2+xz+yz+z^2+x+y+z+1
-- >>> (x+y^2+z^4)^3
-- z^12+3y^2z^8+3xz^8+3y^4z^4+6xy^2z^4+y^6+3x^2z^4+3xy^4+3x^2y^2+x^3

-- * Polinomios sobre cuerpos finitos

-- $var
--
-- __(var v)__ es el polinomio, cuyo único monomio es la variable v,
-- sobre el cuerpo y orden indicado en su tipo. Por
-- ejemplo, 
--
-- >>> let [x,y,z] = map var ["x","y","z"] :: [GlexPoly F3 String]
-- >>> (x+y+z)^3
-- x^3+y^3+z^3
-- >>> let [x,y,z] = map var ["x","y","z"] :: [GlexPoly Q String]
-- >>> (x+y+z)^3
-- x^3+3x^2y+3x^2z+3xy^2+6xyz+3xz^2+y^3+3y^2z+3yz^2+z^3

-- * Descomposición de polinomios

-- $lm
--
-- __(lm p)__ es el monomio líder del polinomio p. Por ejemplo,
--
-- >>> let [x,y,z] = map glexvar ["x","y","z"]
-- >>> lm (x+2*x^2*y+5*y^4*x*z^2+7*x*y*z)
-- xy^4z^2

-- $mindices
--
-- __(mindices m)__ es la lista de los pares formados por las variables
-- del monomio m y sus exponentes. Por ejemplo,
--
-- >>> let [x,y,z] = map glexvar ["x","y","z"]
-- >>> let m = lm (x+2*x^2*y+5*y^4*x*z^2+7*x*y*z)
-- >>> m
-- xy^4z^2
-- >>> mindices m
-- [("x",1),("y",4),("z",2)]

-- * Valor de un polinomio

-- $eval
--
-- __(eval p vs)__ es el valor del polinomio p en la asignación vs,
-- donde vs es una lista de pares formados por variables y sus
-- valores. Por ejemplo. 
--
-- >>> let [x,y,z] = map glexvar ["x","y","z"]
-- >>> eval (x^2+y^2-z^2) [(x,3),(y,4),(z,5)]
-- 0
-- >>> eval (z+1) [(x,10),(y,-10),(z,5)]
-- 6

-- * Sustituciones en polinomios

-- $subst
--
-- __(eval p s)__ es el polinomio obtenido sustituyendo las variables
-- del polinomio p según la sustitución s, donde s es una lista de pares
-- formados por variables y sus valores. Por ejemplo. 
--
-- >>> let [x,y,z,x',y',z'] = map glexvar ["x","y","z","x'","y'","z'"]
-- >>> subst (x^2+y^2-z^2) [(x,(x'-z')/2),(y,y'),(z,(x'+z')/2)]
-- -x'z'+y'^2
