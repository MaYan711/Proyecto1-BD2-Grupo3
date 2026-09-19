// Prueba de carga (Fase 6) contra la tabla `operaciones`.
//
// se necesita la extension xk6-sql
//
// Variables de entorno:
//   PGHOST     - IP del proxy o del nodo a probar (default: Nodo 3 directo)
//   PGPORT     - puerto del proxy (6432) o del nodo directo (5432)
//   PGUSER     - default: app_databaugs
//   PGPASS     - password del usuario de aplicacion
//   PGDB       - default: databaugs
//   READ_ONLY  - "true" para forzar 100% SELECT (usar cuando el objetivo
//                es Nodo 3 solo, o el escenario de contingencia de la
//                Fase 6 paso 5 con Nodo 1 y Nodo 2 apagados). Sin esto,
//                un intento de escritura contra Nodo 3 simplemente fallaria
//                (su usuario solo tiene SELECT), ensuciando los resultados
//                con errores que no son el fallo que se quiere medir.
//   VUS        - cantidad de usuarios virtuales (default: 10)
//   DURATION   - duracion de la prueba (default: 2m)

import sql from "k6/x/sql";
import driver from "k6/x/sql/driver/postgres";

const host = __ENV.PGHOST || "100.89.187.125";
const port = __ENV.PGPORT || "5432";
const user = __ENV.PGUSER || "app_databaugs";
const pass = __ENV.PGPASS || "";
const db = __ENV.PGDB || "databaugs";

const soloLectura = (__ENV.READ_ONLY || "false").toLowerCase() === "true";
const vus = parseInt(__ENV.VUS || "10", 10);
const duration = __ENV.DURATION || "2m";

const connString = `host=${host} port=${port} user=${user} password=${pass} dbname=${db} sslmode=disable`;
const conn = sql.open(driver, connString);

export const options = {
  scenarios: {
    carga_mixta: {
      executor: "constant-vus",
      vus: vus,
      duration: duration,
    },
  },
  thresholds: {
    // Se ajusta durante la Fase 6 segun los resultados observados.
    checks: ["rate>0.0"],
  },
};

export function teardown() {
  conn.close();
}

export default function () {
  // 70% lecturas, 30% escrituras en modo mixto; 100% lecturas si
  // READ_ONLY=true (escenario de contingencia, Nodo 3 solo).
  const esEscritura = !soloLectura && Math.random() < 0.3;

  if (esEscritura) {
    conn.exec(
      "INSERT INTO operaciones (descripcion, origen, valor) VALUES ($1, $2, $3)",
      `carga k6 vu-${__VU}-iter-${__ITER}`,
      "K6_LOAD_TEST",
      (Math.random() * 1000).toFixed(2)
    );
  } else {
    conn.query("SELECT id, origen, valor FROM operaciones ORDER BY fecha_registro DESC LIMIT 10");
  }
}
