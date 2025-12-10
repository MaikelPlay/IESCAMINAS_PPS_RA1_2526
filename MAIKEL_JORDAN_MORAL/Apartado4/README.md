# 4. Apartado 4: Blockchain (Solidity + Merkle Trees)

Este apartado contiene las evidencias del aprendizaje sobre Smart Contracts y una implementación propia de verificación criptográfica.

## 📸 Evidencia del Tutorial
A continuación se muestra la captura del tutorial "Solidity: Beginner to Intermediate Smart Contracts".

![Tutorial Solidity](./solidity_tutorial.png)

## ⛓️ Smart Contract: Merkle Validator

Se ha desarrollado el contrato `MerkleValidator.sol` que implementa la lógica de **Árboles de Merkle**.

### Explicación Técnica
Los Merkle Trees permiten verificar la integridad de grandes conjuntos de datos de manera eficiente.
* **Función:** El contrato almacena una `merkleRoot` (raíz) inmutable.
* **Verificación:** A través de la función `verify`, reconstruye el hash desde una hoja (`leaf`) utilizando una `proof` (ruta de hashes hermanos). Si el resultado coincide con la raíz, se confirma matemáticamente que el dato pertenece a la cadena original sin necesidad de almacenar todos los datos en la Blockchain.
*Capturas realizadas por Mikel Jordan Moral para la Práctica Puntuable RA1.*