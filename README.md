# Replicación estándar en MariaDB (3 nodos)
### Autores: Santiago Quirós Arenas, Saúl Ruiz Plaza, Mario Palacios Moreno y Diego Villarejo Conde

Actividad práctica para aprender a configurar **replicación estándar en MariaDB** utilizando **tres servidores**, con enfoque en alta disponibilidad, réplicas de solo lectura y control del proceso de replicación.

## Objetivos de aprendizaje

Al finalizar esta actividad el alumnado será capaz de:

- Configurar replicación estándar en MariaDB.
- Entender el funcionamiento del **binlog** y los **hilos de replicación**.
- Trabajar con réplicas de solo lectura.
- Aplicar **replicación basada en filas**.
- Configurar replicación paralela.
- Aplicar filtros de replicación por base de datos.
- Configurar replicación retardada.
- Analizar el estado de la replicación mediante variables del sistema.
- Comprender el uso de **instantáneas consistentes**.
- Conocer el proceso de cambio de roles entre servidores.

## Infraestructura

Se trabajará con **tres servidores MariaDB**:

| Servidor | Rol | server_id |
|--------|-----|-----------|
| db1 | Master | 1 |
| db2 | Replica | 2 |
| db3 | Replica (retardada) | 3 |

Todos los servidores deben:
- Tener MariaDB instalado
- Poder comunicarse entre sí por red


## Base de datos proporcionada

El **schema se proporciona ya hecho**.  
No debe modificarse durante la actividad.

> La base de datos se crea **solo en el servidor master**.

[Schema de la base de datos.](schema.sql)

## Actividades a realizar

### 1. Configuración inicial
- Asignar un `server_id` único a cada servidor.
- Activar el registro binario (binlog) en el master.
- Crear un usuario específico para replicación.
- Conectar las réplicas al servidor master.


### 2. Replicación estándar
- Configurar la replicación:
  - Basada en filas (ROW)
  - Con checksum del binlog
- Comprobar que los datos insertados en el master se replican correctamente.


### 3. Réplicas de solo lectura
- Configurar las réplicas para que no permitan operaciones de escritura.
- Verificar que un `INSERT` ejecutado en una réplica falle.


### 4. Replicación paralela
- Activar replicación paralela en las réplicas.
- Comprobar el número de workers activos.


### 5. Filtros de replicación
- Configurar las réplicas para que solo se replique la base de datos `ventas`.
- Crear otra base de datos de prueba y comprobar que no se replica.


### 6. Replicación retardada
- Configurar el servidor `db3` con un retraso de 60 segundos.
- Insertar datos en el master y comprobar el desfase temporal.


### 7. Estado de la replicación
- Analizar:
  - `SHOW MASTER STATUS`
  - `SHOW SLAVE STATUS`
- Identificar:
  - Posición del binlog
  - Estado de los hilos IO y SQL
  - Posibles errores


### 8. Instantánea consistente
- Ejecutar:
```sql
START TRANSACTION WITH CONSISTENT SNAPSHOT;
```

### 9. Cambio de roles (opcional)

Describir los pasos necesarios para:
  - Convertir una réplica en servidor master
  - Reconfigurar el resto de réplicas

No es obligatorio ejecutar el cambio de rol, solo explicar el procedimiento.

## Entregables
  - Comandos ejecutados (copiados o capturas de terminal).
  - Breve explicación de cada apartado.
  - Evidencias de funcionamiento de la replicación (datos insertados en master y replicados en las réplicas).
  - Comprobaciones de replicación retardada y paralela.