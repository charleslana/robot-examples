import http from "k6/http";
import { sleep, check, group } from "k6";
import { htmlReport } from "./libs/k6-reporter-bundle.js";

export function handleSummary(data) {
  return {
    "results/summary.html": htmlReport(data),
  };
}

console.log(__ENV.STAGES_SET);

const env = JSON.parse(__ENV.STAGES_SET);

console.log(env);

export const options = {
  stages: env ?? [],
  thresholds: {
    http_req_duration: ["p(95)<1000"],
    iteration_duration: ["max<4000"],
  },
};

export default function () {
  const baseUrl = "https://serverest.dev";

  const response = http.get(`${baseUrl}/usuarios`, {
    tags: {
      my_tag: "I'm a tag",
    },
  });
  console.log(response.body);
  check(
    response,
    {
      "status should be 200": (res) => res.status === 200,
    },
    { my_tag: "I'm a tag" }
  );
  sleep(1);

  group("Example group", () => {
    let res = http.get(`${baseUrl}/usuarios`);

    check(res, {
      "NOT 500": (r) => r.status !== 500,
    });

    check(res, {
      "NOT 429": (r) => r.status !== 429,
    });

    check(res, {
      "NOT 502": (r) => r.status !== 502,
    });

    check(res, {
      "NOT 504": (r) => r.status !== 504,
    });

    sleep(1);
  });
}
