// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title MerkleValidator
 * @dev Contrato para la Práctica RA1 - Apartado 4.
 * Implementa la verificación básica de una prueba de Merkle (Merkle Proof).
 * Esto sirve como el ancla de seguridad (inicio de cadena) para validar datos off-chain.
 */
contract MerkleValidator {
    
    // La Raíz del árbol (Merkle Root) almacenada en la blockchain
    bytes32 public merkleRoot;

    // Evento para dejar constancia de verificaciones exitosas
    event Verified(address indexed sender, bytes32 leaf);

    constructor(bytes32 _merkleRoot) {
        merkleRoot = _merkleRoot;
    }

    /**
     * @dev Verifica si una hoja (leaf) es parte del árbol merkel utilizando la prueba (proof).
     * @param proof Array de hashes necesarios para reconstruir la raíz.
     * @param leaf El hash del dato que queremos verificar.
     */
    function verify(bytes32[] calldata proof, bytes32 leaf) public view returns (bool) {
        bytes32 computedHash = leaf;

        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];

            if (computedHash <= proofElement) {
                // Hash(actual + elemento_prueba)
                computedHash = keccak256(abi.encodePacked(computedHash, proofElement));
            } else {
                // Hash(elemento_prueba + actual)
                computedHash = keccak256(abi.encodePacked(proofElement, computedHash));
            }
        }

        // Si el hash calculado coincide con la raíz almacenada, el dato es válido
        return computedHash == merkleRoot;
    }
}