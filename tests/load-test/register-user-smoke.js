import http from "k6/http";
import { sleep, check } from "k6";
import { crypto } from "k6/experimental/webcrypto";

export const options = {
  vus: 1,
  duration: "1m",
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
  console.log(response.body);
  check(response, {
    "status should be 201": (res) => res.status === 201,
  });
  sleep(1);
}
