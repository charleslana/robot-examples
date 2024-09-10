import http from "k6/http";
import { sleep, check } from "k6";
// import { htmlReport } from "./libs/k6-reporter-bundle.js";

// export function handleSummary(data) {
//   return {
//     "results/summary.html": htmlReport(data),
//   };
// }

export const options = {
  // vus: 1,
  // duration: "1s",
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
  const baseUrl =
    "https://dev.telebras.com.br/scc-backend/api/circuito-service/contratar-acesso";
  const payload = JSON.stringify({
    designacaoTelebras: "MGRSIA00099",
    localidade: "Arena MRV",
    endereco: "Rua Cristina Maria de Assis, 204 - Califórnia",
    cep: "30855-440",
    municipio: "Belo Horizonte",
    uf: "MG",
    latitude: "-19.930319",
    longitude: "-44.014972",
    nomeFornecedor: "Nome do fornecedor temporario enlace criado",
    codigoCircuito: "BRRSI000053",
    nomeCliente: "Nome do cliente enlace criado",
    estacaoClienteId: "1231ARR",
    dataContratoCliente: "2023-02-12 00:00:00.000",
    designacaoFornecedor:
      "Designação do fornecedor temporario enlace criado 001",
    tipoServico: "SDWAN 200",
    bandaContratada: 200,
    tipoAcesso: "ACESSO",
    nomeAtividade: "CONTRATAR_ACESSO",
    responsavel: "VITOR4",
    atividadeDateTime: "2023-02-11 00:00:00.000",
    tipoOs: "1234567890",
    numeroOs: 1,
  });
  const headers = {
    headers: {
      "Content-Type": "application/json",
      Cookie:
        "jwt-token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsImlhdCI6MTcyNTk3ODQ1NSwiZXhwIjoxNzI2MDY0ODU1fQ.JCZo_AHVAGuWM018dUUnE9Rcvey6may_wPC8Ae_UYp8",
    },
  };

  const response = http.post(`${baseUrl}`, payload, headers);
  console.log(response.body);
  check(response, {
    "status should be 201": (res) => res.status === 201,
  });
  sleep(1);
}
