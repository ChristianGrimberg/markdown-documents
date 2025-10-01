\newpage

# Circuito de Enclavamiento de Puertas

![Pasillo de planta](docs/interlocked-doors/img/PasilloNovocap.png){ width=550px }

## Modos de funcionamiento con dos puertas

El sistema de Enclavamiento de dos puertas consta actualmente de tres modos de operación los cuáles se definen en el archivo `Operation.h` situado en en raíz del repositorio. Este archivo junto a `Parameters.h` son módulos de operación globales del programa, y precisamente en `Operation.h` se define el modo de operación de la siguiente manera:

```c
#define LOCKMODE MODE1

#define LOCKMODE MODE2

#define LOCKMODE MODE3

#define LOCKMODE MODE4
```

La directiva `#define` declara las constantes globales del programa. La constante `LOCKMODE` puede tomar los valores `MODE1`, `MODE2`,`MODE3` y `MODE4`. Estos modos descriptos de esta manera son los que definen el comportamiento de enclavamiento de cada puerta.

__`MODE1` (Modo de Operación 1)__: Este modo utiliza el enclamiento de dos puertas donde ambas comienzan bloqueadas ó cerradas. Las mismas pueden ser abiertas por su Reloj Biométrico así como sus Pulsadores NO respectivos. Este sistema no permite abrir las dos puertas al mismo tiempo. En el momento de que una puerta es abierta por un Reloj Biométrico ó Pulsador, el sistema no permite abrir la otra puerta por mas que el Reloj Biométrico o Pulsador respectivo se lo haya permitido.

__`MODE2` (Modo de Operación 2)__: Este modo utiliza el enclavamiento de dos puertas donde una puerta comienza bloqueda y la otra puerta comienza abierta. Para abrir la puerta bloqueda, la puerta abierta debe estar cerrada, y si la puerta bloqueada se abre, la puerta abierta queda cerrada y bloqueada hasta que la primer puerta se cierre. La puerta que comienza abierta no requiere de control de acceso biométrico ni pulsador de apertura.

__`MODE3` (Modo de Operación 3)__: Este modo utiliza el enclavamiento de dos puertas donde ambas se encuentran abiertas hasta que algunas de ellas es abierta y bloquea a la otra. Este escenario está pensado donde una de las puertas es una persiana eléctrica, y la otra lleva electroimán. Ambos accesos no utilizan sistema de apertura biométrico, ya que la persiana eléctrica utiliza un sistema de pulsadores para subir y bajar, y la puerta con electroimán es libre de controles de acceso.

__`MODE4` (Modo de Operación 4)__: Este modo utiliza el enclavamiento de dos puertas donde ambas se encuentran habilidadas para el acceso hasta que algunas de ellas es abierta y bloquea a la otra. En este escenario se encuentran las dos puertas con electroiman. Ninguno de los dos accesos utiliza sistema de apertura biométrico ni pulsadores de apertura. A su vez, cada puerta cuenta con un sensor magnético (adicional al que incluye el electroiman) que verifica el estado de la puerta donde se encuentra instalado.

### Materiales empleados

El circuito de enclavamiento para dos puertas consta de varios componentes:

* 2 Electroimanes
* 2 Sensores magnéticos
* 2 Relojes biométricos
* 3 Contactores NC/NO
* 1 Buzzer de 5V
* 1 Módulo de 4 Relay
* 1 Arduino UNO

### Conexión general entre los dispositivos

La conexión entre los dispositivos es comandada mediante la versión de Arduino UNO.

![EnclavamientoDosPuertas](docs/interlocked-doors/img/CircuitoArduino2v6.png)

### Configuración de los relojes

Los relojes biométricos de cada puerta necesitan de configurarse de acuerdo al circuito y al programa planteado en este repositorio. Con el programa __Access Control Software__ se puede configurar el tiempo de espera en el cambio de estado de los contactos (_Lock Control Delay_) ante una lectura correcta, y a su vez el tiempo de espera antes de accionar los contactos (_Senor. Delay_). Ambos tiempos se encuentran definidos en 20 ciclos por segundo, los cuáles se deben configurar según la siguiente imagen:

![DelayDeRelojes](docs/interlocked-doors/img/ClocksDelayTimes.png)

El _Senor. Mode_ debe ser configurado como _NOpen_ para que el mismo genere la apertura del contacto NC y el cierre del contacto NO en el momento de una registración correcta.

### Funcionamiento de los Electroimanes

El comportamiento de los sensores de los electroimanes se describen a continuación:

1. __Puerta cerrada__
    * _Electroimán energizado_: El contacto “NO” cierra circuito con el COM (hay continuidad con el tester) y el contacto NC abre circuito con el COM (sin continuidad con el tester). Luz verde.
    * _Electroimán SIN energía_: El contacto “NO” abre circuito con el COM (sin continuidad con el tester) y el contacto NC cierra circuito con el COM (hay continuidad con el tester). Luz apagada.

1. __Puerta abierta__
    * _Electroimán energizado_: El contacto “NO” abre circuito con el COM (sin continuidad con el tester) y el contacto NC cierra circuito con el COM (hay continuidad con el tester). Luz roja.
    * _Electroimán SIN energía_: El contacto “NO” abre circuito con el COM (sin continuidad con el tester) y el contacto NC cierra circuito con el COM (hay continuidad con el tester). Luz apagada.

En cuanto al comportamiento del LED del electroimán, tiene 3 estados:

* Luz roja: Prende siempre que la cerradura no este pegada.
* Luz verde: Prende siempre que la cerradura este pegada.
* Luz apagada: se apaga cuando la cerradura no está energizada.

### Funcionamiento de los Sensores magnéticos

El comportamiento de los sensores magnéticos se describen a continuación:

__`MODE1` (Modo de Operación 1)__:

Este modo no requiere de los sensores magnéticos adicionales ya que utiliza los sensores que incluyen los mismos electroimanes.

__`MODE2` (Modo de Operación 2)__:

Este modo no requiere de los sensores magnéticos adicionales ya que utiliza los sensores que incluyen los mismos electroimanes.

__`MODE3` (Modo de Operación 3)__:

1. __Puerta cerrada__:
     El contacto "NC" cierra el circuito con el COM (hay continuidad con el tester).

1. __Puerta abierta__:
     El contacto "NO" abre el circuito con el COM (sin continuidad con el tester).

__`MODE4` (Modo de Operación 4)__:

1. __Puerta cerrada__:
     El contacto "NC" cierra el circuito con el COM (hay continuidad con el tester).

1. __Puerta abierta__:
     El contacto "NO" abre el circuito con el COM (sin continuidad con el tester).

### Alimentación del circuito

Para alimentar el circuito se necesita una fuente con tensión de __12V__ para energizar los relojes biométricos, electroimanes y la placa Arduino UNO, para que luego este regule las tensiones de entrada de __5V__ definidos para el sensado, mediante los contactos de los relojes biométricos, electroimanes, pulsadores y relays. El amperaje que consume el circuito depende del modo que se utilice el enclavamiento, teniendo en cuenta los distintos dispositivos que se conectan. A continuación se describe el amperaje necesario para cada modo:

1. `MODE1`:
1. `MODE2`:
1. `MODE3`:
1. `MODE4`:

### Cableado y Canalización

El cableado utilizado para la interconexión de los distintos dispositivos del circuito es el cable de par trenzado de red UTP categoría 5E. La interconexión entre los diferentes dispositivos se centra en un tablero dedicado a tal fin.

Se decide utilizar una convención de colores para simplicar el armado del tablero central en área técnica, así como también para la interconexión entre este y los dispositivos de cada puerta. A su vez la convención de colores permite el fácil reemplazo de componentes, así como también la detección de fallas.

En el tablero se utilizan conectores de datos RJ45 que aceptan la conexión con los dispositivos de la puerta mediante Norma B, y la conexión de cada dispositivo se realiza de acuerdo al siguiente codificación de colores:

#### Canalización de Reloj Biométrico y Electroimán

* __(Marrón - Blanco Marrón)__: El color _Marrón_ se utiliza para transmitir __+12V__ de alimentación y el _Blanco Marrón_ se utiliza para transmitir __+12V__ que pasa por el contacto NO del Módulo Relay.
* __(Naranja - Blanco Naranja)__: El color _Naranja_ se utiliza para transmitir __+5V__ de alimentación (en puente al contacto NO del reloj biométrico y electroimán) y el _Blanco Naranja_ se utiliza para transmitir __GND__ de alimentación y sensado (en puente al contacto NC del reloj biométrico y electroimán).
* __(Celeste - Blanco Celeste)__: El color _Celeste_ se utiliza para transmitir __COM1__ del reloj biométrico, y el _Blanco Celeste_ se utiliza para transmitir __COM2__ del electroimán.
* __(Verde - Blanco Verde)__: El color _Verde_ se utiliza para transmitir __COM3__ y el _Blanco Verde_ para transmitir __COM4__, ambos definidos para contactos imantados para puertas y ventanas o para semáforo.

#### Canalización de Pulsador de Emergencia y Buzzer

* __(Naranja - Blanco Naranja)__: El color _Naranja_ se utiliza para transmitir __+5V__ al contacto NO del pulsador de emergencia, y el _Blanco Naranja_ se utiliza para transmitir __+5V__ del retorno del contacto NO que va directo a entrada digital de Arduino.
* __(Marrón - Blanco Marrón)__: El color _Marron_ se utiliza para transmitir __+12V__ al contacto NC del pulsador de emergencia, y el _Blanco Marrón_ se utiliza para transmitir __+12V__ del retorno del contacto NC que va al puente de __COM1__ y __COM2__ de los contactos del Relay.
* __(Celeste - Blanco Celeste)__: El color _Celeste_ se utiliza para transmitir el contacto NO del __COM4__ del Relay (El __COM4__ se alimenta con el positivo de la fuente del Buzzer de __+12V__), y el _Blanco Celeste_ se utiliza para enviar el negativo de la fuente del Buzzer.

### Configuración del Entorno de Desarrollo

Para configurar el Entorno de Desarrollo utilizado para esta solución se recomienda utilizar las siguientes herramientas de acuerdo a los pasos que se indican a continuación:

* Instalar el versionador de código de [__Git__](https://git-scm.com/) de acuerdo al sistema operativo utilizado (Windows/MAC OS/Linux).
* Utilizar una clave SSH y anexarla a su cuenta de [__GitHub__](https://github.com). Visite el siguiente vínculo para más información: [https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)
* De acuerdo a los permisos de acceso concedidos, el paso siguiente es clonar el repositorio remoto en un directorio local mediante el siguiente comando:

```git
git clone git@github.com:novocap/interlocked-doors.git
```

* Instalar el editor de código de [__Arduino IDE__](https://www.arduino.cc/en/Main/Software) según el sistema operativo utilizado (Windows/MAC OS/Linux), para contar con los componentes y librerías para programar y comunicarse con la placa Arduino UNO.

> No se recomienda la instalación de la App de Arduino desde la Tienda de Windows 8.1/10.

* Como opcional se recomienda instalar el editor de código [__Visual Studio Code__](https://code.visualstudio.com/) disponible para los mismos sistemas operativos Windows/MAC OS/Linux. Este editor puede utilizar los componentes y librerías del IDE de Arduino previamente instalado. Adicionalmente permite configurar el repositorio local de Git para gestionar los cambios en el código sobre el repositorio remoto.
* Dentro de las Extensiones del editor de Visual Studio Code, es necesario contar con las librerías, depurador y compilador de [__C/C++__](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools) o abriendo la barra de comandos (`Ctrl+P`) y ejecutando el comando `ext install ms-vscode.cpptools`. Para configurar su correcto uso se recomienda reviar el siguiente vínculo: [https://code.visualstudio.com/docs/languages/cpp#_getting-started](https://code.visualstudio.com/docs/languages/cpp#_getting-started).

![C/C++](docs/interlocked-doors/img/cpp-extension.png)

* Para poder compilar y subir programas de Arduino desde Visual Studio Code, es necesario instalar la extensión de [__Arduino__](https://marketplace.visualstudio.com/items?itemName=vsciot-vscode.vscode-arduino) o ejecutando el comando `ext install vsciot-vscode.vscode-arduino`. Para poder reutilizar los componentes y librerías del IDE de Arduino en Visual Studio Code, se recomienda configurarlo de acuerdo al siguiente vínculo: [https://marketplace.visualstudio.com/items?itemName=vsciot-vscode.vscode-arduino)](https://marketplace.visualstudio.com/items?itemName=vsciot-vscode.vscode-arduino)

![Arduino](docs/interlocked-doors/img/arduino-extension.png)

Adicionalmente, el repositorio cuenta con los archivos de configuración para su correcta ejecución en el IDE de Visual Studio Code. En este caso el archivo `c_cpp_properties.json` contiene la parametrización para la inclusión de librerías de Arduino en los sistemas operativos de Linux compatible con arquitecturas de 32 bits y 64 bits, además de los sistemas operativos Windows con una parametrización especial para la arquitectura de 32 bits y otra para la arquitectura de 64 bits.

#### Configuración de conexión desde Arduino a puerto USB

Para configurar la conexión desde Arduino a un puerto USB en específico, se realiza de la siguiente manera:

1. Sistemas operativos Linux basados en Debian

* En estos sistemas en específico, se debe configurar la conexión desde Arduino al puerto USB en dónde lo conectamos, ya      que por defecto no cuenta con los permisos necesarios para poder acceder al mismo.

_Para ello tendremos dos opciones de configuración:_

* __Gestión de acceso temporal desde el puerto USB:__ Mediante el comando __sudo chmod a+rw /dev/ttyACM0__ (en donde ttyACM0 es el puerto que figura como ejemplo), desde el Terminal, se asignan los permisos de lectura (_w_) y escritura (_r_) para el directorio /dev/ en dónde se almacenan los dispositivos esenciales (tales como discos duros, terminales, lectores, etcétera) el cuál también incluye dispositivos como Arduino.

* __Gestión de acceso definitivo desde el puerto USB__: Mediante el comando __sudo usermod -a -G dialout user__, desde el Terminal, reemplazando el campo __user__ por el nombre de usuario actual de la sesión iniciada en el equipo, se agrega al usuario mencionado al grupo en dónde va a tener los permisos necesarios para acceder al puerto específico en dónde Arduino esté conectado.

> __¡CUIDADO!__ Ésta opción otorga permisos sobre el puerto USB para el usuario actual. Queda bajo la responsabilidad del usuario realizar esta configuración de forma permanente. Es recomendable eliminar el permiso una vez finalizado el requerimiento mediante el comando __gpasswd -d user dialout__, desde el Terminal, reemplazando el campo _user_ por el nombre de usuario actual.

## 2. Sistemas operativos basados en Windows

* En el caso de Windows, éste permite por defecto el acceso de escritura sobre los puertos USB sobre el perfil del usuario actual, sin realizar pasos adicionales.

> Copyright Novocap 2018
