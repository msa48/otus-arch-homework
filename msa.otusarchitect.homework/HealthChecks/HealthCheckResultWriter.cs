using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using System;
using System.Threading.Tasks;

namespace msa.otusarchitect.homework.HealthChecks
{
    internal class HealthCheckResultWriter
    {
        public HealthCheckResultWriter()
        {
        }

        internal Task Write(HttpContext context, HealthReport report)
        {
            return context.Response.WriteAsJsonAsync<HealthCheckResponse>(new HealthCheckResponse
            {
                Status = "OK"
            });
        }
    }
}