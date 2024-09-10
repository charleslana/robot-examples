import http from "k6/http";
import { sleep, check } from "k6";

console.log(__ENV.STAGES_SET);

const env = JSON.parse(__ENV.STAGES_SET);

console.log(env);

export const options = {
  stages: env ?? [],
};

export default function () {
  const baseUrl = "https://serverest.dev";

  const response = http.get(`${baseUrl}/usuarios`);
  console.log(response.body);
  check(response, {
    "status should be 200": (res) => res.status === 200,
  });
  sleep(1);
}
