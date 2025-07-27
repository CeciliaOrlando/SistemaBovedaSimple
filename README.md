
Sistema de Bóveda Simple (Vault)
Este repositorio contiene un contrato inteligente de Ethereum que implementa un sistema de bóveda (Vault) básico, permitiendo a los usuarios depositar y retirar Ether (ETH) de forma segura. El contrato ha sido diseñado con énfasis en la seguridad, la modularidad (a través de la herencia) y la trazabilidad de las operaciones.

Características Principales
Depósitos de Ether: Los usuarios pueden enviar ETH al contrato de la bóveda para almacenarlo.

Retiros de Ether: Los usuarios pueden retirar su ETH depositado en cualquier momento, siempre y cuando tengan saldo suficiente.

Control de Propiedad: El contrato tiene un owner (propietario) que es la dirección que lo despliega, con la posibilidad de añadir funciones restringidas al propietario en el futuro (aunque no implementadas en este ejemplo simple).

Matemáticas Seguras: Utiliza la librería SafeMath de OpenZeppelin para prevenir vulnerabilidades comunes como los desbordamientos (overflows) y subdesbordamientos (underflows) de enteros.

Eventos: Emite eventos claros (Deposit y Withdrawal) para registrar las transacciones en la blockchain, facilitando el seguimiento y la integración con interfaces de usuario.

Validaciones Robusta: Implementa require() para asegurar que las operaciones (depósitos/retiros) cumplan con condiciones predefinidas, como no permitir depósitos de 0 ETH o retiros sin fondos suficientes.

Herencia de Contratos: El sistema está estructurado usando herencia (VaultManager hereda de VaultBase) para promover la modularidad, la reutilización de código y una mejor organización del proyecto.

Estructura del Contrato
El sistema de bóveda está compuesto por dos contratos Solidity:

VaultBase.sol
Este es el contrato base que define la estructura fundamental y la lógica compartida de la bóveda.

Gestiona el mapeo de balances de los usuarios.

Declara los eventos Deposit y Withdrawal.

Establece el owner del contrato.

Incluye un modificador onlyOwner.

VaultManager.sol
Este es el contrato derivado que hereda de VaultBase e implementa la lógica específica para las operaciones de depósito y retiro.

Función deposit(): Permite a cualquier usuario depositar ETH en la bóveda.

Función withdraw(uint256 _amount): Permite a un usuario retirar una cantidad específica de su ETH.

Incluye una función receive() para manejar ETH enviado directamente al contrato sin llamar a una función específica, redirigiéndolo al deposit().

Dependencias
Este contrato utiliza la siguiente librería de OpenZeppelin Contracts para operaciones matemáticas seguras:

@openzeppelin/contracts/utils/math/SafeMath.sol

Asegúrate de que esta dependencia esté disponible en tu entorno de compilación (por ejemplo, en Remix IDE, o si estás compilando localmente, instálala vía npm: npm install @openzeppelin/contracts).

Cómo Usar y Probar (Remix IDE)
Sigue estos pasos para compilar, desplegar e interactuar con el contrato en Remix IDE:

Abrir en Remix: Ve a remix.ethereum.org.

Crear Archivo: Crea un nuevo archivo (ej. Vault.sol) y pega todo el código fuente del contrato.

Compilar el Contrato:

Navega a la pestaña "Solidity Compiler" (icono del compilador, usualmente el tercero en la barra lateral izquierda).

Asegúrate de que la versión del compilador sea 0.8.0 o superior (ej., 0.8.25).

Haz clic en "Compile Vault.sol". Deberías ver una confirmación de éxito.

imagenes/Contrato boveda compilado.png


Desplegar el Contrato:

Ve a la pestaña "Deploy & Run Transactions" (icono de Ethereum con flecha, usualmente el cuarto en la barra lateral izquierda).

En "Environment", selecciona Remix VM (Shanghai) o cualquier otra opción de "Remix VM" disponible. Esto te proporcionará cuentas de prueba con Ether ficticio.

En el desplegable "Contract", elige VaultManager (este es el contrato principal que contiene la lógica de negocio).

Haz clic en el botón "Deploy".

imagenes/ Contrato Boveda deploy.png

Interactuar con el Contrato Desplegado:
Una vez que el contrato VaultManager esté desplegado (lo verás listado en la sección "Deployed Contracts"), podrás interactuar con sus funciones:

deposit: Selecciona una cuenta de prueba desde el desplegable "Account". En el campo "VALUE" (justo debajo de "Account"), introduce la cantidad de Ether que deseas depositar (ej. 1 ETH), y luego haz clic en el botón deposit.

withdraw: Para retirar, busca la función withdraw en el contrato desplegado. Introduce la cantidad de Wei (ej. 1000000000000000000 para 1 ETH) que deseas retirar y haz clic en withdraw.

getBalance(address): Para consultar el saldo de una dirección específica, introduce la dirección en el campo correspondiente de getBalance y haz clic en el botón.

Observa la consola de Remix para ver los eventos Deposit y Withdrawal emitidos por tus transacciones, así como los detalles de cada llamada.

Licencia
Este proyecto está bajo la licencia MIT. Consulta el archivo LICENSE para más detalles.




