import http from "k6/http";
import { sleep, check } from "k6";

export const options = {
  vus: 2,
  duration: "5s",
};

export default function () {
  const baseUrl = "https://serverest.dev";

  const response = http.get(`${baseUrl}/usuarios`);
  check(response, {
    "status should be 200": (res) => res.status === 200,
  });
  sleep(1); // utilizado para para por 1 segundo a cada requisição (normalmente sem sleep o mesmo se torna um DDoS[Ataque de negação de serviço])
}
