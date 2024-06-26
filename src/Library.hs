module Library where
import PdePreludat
import Data.List (intersect)

type Cancion = String
data Artista = UnArtista {
    nombre :: String,
    canciones :: [Cancion]
} deriving(Eq, Show)

fitito :: Artista
fitito = UnArtista "Fitito Paez" ["11 y 6", "El amor despues del amor", "Mariposa Tecknicolor"]

calamardo :: Artista
calamardo = UnArtista "Andres Calamardo" ["Flaca", "Sin Documentos", "Tuyo siempre"]

paty :: Artista
paty = UnArtista "Taylor Paty" ["Shake It Off", "Lover"]

--Punto 1
letrasMinusculas :: Cancion -> Number
letrasMinusculas cancion = length (intersect cancion ['a'..'z'])

saberCalificacion :: Cancion -> Number
saberCalificacion = (10+).letrasMinusculas

--Punto 2
esBuenaCalificacion :: Cancion -> Bool
esBuenaCalificacion = (>20).saberCalificacion

sumaDeCalificaciones :: [Cancion] -> Number
sumaDeCalificaciones canciones = sum ( map saberCalificacion canciones)

esExitoso :: Artista -> Bool
esExitoso artista = ((>50).sumaDeCalificaciones)(filter esBuenaCalificacion (canciones artista))

--Punto 3
artistasExitosos :: [Artista] -> [Artista]
artistasExitosos = filter esExitoso 

--Punto 4
punto4:: [Artista] -> [Artista]
punto4 = filter (\artista -> ((>50).sum.map (\cancion -> ((+10).length) (intersect cancion ['a'..'z']))) (filter (\cancion -> ((>20).(+10).length) (intersect cancion ['a'..'z'])) (canciones artista))) 

