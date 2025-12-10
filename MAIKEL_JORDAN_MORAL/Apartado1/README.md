# 1. Apartado 1: App Python (Cifrado César) y Tests Unitarios

Este apartado cumple con el requisito de crear una aplicación sencilla de ciberseguridad y realizar 4 tests unitarios para verificar su funcionalidad.

## ⚙️ Código y Lógica

* **Archivo:** `cifrado.py`
* **Modelo de Ejecución:** Interpretado (Python).
* **Función:** La función `cifrado_cesar(texto, desplazamiento)` cifra y descifra texto utilizando el método de sustitución César. Maneja letras mayúsculas, minúsculas y conserva otros caracteres (espacios, símbolos).
* **Tests Unitarios:** Se incluye la clase `TestCifradoCesar` que hereda de `unittest.TestCase` y contiene 4 métodos de prueba para verificar:
    1. Cifrado básico (`test_cifrado_basico`).
    2. Descifrado usando desplazamiento negativo (`test_descifrado`).
    3. Conservación de caracteres no alfabéticos (`test_mantiene_simbolos`).
    4. Manejo del "wrap-around" (de 'Z' a 'A') (`test_vuelta_alfabeto`).

## 💻 Ejecución y Resultado

Para ejecutar el código y las pruebas unitarias en la terminal, use el siguiente comando (asumiendo que tiene Python instalado):

```bash
python cifrado.py