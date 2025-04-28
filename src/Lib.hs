module Lib () where

import Text.Show.Functions ()

doble :: Int -> Int
doble x = x * 2

data Personaje = UnPersonaje {
  nombre :: String,
  poderBasico :: Poder,
  superPoder :: Poder,
  superActivo :: Bool,
  vida :: Int
} deriving Show

data Poder
  = BolaEspinosa
  | LluviaDeTuercasSanadora
  | LluviaDeTuercasDanina
  | GranadaDeEspinas Int  
  | TorretaCurativa
  deriving Show

espina :: Personaje
espina = UnPersonaje {
  nombre = "Espina",
  poderBasico = BolaEspinosa,
  superPoder = GranadaDeEspinas 5,
  superActivo = True,
  vida = 4800
}

pamela :: Personaje
pamela = UnPersonaje {
  nombre = "Pamela",
  poderBasico = LluviaDeTuercasSanadora,
  superPoder = TorretaCurativa,
  superActivo = False,
  vida = 9600
}

bolaEspinosa :: Personaje -> Personaje
bolaEspinosa enemigo = enemigo { vida = max 0 (vida enemigo - 1000) }

lluviaDeTuercasSanadora :: Personaje -> Personaje
lluviaDeTuercasSanadora companero = companero { vida = vida companero + 800 }

lluviaDeTuercasDanina :: Personaje -> Personaje
lluviaDeTuercasDanina enemigo = enemigo { vida = vida enemigo `div` 2 }
