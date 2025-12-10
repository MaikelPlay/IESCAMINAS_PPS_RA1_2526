import unittest

# Lógica de la aplicación
def cifrado_cesar(texto, desplazamiento):
    resultado = ""
    for char in texto:
        if char.isalpha():
            start = ord('A') if char.isupper() else ord('a')
            # Fórmula de cifrado: (caracter - inicio + desplazamiento) % 26 + inicio
            resultado += chr((ord(char) - start + desplazamiento) % 26 + start)
        else:
            resultado += char
    return resultado

# Tests Unitarios
class TestCifradoCesar(unittest.TestCase):
    
    def test_cifrado_basico(self):
        # Test 1: Desplazamiento simple
        self.assertEqual(cifrado_cesar("HOLA", 1), "IPMB")

    def test_descifrado(self):
        # Test 2: Desplazamiento inverso (descifrado)
        self.assertEqual(cifrado_cesar("IPMB", -1), "HOLA")
        
    def test_mantiene_simbolos(self):
        # Test 3: No alterar espacios ni símbolos
        self.assertEqual(cifrado_cesar("HOLA MUNDO!", 1), "IPMB NVOEP!")
        
    def test_vuelta_alfabeto(self):
        # Test 4: Comprobar que Z pasa a A
        self.assertEqual(cifrado_cesar("Zebra", 1), "Afcsb")

if __name__ == '__main__':
    # Ejecución de la app y tests
    print("--- Ejecutando App de Ciberseguridad (Cifrado César) ---")
    mensaje = "Seguridad"
    encriptado = cifrado_cesar(mensaje, 3)
    print(f"Original: {mensaje} -> Cifrado (+3): {encriptado}")
    
    print("\n--- Ejecutando Tests Unitarios ---")
    unittest.main()