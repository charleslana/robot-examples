import http from "k6/http";
import { sleep, check } from "k6";
import { crypto } from "k6/experimental/webcrypto";
import { htmlReport } from "./libs/k6-reporter-bundle.js";

export function handleSummary(data) {
  return {
    "results/summary.html": htmlReport(data),
  };
}

export const options = {
  stages: [
    // estágios de teste de carga
    {
      duration: "1m",
      target: 100,
    }, // durante 1 minuto 100 usuários serão executados
    {
      duration: "2m",
      target: 100,
    }, // mantém por 2 minutos a carga de 100 usuários
    {
      duration: "1m",
      target: 0,
    }, // passou os 2 minutos começa a diminuir a carga até 0 durante 1 minuto
  ],
  thresholds: {
    http_req_duration: ["p(95)<2000"], // 95% da requisições devem responder em até 2 segundos
    http_req_failed: ["rate<0.01"], // 1% das requisições podem ocorrer erro
  },
};

export default function () {
  const baseUrl = "https://serverest.dev";
  const myUUID = crypto.randomUUID().substring(24);
  const payload = JSON.stringify({
    nome: "nome",
    email: `${myUUID}@email.com`,
    password: "123456",
    administrador: "false",
  });
  const headers = {
    headers: {
      "Content-Type": "application/json",
    },
  };

  const response = http.post(`${baseUrl}/usuarios`, payload, headers);
  check(response, {
    "status should be 201": (res) => res.status === 201,
  });
  sleep(1);
}
